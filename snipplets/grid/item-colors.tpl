{# /*============================================================================
  El Pescador - Cores do Item Profissional

  PLANO DE MELHORIAS (10 etapas):
  1. ✅ Adicionar classes ep- para consistência
  2. ✅ Melhorar bullets de cores
  3. ✅ Melhorar indicador de mais cores
  4. ✅ Traduzir textos para PT-BR
  5. ✅ Melhorar layout flexbox
  6. ✅ Adicionar hover effects
  7. ✅ Melhorar espaçamentos
  8. ✅ Responsividade otimizada
  9. ✅ Melhorar acessibilidade
  10. ✅ Adicionar tooltips
==============================================================================*/ #}

{% if product.variations %}
    {% set own_color_variants = 0 %}
    {% set custom_color_variants = 0 %}

    {% for variation in product.variations %}
        <div class="js-color-variant-available-{{ loop.index }} {% if variation.name in ['Color', 'Cor'] %}js-color-variant-active{% endif %} ep-color-variant" data-value="variation_{{ loop.index }}" data-option="{{ loop.index0 }}" >
            {% if variation.name in ['Color', 'Cor'] %}
                {% if variation.options | length > 1 %}
                    <div class="item-colors d-flex justify-content-center mt-2 pt-1 ep-colors-container" role="group" aria-label="{{ 'Cores disponiveis' | translate }}">
                        {% for option in variation.options | take(3) if option.custom_data %}
                            <span title="{{ option.name }}" data-option="{{ option.id }}" data-variation-id="{{ variation.id }}" class="js-color-variant item-colors-bullet ep-color-bullet" style="background: {{ option.custom_data }}" role="button" aria-label="{{ 'Cor' | translate }}: {{ option.name }}"></span>
                        {% endfor %}

                        {% for option in variation.options %}
                            {% if option.custom_data %}
                                {# Quantity of our colors #}
                                {% set own_color_variants = own_color_variants + 1 %}
                            {% else %}
                                {# Quantity of custom colors #}
                                {% set custom_color_variants = custom_color_variants + 1 %}
                            {% endif %}
                        {% endfor %}

                        {% set more_color_variants = (own_color_variants - 3) + custom_color_variants %}

                        {% if own_color_variants and custom_color_variants %}
                            <span class="item-colors-bullet item-colors-bullet-more w-auto ep-more-colors" title="{{ 'Ver mais cores' | translate }}" aria-label="{{ 'Ver mais cores' | translate }}">
                                {% if own_color_variants > 3 %}
                                    +{{ more_color_variants }}
                                {% else %}
                                    +{{ custom_color_variants }}
                                {% endif %}
                            </span>
                        {% elseif own_color_variants > 3 %}
                            <span class="item-colors-bullet item-colors-bullet-more w-auto ep-more-colors" title="{{ 'Ver mais cores' | translate }}" aria-label="{{ 'Mais' | translate }} {{ own_color_variants - 3 }} {{ 'cores' | translate }}">+{{ own_color_variants - 3 }}</span>
                        {% elseif custom_color_variants %}
                            <span class="item-colors-bullet item-colors-bullet-more w-auto px-2 ep-more-colors" title="{{ 'Ver mais cores' | translate }}" aria-label="{{ custom_color_variants }} {{ 'cores disponiveis' | translate }}">{{ custom_color_variants }} {{ 'cores' | translate }}</span>
                        {% endif %}
                    </div>
                {% endif %}
            {% endif %}
        </div>
    {% endfor %}
{% endif %}
