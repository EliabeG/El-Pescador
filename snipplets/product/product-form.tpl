{# /*============================================================================
  El Pescador - Formulario de Produto Profissional

  PLANO DE MELHORIAS (10 etapas):
  1. ✅ Adicionar classes ep- para consistência
  2. ✅ Melhorar exibição de preços
  3. ✅ Melhorar botão de compra
  4. ✅ Traduzir textos para PT-BR
  5. ✅ Melhorar mensagens de frete grátis
  6. ✅ Melhorar cálculo de frete
  7. ✅ Melhorar indicador de estoque
  8. ✅ Responsividade otimizada
  9. ✅ Melhorar acessibilidade
  10. ✅ Melhorar feedback visual
==============================================================================*/ #}

<div class="pt-md-3 {% if home_main_product %}mt-2 mt-md-0{% endif %} ep-product-form">

    {# Product name and breadcrumbs for product page #}

    {% if home_main_product %}
        {# Product name #}
        <h2 class="h4 h2-md mb-2 text-center text-md-left ep-product-title">{{ product.name }}</h2>
    {% else %}
        {% embed "snipplets/page-header.tpl" with {container: false, padding: false, page_header_class: 'text-md-left ep-page-header', page_header_title_class: 'js-product-name h4 h2-md mb-2 ep-product-name'} %}
            {% block page_header_text %}{{ product.name }}{% endblock page_header_text %}
        {% endembed %}
    {% endif %}

    {# Product SKU #}

    {% if settings.product_sku and product.sku %}
        <div class="font-smallest opacity-60 mb-3 text-center text-md-left ep-product-sku">
            {{ "SKU" | translate }}: <span class="js-product-sku ep-sku-value">{{ product.sku }}</span>
        </div>
    {% endif %}

    {# Product price #}

    <div class="price-container text-center text-md-left ep-price-container {% if home_main_product %}mb-3{% endif %}" data-store="product-price-{{ product.id }}">
        <div class="js-price-container mb-4 mb-md-3 ep-prices">
            <span class="d-inline-block ep-price-main">
                <div class="js-price-display ep-price" id="price_display" {% if not product.display_price %}style="display:none;"{% endif %} data-product-price="{{ product.price }}">{% if product.display_price %}{{ product.price | money }}{% endif %}</div>
            </span>
            <span class="d-inline-block ep-compare-price-wrap">
               <div id="compare_price_display" class="js-compare-price-display price-compare ep-compare-price" {% if not product.compare_at_price or not product.display_price %}style="display:none;"{% else %} style="display:block;"{% endif %}>{% if product.compare_at_price and product.display_price %}{{ product.compare_at_price | money }}{% endif %}</div>
            </span>
            {{ component('price-discount-disclaimer', {
                container_classes: 'font-smallest opacity-60 mt-2 mb-2 ep-discount-disclaimer',
            }) }}
            {{ component('price-without-taxes', {
                    container_classes: "mt-1 mb-2 font-smallest opacity-60 ep-price-taxes",
                })
            }}
            {{ component('payment-discount-price', {
                    visibility_condition: settings.payment_discount_price,
                    location: 'product',
                    container_classes: "text-accent font-small mt-2 ep-payment-discount",
                })
            }}
        </div>

        {{ component('subscriptions/subscription-price', {
            subscription_classes: {
                container: 'mb-3 ep-subscription-price',
                prices_container: 'd-flex justify-content-center justify-content-md-start align-items-center mb-1',
                price_compare: 'price-compare',
                price_with_subscription: 'order-first',
                discount_container: 'text-accent font-small mt-2',
                price_without_taxes_container: 'my-2 font-smallest opacity-60',
            },
        }) }}

        {% set installments_info = product.installments_info_from_any_variant %}
        {% set hasDiscount = product.maxPaymentDiscount.value > 0 %}
        {% set show_payments_info = settings.product_detail_installments and product.show_installments and product.display_price and installments_info %}

        {% if not home_main_product and (show_payments_info or hasDiscount) %}
            <div {% if installments_info %}data-toggle="#installments-modal" data-modal-url="modal-fullscreen-payments"{% endif %} class="{% if installments_info %}js-modal-open js-fullscreen-modal-open{% endif %} js-product-payments-container mb-3 ep-payments-info" {% if not (product.get_max_installments and product.get_max_installments(false)) %}style="display: none;"{% endif %}>
        {% endif %}
            {% if show_payments_info %}
                {{ component('installments', {'location' : 'product_detail', container_classes: { installment: "mb-2 font-small ep-installments"}}) }}
            {% endif %}

            {% set hideDiscountContainer = not (hasDiscount and product.showMaxPaymentDiscount) %}
            {% set hideDiscountDisclaimer = not product.showMaxPaymentDiscountNotCombinableDisclaimer %}

            <div class="js-product-discount-container mb-2 font-small ep-discount-info" {% if hideDiscountContainer %}style="display: none;"{% endif %}>
                <span class="text-accent ep-discount-value">{{ product.maxPaymentDiscount.value }}% {{'de desconto' | translate }}</span> {{'pagando com' | translate }} {{ product.maxPaymentDiscount.paymentProviderName }}
                <div class="js-product-discount-disclaimer font-small opacity-60 mt-1 ep-discount-disclaimer" {% if hideDiscountDisclaimer %}style="display: none;"{% endif %}>
                    {{ "Nao acumulavel com outras promocoes" | translate }}
                </div>
            </div>
        {% if not home_main_product and (show_payments_info or hasDiscount) %}
                <a id="btn-installments" class="btn-link no-underline font-small ep-see-payments" {% if not (product.get_max_installments and product.get_max_installments(false)) %}style="display: none;"{% endif %}>
                  {% if not hasDiscount and not settings.product_detail_installments %}
                    {{ "Ver meios de pagamento" | translate }}
                  {% else %}
                    {{ "Ver mais detalhes" | translate }}
                  {% endif %}
                </a>
            </div>
        {% endif %}

        {# Product availability #}

        {% set show_product_quantity = product.available and product.display_price %}

        {# Free shipping minimum message #}
        {% set has_free_shipping = cart.free_shipping.cart_has_free_shipping or cart.free_shipping.min_price_free_shipping.min_price %}
        {% set has_product_free_shipping = product.free_shipping %}

        {% if not product.is_non_shippable and show_product_quantity and (has_free_shipping or has_product_free_shipping) %}
            <div class="js-free-shipping-minimum-message free-shipping-message font-small mt-2 mb-4 ep-free-shipping">
                <svg class="icon-inline mr-1 text-accent"><use xlink:href="#truck"/></svg>
                <span class="text-accent">{{ "Frete gratis" | translate }}</span>
                <span {% if has_product_free_shipping %}style="display: none;"{% else %}class="js-shipping-minimum-label"{% endif %}>
                    {{ "acima de" | translate }} <span>{{ cart.free_shipping.min_price_free_shipping.min_price }}
                </span>
                </span>
                {% if not has_product_free_shipping %}
                    <div class="js-free-shipping-discount-not-combinable font-small opacity-60 mt-1 ep-shipping-disclaimer">
                        {{ "Nao acumulavel com outras promocoes" | translate }}
                    </div>
                {% endif %}
            </div>
        {% endif %}
    </div>

    {{ component('promotions-details', {
        promotions_details_classes: {
            container: 'js-product-promo-container text-center text-md-left mb-2 ep-promo-container',
            promotion_title: 'font-small mb-1 mt-2 text-accent ep-promo-title',
            valid_scopes: 'font-small mb-0 ep-promo-scope',
            categories_combinable: 'font-small mb-0 ep-promo-categories',
            not_combinable: 'font-small opacity-60 mb-0 ep-promo-disclaimer',
            progressive_discounts_table: 'table mb-2 mt-3 ep-promo-table',
            progressive_discounts_hidden_table: 'table-body-inverted',
            progressive_discounts_show_more_link: 'btn-link btn-link-primary mb-4 ep-promo-more',
            progressive_discounts_show_more_icon: 'icon-inline icon-rotate-90',
            progressive_discounts_hide_icon: 'icon-inline icon-rotate-90-neg',
            progressive_discounts_promotion_quantity: 'font-weight-light text-lowercase'
        },
        accordion_show_svg_id: 'chevron',
        accordion_hide_svg_id: 'chevron',
    }) }}

    {# Product form, includes: Variants, CTA and Shipping calculator #}

     <form id="product_form" class="js-product-form mt-4 ep-add-cart-form" method="post" action="{{ store.cart_url }}" data-store="product-form-{{ product.id }}">
        <input type="hidden" name="add_to_cart" value="{{product.id}}" />
        {% if template == "product" %}
            {% set show_size_guide = true %}
        {% endif %}
        {% if product.variations %}
            {% include "snipplets/product/product-variants.tpl" with {show_size_guide: show_size_guide} %}
        {% endif %}

        {% if settings.last_product and show_product_quantity %}
            <div class="{% if product.variations %}js-last-product{% endif %} text-center text-md-left text-accent mb-3 ep-last-product"{% if product.selected_or_first_available_variant.stock != 1 %} style="display: none;"{% endif %}>
                <svg class="icon-inline mr-1"><use xlink:href="#alert"/></svg>
                {{ settings.last_product_text }}
            </div>
        {% endif %}

        <div class="row ep-form-actions {% if settings.product_stock %}mb-3{% else %}mb-4{% endif %}">
            {% if show_product_quantity %}
                {% include "snipplets/product/product-quantity.tpl" %}
            {% endif %}

            {{ component('subscriptions/subscription-selector', {
                subscription_classes: {
                    container: 'radio-button-container col-12 mt-2 mb-2 ep-subscription-selector',

                    radio_button: 'radio-button-item card p-3 mb-2 overflow-visible ep-radio-item',
                    radio_button_label: 'ml-1 ep-radio-label',
                    radio_button_text: 'row ep-radio-text',
                    radio_button_icon: 'radio-button-icons ep-radio-icon',

                    purchase_option_info_container: 'col-auto font-small pr-0 ep-option-info',
                    purchase_option_price: 'col text-right ep-option-price',
                    purchase_option_single_frequency: 'mt-2 pt-1 font-small opacity-80 ep-single-freq',
                    purchase_option_discount: 'label label-accent ml-2 py-1 ep-option-discount',

                    dropdown_container: 'form-group mt-3 mb-0 ep-dropdown',
                    dropdown_button: 'form-select p-2 ep-dropdown-btn',
                    dropdown_icon: 'form-select-icon icon-inline icon-w-14 icon-rotate-90 ep-dropdown-icon',
                    dropdown_options: 'form-select-options ep-dropdown-options',
                    dropdown_option: 'form-select-option row no-gutters ep-dropdown-option',
                    dropdown_option_info: 'col pr-4 ep-option-info',
                    dropdown_option_price: 'col-auto ep-option-price',
                    dropdown_option_discount: 'text-accent mt-1 ep-option-discount',

                    cart_alert: 'font-small text-center mt-2 ep-cart-alert',
                    shipping_message: 'font-small mb-3 ep-shipping-msg',
                    shipping_message_title: 'form-label mb-2 pb-1 ep-shipping-title',
                    shipping_message_text: 'box ep-shipping-text',

                    legal_message: 'font-smallest text-center w-100 mb-2 px-3 ep-legal-msg',
                    legal_link: 'font-smallest btn-link btn-link-primary p-0 ep-legal-link',
                    legal_modal: 'bottom modal-centered-small modal-centered transition-soft ep-legal-modal',
                    legal_modal_header: 'modal-header row no-gutters ep-legal-header',
                    legal_modal_title: 'col offset-2 ep-legal-title',
                    legal_modal_close_button: 'col-2 pr-3 pr-md-0 text-right ep-legal-close',
                    legal_modal_close_icon: 'icon-inline svg-icon-text',
                    legal_modal_body: 'mb-4 ep-legal-body',
                    legal_modal_details_title: 'mb-3 ep-legal-details-title',
                    legal_modal_details_paragraph: 'font-small pb-4 mb-0 ep-legal-paragraph',
                    legal_modal_details_link: 'font-small btn-link btn-link-primary p-0 ep-legal-details-link'
                },
                dropdown_icon: true,
                dropdown_icon_svg_id: 'chevron',

                legal_modal_close_icon_id: 'times',
            }) }}

            {% set state = store.is_catalog ? 'catalog' : (product.available ? product.display_price ? 'cart' : 'contact' : 'nostock') %}
            {% set texts = {'cart': "Adicionar ao carrinho", 'contact': "Consultar preco", 'nostock': "Sem estoque", 'catalog': "Consultar"} %}

            {% set btn_container_classes = show_product_quantity and not product.isSubscribable() ? 'col-8 pl-md-0' : 'col-12' %}

            <div class="js-buy-button-container {{ btn_container_classes }} ep-buy-btn-container {% if product.isSubscribable() %}mt-1{% endif %}">

                {# Add to cart CTA #}

                <input type="submit" class="js-addtocart js-prod-submit-form btn-add-to-cart btn btn-primary btn-big btn-block ep-add-to-cart {{ state }}" value="{{ texts[state] | translate }}" {% if state == 'nostock' %}disabled{% endif %} data-store="product-buy-button" data-component="product.add-to-cart" aria-label="{{ texts[state] | translate }}"/>

                {# Fake add to cart CTA visible during add to cart event #}

                {% include 'snipplets/placeholders/button-placeholder.tpl' with {custom_class: "btn-big"} %}

            </div>

            {% if settings.ajax_cart %}
                <div class="col-12">
                    <div class="js-added-to-cart-product-message font-small mt-2 mb-3 ep-added-msg" style="display: none;">
                        <span>
                            <svg class="icon-inline mr-1 text-accent"><use xlink:href="#check"/></svg>
                            {{'Voce ja adicionou este produto.' | translate }}<a href="#" class="js-modal-open js-open-cart js-fullscreen-modal-open btn-link font-small ml-1 text-center text-md-left ep-view-cart" data-toggle="#modal-cart" data-modal-url="modal-fullscreen-cart">{{ 'Ver carrinho' | translate }}</a>
                        </span>
                    </div>
                </div>
            {% endif %}

            {# Free shipping visibility message #}

            {% set free_shipping_minimum_label_changes_visibility = has_free_shipping and cart.free_shipping.min_price_free_shipping.min_price_raw > 0 %}

            {% set include_product_free_shipping_min_wording = cart.free_shipping.min_price_free_shipping.min_price_raw > 0 %}

            {% if not product.is_non_shippable and show_product_quantity and has_free_shipping and not has_product_free_shipping %}

                {# Free shipping add to cart message #}

                {% if include_product_free_shipping_min_wording %}

                    {% include "snipplets/shipping/shipping-free-rest.tpl" with {'product_detail': true} %}

                {% endif %}

                {# Free shipping achieved message #}

                <div class="js-product-form-free-shipping-message {% if free_shipping_minimum_label_changes_visibility %}js-free-shipping-message{% endif %} text-accent font-small mx-3 my-3 ep-free-shipping-achieved" {% if not cart.free_shipping.cart_has_free_shipping %}style="display: none;"{% endif %}>
                    <svg class="icon-inline mr-1"><use xlink:href="#check-circle"/></svg>
                    {{ "Otimo! Voce tem frete gratis" | translate }}
                </div>

            {% endif %}
        </div>

        {% if template == 'product' %}

            {% set show_product_fulfillment = settings.shipping_calculator_product_page and (store.has_shipping or store.branches) and not product.free_shipping and not product.is_non_shippable %}

            {% if show_product_fulfillment %}
                <div class="mb-4 ep-fulfillment {% if store.branches %}pb-2{% endif %}">

                    {# Shipping calculator and branch link #}

                    <div id="product-shipping-container" class="product-shipping-calculator list ep-shipping-calc" {% if not product.display_price or not product.has_stock %}style="display:none;"{% endif %} data-shipping-url="{{ store.shipping_calculator_url }}">
                        {% if store.has_shipping %}
                            {% include "snipplets/shipping/shipping-calculator.tpl" with {'shipping_calculator_variant' : product.selected_or_first_available_variant, 'product_detail': true} %}
                        {% endif %}
                    </div>

                    {% if store.branches %}
                        {# Link for branches #}
                        {% include "snipplets/shipping/branches.tpl" with {'product_detail': true} %}
                    {% endif %}
                </div>

            {% endif %}
        {% endif %}
     </form>
</div>

{% if not home_main_product %}
   {# Product payments details #}
    {% include 'snipplets/product/product-payment-details.tpl' %}
{% endif %}
