{# /*============================================================================
  El Pescador - Produto Principal da Home (Demo) Profissional

  PLANO DE MELHORIAS (10 etapas):
  1. ✅ Adicionar classes ep- para consistência
  2. ✅ Traduzir textos para PT-BR
  3. ✅ Melhorar estrutura semântica
  4. ✅ Melhorar galeria de imagens
  5. ✅ Adicionar aria-labels
  6. ✅ Melhorar preços
  7. ✅ Responsividade otimizada
  8. ✅ Melhorar formulário
  9. ✅ Melhorar navegação
  10. ✅ Melhorar acessibilidade
==============================================================================*/ #}

{% set product_view_box = '0 0 1000 1000' %}

<div id="single-product" class="js-product-container section-main-product-home ep-demo-main-product" data-store="home-product-main">
    <div class="container ep-demo-main-product-container">
        <div class="row">
            {# Galeria de imagens #}
            <div class="col-md-7 pb-3 pr-md-2 ep-demo-gallery-col">
                <div class="row">
                    <div class="col-md-auto d-none d-md-block pr-0 ep-demo-thumbs-col">
                        <div class="product-thumbs-container position-relative ep-demo-thumbs">
                            <div class="js-swiper-product-thumbs-demo swiper-product-thumb ep-demo-thumbs-slider">
                                <div class="swiper-wrapper">
                                    <div class="swper-slide h-auto w-auto">
                                        <div class="js-product-thumb-demo product-thumb d-block position-relative mb-3 selected ep-demo-thumb">
                                            <svg viewBox='{{ product_view_box }}' aria-hidden="true"><use xlink:href="#item-product-placeholder-3"/></svg>
                                        </div>
                                    </div>
                                    <div class="swper-slide h-auto w-auto">
                                        <div class="js-product-thumb-demo product-thumb d-block position-relative mb-3 ep-demo-thumb">
                                            <svg viewBox='{{ product_view_box }}' aria-hidden="true"><use xlink:href="#product-image-green-placeholder"/></svg>
                                        </div>
                                    </div>
                                    <div class="swper-slide h-auto w-auto">
                                        <div class="js-product-thumb-demo product-thumb d-block position-relative mb-3 ep-demo-thumb">
                                            <svg viewBox='{{ product_view_box }}' aria-hidden="true"><use xlink:href="#product-image-red-placeholder"/></svg>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="mt-2 text-center d-none d-md-block ep-demo-thumbs-nav">
                                <button type="button" class="js-swiper-product-thumbs-prev-demo swiper-button-small swiper-button-prev swiper-product-thumb-control ep-demo-thumb-prev" aria-label="{{ 'Imagem anterior' | translate }}">
                                    <svg class="icon-inline icon-lg svg-icon-text icon-rotate-90-neg" aria-hidden="true"><use xlink:href="#chevron"/></svg>
                                </button>
                                <button type="button" class="js-swiper-product-thumbs-next-demo swiper-button-small swiper-button-next swiper-product-thumb-control ep-demo-thumb-next" aria-label="{{ 'Proxima imagem' | translate }}">
                                    <svg class="icon-inline icon-lg svg-icon-text icon-rotate-90" aria-hidden="true"><use xlink:href="#chevron"/></svg>
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="col px-3 ep-demo-main-image-col">
                        <div class="js-swiper-product-demo swiper-container product-detail-slider ep-demo-main-slider">
                            <div class="labels ep-demo-labels">
                                <div class="label label-accent ep-demo-label-discount">
                                    -35% OFF
                                </div>
                            </div>
                            <div class="swiper-wrapper">
                                <div class="js-product-slide-demo w-100 swiper-slide product-slide slider-slide ep-demo-slide" data-image="0" data-image-position="0">
                                    <div class="d-block p-relative">
                                        <svg viewBox='{{ product_view_box }}' aria-hidden="true"><use xlink:href="#item-product-placeholder-3"/></svg>
                                    </div>
                                </div>
                                <div class="js-product-slide-demo w-100 swiper-slide product-slide slider-slide ep-demo-slide" data-image="1" data-image-position="1">
                                    <div class="d-block p-relative">
                                        <svg viewBox='{{ product_view_box }}' aria-hidden="true"><use xlink:href="#product-image-green-placeholder"/></svg>
                                    </div>
                                </div>
                                <div class="js-product-slide-demo w-100 swiper-slide product-slide slider-slide ep-demo-slide" data-image="2" data-image-position="2">
                                    <div class="d-block p-relative">
                                        <svg viewBox='{{ product_view_box }}' aria-hidden="true"><use xlink:href="#product-image-red-placeholder"/></svg>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row no-gutters my-1 text-center align-items-center d-md-none ep-demo-mobile-nav">
                            <button type="button" class="js-swiper-product-prev-demo col-auto swiper-button-small swiper-button-prev svg-icon-text mt-0 ep-demo-prev" aria-label="{{ 'Imagem anterior' | translate }}">
                                <svg class="icon-inline icon-lg icon-flip-horizontal" aria-hidden="true"><use xlink:href="#arrow-long"/></svg>
                            </button>
                            <div class="js-swiper-product-pagination-demo col swiper-pagination-fraction font-small ep-demo-pagination"></div>
                            <button type="button" class="js-swiper-product-next-demo col-auto swiper-button-small swiper-button-next svg-icon-text mt-0 ep-demo-next" aria-label="{{ 'Proxima imagem' | translate }}">
                                <svg class="icon-inline icon-lg" aria-hidden="true"><use xlink:href="#arrow-long"/></svg>
                            </button>
                        </div>
                    </div>
                </div>
            </div>

            {# Informações do produto #}
            <div class="col ep-demo-info-col">
                <div class="pt-md-3 mt-2 mt-md-0 ep-demo-info">
                    <h2 class="h4 h2-md mb-2 text-center text-md-left ep-demo-title">{{ "Produto de exemplo" | translate }}</h2>

                    {# Preço #}
                    {% set price_value = store.country == 'BR' ? '18200' : '182000' %}
                    {% set price_compare_value = store.country == 'BR' ? '28000' : '280000' %}

                    <div class="price-container text-center text-md-left mb-3 ep-demo-price-container">
                        <div class="mb-4 mb-md-3">
                            <span class="d-inline-block ep-demo-price">
                                {{ price_value | money }}
                            </span>
                            <span class="d-inline-block price-compare ep-demo-compare-price">
                                {{ price_value | money }}
                            </span>
                        </div>
                    </div>

                    {# Parcelamento #}
                    <div class="mb-3 font-small text-center text-md-left ep-demo-installments">
                        <svg class="icon-inline icon-xs mr-1" aria-hidden="true"><use xlink:href="#credit-card-alt"/></svg>
                        {{ "Ate 12x sem juros" | translate }}
                    </div>

                    {# Formulário #}
                    <form id="product_form" class="js-product-form mt-4 ep-demo-form" method="post" action="">
                        <div class="js-product-variants row mb-2 ep-demo-variants">
                            <div class="col-12 text-center text-md-left mb-2">
                                <div class="form-group ep-demo-form-group">
                                    <label class="form-label ep-demo-label" for="variation_1">{{ "Cor" | translate }}</label>
                                    <select id="variation_1" class="form-select js-variation-option js-refresh-installment-data ep-demo-select" name="variation[0]">
                                        <option value="{{ 'Verde' | translate }}">{{ "Verde" | translate }}</option>
                                        <option value="{{ 'Vermelho' | translate }}">{{ "Vermelho" | translate }}</option>
                                    </select>
                                    <div class="form-select-icon ep-demo-select-icon">
                                        <svg class="icon-inline icon-w-14 icon-rotate-90" aria-hidden="true"><use xlink:href="#chevron"/></svg>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row mb-3 ep-demo-actions">
                            <div class="col-4 pr-0 pr-md-3 ep-demo-qty-col">
                                {% embed "snipplets/forms/form-input.tpl" with{
                                type_number: true, input_value: '1',
                                input_name: 'quantity' ~ item.id,
                                input_custom_class: 'js-quantity-input form-control-big form-control-inline ep-demo-qty-input',
                                input_label: false,
                                input_append_content: true,
                                input_group_custom_class: 'js-quantity form-quantity ep-demo-qty-group',
                                form_control_container_custom_class: 'col px-0',
                                form_control_quantity: true,
                                input_min: '1'} %}
                                    {% block input_prepend_content %}
                                    <div class="form-row m-0 align-items-center">
                                        <button type="button" class="js-quantity-down form-quantity-icon btn icon-35px font-small ep-demo-qty-down" aria-label="{{ 'Diminuir quantidade' | translate }}">
                                            <svg class="icon-inline" aria-hidden="true"><use xlink:href="#minus"/></svg>
                                        </button>
                                    {% endblock input_prepend_content %}
                                    {% block input_append_content %}
                                        <button type="button" class="js-quantity-up form-quantity-icon btn icon-35px font-small ep-demo-qty-up" aria-label="{{ 'Aumentar quantidade' | translate }}">
                                            <svg class="icon-inline" aria-hidden="true"><use xlink:href="#plus"/></svg>
                                        </button>
                                    </div>
                                    {% endblock input_append_content %}
                                {% endembed %}
                            </div>
                            <div class="col-8 pl-md-0 buy-button-container ep-demo-buy-col">
                                <input type="submit" class="js-addtocart js-prod-submit-form btn-add-to-cart btn btn-primary btn-big btn-block cart ep-demo-buy-btn" value="{{ 'Adicionar ao carrinho' | translate }}" />
                            </div>
                        </div>
                    </form>

                    {# Descrição #}
                    <div class="mt-2 pb-md-4 text-center mt-md-3 text-md-left ep-demo-description">
                        <p>{{ "Este e um produto de exemplo! Para testar o processo de compra, voce deve" | translate }}
                            <a href="/admin/products" target="_top" class="ep-demo-admin-link">{{ "adicionar seus proprios produtos." | translate }}</a>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
