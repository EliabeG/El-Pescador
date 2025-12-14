{# /*============================================================================
  El Pescador - Fulfillment do Carrinho Profissional

  PLANO DE MELHORIAS (10 etapas):
  1. ✅ Adicionar classes ep- para consistência
  2. ✅ Melhorar container de frete
  3. ✅ Melhorar mensagem de erro
  4. ✅ Traduzir textos para PT-BR
  5. ✅ Melhorar espaçamentos
  6. ✅ Adicionar ícones de alerta
  7. ✅ Melhorar estrutura
  8. ✅ Responsividade otimizada
  9. ✅ Melhorar acessibilidade
  10. ✅ Melhorar includes
==============================================================================*/ #}

{# Define conditions to show shipping calculator and store branches on cart #}

{% set show_calculator_on_cart = settings.shipping_calculator_cart_page and store.has_shipping %}
{% set show_cart_fulfillment = settings.shipping_calculator_cart_page and (store.has_shipping or store.branches) %}

{% if show_cart_fulfillment %}
  <div class="js-fulfillment-info js-allows-non-shippable cart-fulfillment-info ep-fulfillment-container {% if cart_page %}mb-4{% else %}my-4 pb-2{% endif %}" {% if not cart.has_shippable_products %}style="display: none"{% endif %} aria-label="{{ 'Opcoes de envio' | translate }}">
    <div class="js-visible-on-cart-filled js-has-new-shipping js-shipping-calculator-container ep-shipping-container">

      {# Saved shipping not available #}

      <div class="js-shipping-method-unavailable alert alert-warning row row mx-0 mb-3 ep-shipping-unavailable" style="display: none;">
        <div class="col-11 text-left pl-1 pr-0 ep-unavailable-msg">
          <svg class="icon-inline mr-2"><use xlink:href="#alert"/></svg>
          <div class="mb-1 ep-unavailable-title">{{ 'O meio de envio que voce escolheu nao esta mais disponivel para este carrinho.' | translate }}</div>
          <div class="ep-unavailable-help">{{ 'Nao se preocupe! Voce pode escolher outro.' | translate}}</div>
        </div>
      </div>

      {# Shipping calculator and branch link #}

      <div id="cart-shipping-container" class="ep-cart-shipping" {% if cart.items_count == 0 %} style="display: none;"{% endif %} data-shipping-url="{{ store.shipping_calculator_url }}">

        {# Used to save shipping #}

        <span id="cart-selected-shipping-method" data-code="{{ cart.shipping_data.code }}" class="hidden ep-selected-method">{{ cart.shipping_data.name }}</span>

        {# Shipping Calculator #}

        {% if store.has_shipping %}
          {% include "snipplets/shipping/shipping-calculator.tpl" with { 'product_detail': false} %}
        {% endif %}

        {# Store branches #}

        {% if store.branches %}
          {% include "snipplets/shipping/branches.tpl" with {'product_detail': false} %}
        {% endif %}
      </div>
    </div>
  </div>
{% endif %}
