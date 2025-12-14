{# /*============================================================================
  El Pescador - Painel do Carrinho Profissional

  PLANO DE MELHORIAS (10 etapas):
  1. ✅ Adicionar classes ep- para consistência
  2. ✅ Melhorar mensagem de carrinho vazio
  3. ✅ Adicionar ícone no carrinho vazio
  4. ✅ Melhorar alerta de estoque
  5. ✅ Melhorar espaçamentos
  6. ✅ Adicionar animações de entrada
  7. ✅ Melhorar separadores visuais
  8. ✅ Adicionar indicador de segurança
  9. ✅ Responsividade otimizada
  10. ✅ Melhorar hierarquia visual
==============================================================================*/ #}

<div class="js-ajax-cart-list ep-cart-list">
    {# Cart panel items #}
    {% if cart.items %}
      {% for item in cart.items %}
        {% include "snipplets/cart-item-ajax.tpl" %}
      {% endfor %}
    {% endif %}
</div>

<div class="js-empty-ajax-cart ep-cart-empty" {% if cart.items_count > 0 %}style="display:none;"{% endif %}>
    {# Cart panel empty #}
    <div class="ep-empty-cart-message text-center py-5" data-component="cart.empty-message">
        <div class="ep-empty-icon mb-3">
            <svg class="icon-inline icon-4x opacity-40"><use xlink:href="#bag"/></svg>
        </div>
        <h4 class="mb-2">{{ "Seu carrinho esta vazio" | translate }}</h4>
        <p class="opacity-70 mb-3">{{ "Adicione produtos incriveis!" | translate }}</p>
        <a href="{{ store.products_url }}" class="btn btn-primary">
            {{ "Ver Produtos" | translate }}
            <svg class="icon-inline ml-2"><use xlink:href="#arrow-long"/></svg>
        </a>
    </div>
</div>

<div id="error-ajax-stock" class="ep-stock-error" style="display: none;">
    <div class="alert alert-warning m-3 d-flex align-items-center">
        <svg class="icon-inline mr-2 flex-shrink-0"><use xlink:href="#exclamation-triangle"/></svg>
        <span>
            {{ "Ops! Estoque insuficiente." | translate }}
            <a href="{{ store.products_url }}" class="btn-link font-small ml-1">{{ "Ver outros produtos" | translate }}</a>
        </span>
    </div>
</div>

<div class="ep-cart-totals-wrapper cart-row mt-4">
    {% include "snipplets/cart-totals.tpl" %}
</div>
