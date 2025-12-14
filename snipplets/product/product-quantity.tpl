{# /*============================================================================
  El Pescador - Quantidade de Produto Profissional

  PLANO DE MELHORIAS (10 etapas):
  1. ✅ Adicionar classes ep- para consistência
  2. ✅ Melhorar controles de quantidade
  3. ✅ Melhorar botões +/-
  4. ✅ Traduzir textos para PT-BR
  5. ✅ Melhorar indicador de estoque
  6. ✅ Adicionar ícones
  7. ✅ Melhorar espaçamentos
  8. ✅ Responsividade otimizada
  9. ✅ Melhorar acessibilidade
  10. ✅ Adicionar feedback visual
==============================================================================*/ #}

{# Product quantity #}

{% set label_text = product.isSubscribable() ? 'Quantidade' | translate %}

<div class="js-product-quantity-container col-4 pr-0 pr-md-3 ep-quantity-container">
    {% embed "snipplets/forms/form-input.tpl" with{
    type_number: true, input_value: '1',
    input_name: 'quantity' ~ item.id,
    input_custom_class: 'js-quantity-input form-control-big ep-qty-input',
    input_label_text: label_text,
    input_append_content: true,
    input_group_custom_class: 'js-quantity ep-qty-group',
    form_control_container_custom_class: 'col px-0 ep-qty-control',
    form_data_component: 'product.adding-amount',
    form_control_quantity: true,
    input_min: '1',
    data_component: 'adding-amount.value',
    input_aria_label: 'Alterar quantidade' | translate } %}
        {% block input_prepend_content %}
        <div class="form-quantity form-quantity-product d-flex form-row m-0 align-items-center ep-qty-wrapper" data-component="product.quantity">
            <span class="js-quantity-down form-quantity-icon btn icon-35px font-small ep-qty-minus" data-component="product.quantity.minus" aria-label="{{ 'Diminuir quantidade' | translate }}" role="button">
                <svg class="icon-inline"><use xlink:href="#minus"/></svg>
            </span>
        {% endblock input_prepend_content %}
        {% block input_append_content %}
            <span class="js-quantity-up form-quantity-icon btn icon-35px font-small ep-qty-plus" data-component="product.quantity.plus" aria-label="{{ 'Aumentar quantidade' | translate }}" role="button">
                <svg class="icon-inline"><use xlink:href="#plus"/></svg>
            </span>
        </div>
        {% endblock input_append_content %}
    {% endembed %}
    {% if settings.product_stock %}
        <div class="font-smallest py-2 text-center ep-stock-info">
            <svg class="icon-inline icon-xs mr-1 text-accent"><use xlink:href="#check"/></svg>
            <span class="js-product-stock ep-stock-qty">{{ product.selected_or_first_available_variant.stock }}</span> {{ "em estoque" | translate }}
        </div>
    {% endif %}
</div>
