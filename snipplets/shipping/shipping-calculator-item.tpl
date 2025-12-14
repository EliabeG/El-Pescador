{# /*============================================================================
  El Pescador - Item Calculadora de Frete Profissional

  PLANO DE MELHORIAS (10 etapas):
  1. ✅ Adicionar classes ep- para consistência
  2. ✅ Melhorar item de frete
  3. ✅ Melhorar radio buttons
  4. ✅ Traduzir textos para PT-BR
  5. ✅ Melhorar exibição de preço
  6. ✅ Melhorar tempo de entrega
  7. ✅ Adicionar ícones
  8. ✅ Responsividade otimizada
  9. ✅ Melhorar acessibilidade
  10. ✅ Melhorar alertas
==============================================================================*/ #}

{# On first calculation select as default the first option: If store only has pickup option selects pickup else selects shipping option #}

{% if has_featured_shipping %}
    {% set checked_option = featured_option and loop.first and not pickup %}
{% else %}
    {% set checked_option = featured_option and loop.first and pickup %}
{% endif %}

{% if store.has_smart_shipping_no_auto_select %}
    {% set checked_option = false %}
{% endif %}

<li class="js-shipping-list-item card radio-button-item p-3 mb-2 ep-shipping-item" data-store="shipping-calculator-item-{{ option.code }}">
    <label class="js-shipping-radio radio-button list-item ep-shipping-label" data-loop="shipping-radio-{{loop.index}}" data-shipping-type="{% if pickup %}pickup{% else %}delivery{% endif %}" data-component="shipping.option">
        <input
        id="{% if featured_option %}featured-{% endif %}shipping-{{loop.index}}"
        class="js-shipping-method {% if not featured_option %}js-shipping-method-hidden{% endif %} {% if pickup %}js-pickup-option{% endif %} shipping-method ep-shipping-input"
        data-price="{{option.cost.value}}"
        data-code="{{option.code}}"
        data-name="{{option.name}}"
        data-cost="{% if option.show_price %} {% if option.cost.value == 0 %}{{ 'Gratis' | translate }}{% else %}{{option.cost}}{% endif %}{% else %} {{ 'A combinar' | translate }} {% endif %}"
        type="radio"
        value="{{option.code}}"
        {% if checked_option %}checked="checked"{% endif %} name="option"
        style="display:none" />
        <div class="radio-button-content ep-shipping-content">
            <div class="radio-button-icons-container ep-radio-icons">
                <span class="radio-button-icons">
                    <span class="radio-button-icon unchecked ep-unchecked"></span>
                    <span class="radio-button-icon checked ep-checked"></span>
                </span>
            </div>
            <div class="radio-button-label ml-1 ep-shipping-info">

                {# Improved shipping option with no carrier img and ordered shipping info #}
                <div class="radio-button-text row ep-shipping-row">
                    <div class="col font-small ep-shipping-details">
                        <div class="shipping-option-name ep-option-name {% if option.payment_rules or option.time or option.suboptions is not empty %}mb-2{% endif %}" data-component="option.name">
                            <svg class="icon-inline icon-sm mr-1 text-accent"><use xlink:href="{% if pickup %}#store{% else %}#truck{% endif %}"/></svg>
                            {{option.short_name}} <span class="ml-1">{{ option.method == 'branch'  ? option.extra.extra  :  '' }}</span>
                        </div>
                        {% if option.time %}
                            <div class="opacity-60 ep-option-time {% if option.suboptions is not empty or option.payment_rules %}mb-2{% endif %}" data-component="option.date">
                                <svg class="icon-inline icon-xs mr-1"><use xlink:href="#clock"/></svg>
                                {% if store.has_smart_dates %}
                                    {{option.dates}}
                                {% else %}
                                    {{option.time}}
                                {% endif %}
                            </div>
                        {% endif %}
                        {% if option.suboptions is not empty %}
                            <div class="ep-suboptions" {% if option.payment_rules %}class="mb-1"{% endif %}>
                                {% include "snipplets/shipping_suboptions/#{option.suboptions.type}.tpl" with {'suboptions': option.suboptions} %}
                            </div>
                        {% endif %}
                        {% if option.payment_rules %}
                            <div class="ep-payment-rules">
                                <i>{{option.payment_rules}}</i>
                            </div>
                        {% endif %}
                    </div>
                    {% if option.show_price %}
                        <div class="col-auto text-right ep-option-price" data-component="option.price">
                            <p class="mb-0 d-inline-block ep-price {% if option.cost.value == 0  %}text-accent{% endif %}">
                                {% if option.cost.value == 0  %}
                                    <svg class="icon-inline icon-xs mr-1"><use xlink:href="#check"/></svg>
                                    {{ 'Gratis' | translate }}
                                {% else %}
                                    {{option.cost}}
                                {% endif %}
                                {% if option.cost.value == 0 and option.old_cost.value %}
                                    <span class="price-compare font-small opacity-50 mr-0 mt-1 ep-old-price">{{option.old_cost}}</span>
                                {% endif %}
                            </p>
                        </div>
                    {% endif %}

                    {% if option.warning['enable'] %}
                        <div class="w-100 mb-0 mt-2 alert alert-warning ep-option-warning">
                            <svg class="icon-inline mr-1"><use xlink:href="#alert"/></svg>
                          {{ option.warning['message'] }}
                        </div>
                    {% endif %}
                </div>
            </div>
        </div>
    </label>
</li>
