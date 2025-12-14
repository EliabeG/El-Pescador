{# /*============================================================================
  El Pescador - Filiais/Pontos de Retirada Profissional

  PLANO DE MELHORIAS (10 etapas):
  1. ✅ Adicionar classes ep- para consistência
  2. ✅ Melhorar lista de filiais
  3. ✅ Melhorar seletor de opções
  4. ✅ Traduzir textos para PT-BR
  5. ✅ Melhorar espaçamentos
  6. ✅ Adicionar ícone de loja
  7. ✅ Melhorar radio buttons
  8. ✅ Responsividade otimizada
  9. ✅ Melhorar acessibilidade
  10. ✅ Melhorar accordion
==============================================================================*/ #}

<div class="js-accordion-container ep-branches-container{% if store.branches|length > 1 %} js-toggle-branches{% endif %}">
    {% set show_product_shipping = settings.shipping_calculator_product_page and store.has_shipping %}
    <div class="font-small mb-1 ep-branches-title {% if show_product_shipping %}mt-2 pt-1{% endif %}">
        <svg class="icon-inline mr-1"><use xlink:href="#store"/></svg>
        {% if store.branches|length > 1 %}
            {{ 'Nossas lojas' | translate }}
        {% else %}
            {{ 'Nossa loja' | translate }}
        {% endif %}
    </div>
    {% if store.branches|length > 1 %}
        <a href="#" class="js-accordion-toggle btn-link font-small ep-branches-toggle">
            <span class="js-accordion-toggle-inactive">
                {{ 'Ver opcoes' | translate }}
            </span>
            <span class="js-accordion-toggle-active" style="display: none;">
                {{ 'Ocultar opcoes' | translate }}
            </span>
        </a>
    {% endif %}
    <div class="js-accordion-content mt-3 ep-branches-list"{% if store.branches|length > 1 %} style="display: none;"{% endif %}>
    {% if not product_detail %}
        <div class="radio-buttons-group ep-branches-group">
    {% else %}
        <div class="list ep-branches-items">
    {% endif %}
            <ul class="radio-button-container list-unstyled ep-branches-ul" role="radiogroup" aria-label="{{ 'Pontos de retirada' | translate }}">

                {% for branch in store.branches %}
                    <li class="card ep-branch-item {% if product_detail %}list-item list-item-shipping radio-button{% else %}radio-button-item{% endif %} p-3 mb-2 {% if loop.last %}mb-0{% endif %}" data-store="branch-item-{{ branch.code }}">

                        {# If cart use radiobutton #}

                        {% if not product_detail %}
                            <label class="js-shipping-radio js-branch-radio radio-button ep-branch-label" data-loop="branch-radio-{{loop.index}}">

                                <input
                                class="js-branch-method {% if cart.shipping_data.code == branch.code %} js-selected-shipping-method {% endif %} shipping-method ep-branch-input"
                                data-price="0"
                                {% if cart.shipping_data.code == branch.code %}checked{% endif %} type="radio"
                                value="{{branch.code}}"
                                data-name="{{ branch.name }} - {{ branch.extra }}"
                                data-code="{{branch.code}}"
                                data-cost="{{ 'Gratis' | translate }}"
                                name="option"
                                style="display:none">
                                <div class="shipping-option row-fluid radio-button-content ep-branch-content">
                                   <div class="radio-button-icons-container ep-radio-icons">
                                        <span class="radio-button-icons">
                                            <span class="radio-button-icon unchecked ep-unchecked"></span>
                                            <span class="radio-button-icon checked ep-checked"></span>
                                        </span>
                                    </div>
                        {% endif %}
                                    <div class="{% if product_detail %}list-item-content ep-branch-detail{% else %}radio-button-label ml-1 ep-branch-info{% endif %}">
                                        <div class="row">
                                            <div class="col font-small {% if not product_detail %}pr-3{% endif %} ep-branch-name">
                                                <div>
                                                    <svg class="icon-inline icon-sm mr-1 text-accent"><use xlink:href="#map-marker"/></svg>
                                                    {{ branch.name }} - {{ branch.extra }}
                                                </div>
                                            </div>
                                            <div class="col-auto text-right ep-branch-price">
                                                <p class="text-accent mb-0 d-inline-block ep-free-label">
                                                    <svg class="icon-inline icon-xs mr-1"><use xlink:href="#check"/></svg>
                                                    {{ 'Gratis' | translate }}
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                        {% if not product_detail %}
                                </div>
                            </label>
                        {% endif %}
                    </li>
                {% endfor %}
            </ul>
        </div>
    </div>
</div>
