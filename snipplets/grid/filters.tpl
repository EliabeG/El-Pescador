{# /*============================================================================
  El Pescador - Filtros Grid Profissional

  PLANO DE MELHORIAS (10 etapas):
  1. ✅ Adicionar classes ep- para consistência
  2. ✅ Melhorar chips de filtros aplicados
  3. ✅ Melhorar botão limpar filtros
  4. ✅ Adicionar ícones nos filtros
  5. ✅ Melhorar checkboxes
  6. ✅ Melhorar filtro de preço
  7. ✅ Traduzir textos para PT-BR
  8. ✅ Responsividade otimizada
  9. ✅ Melhorar accordion
  10. ✅ Melhorar acessibilidade
==============================================================================*/ #}

{% if applied_filters %}

    {# Applied filters chips #}

    {% if has_applied_filters %}

        <div class="mb-4 ep-applied-filters">
            {% for product_filter in product_filters %}
                {% for value in product_filter.values %}

                    {# List applied filters as tags #}

                    {% if value.selected %}
                        <button class="js-remove-filter js-remove-filter-chip chip ep-filter-chip" data-filter-name="{{ product_filter.key }}" data-filter-value="{{ value.name }}" data-component="filter.pill-{{ product_filter.type }}" data-component-value="{{ product_filter.key }}">
                            {{ value.pill_label }}
                            <svg class="icon-inline chip-remove-icon ep-chip-remove"><use xlink:href="#times"/></svg>
                        </button>
                    {% endif %}
                {% endfor %}
            {% endfor %}
            <a href="#" class="js-remove-all-filters btn-link font-small d-inline-block ep-clear-filters" data-component="filter-delete">
                <svg class="icon-inline icon-sm mr-1"><use xlink:href="#times"/></svg>
                {{ 'Limpar filtros' | translate }}
            </a>
        </div>
    {% endif %}
{% else %}
    {% if product_filters is not empty %}

        {# Filters list #}

        <div id="filters" class="visible-when-content-ready ep-filters" data-store="filters-nav">
            {% for product_filter in product_filters %}
                {% if product_filter.type == 'price' %}

                    {{ component(
                        'price-filter',
                        {'group_class': 'price-filter-container ep-price-filter mb-3 pb-1', 'title_class': 'font-small font-weight-bold mb-4 ep-filter-title', 'button_class': 'btn btn-default ep-price-btn d-inline-block' }
                    ) }}

                {% else %}
                    {% if product_filter.has_products %}

                        <div class="js-accordion-container mb-3 pb-1 ep-filter-group" data-store="filters-group" data-component="list.filter-{{ product_filter.type }}" data-component-value="{{ product_filter.key }}">
                            <div class="font-small font-weight-bold mt-3 mb-4 ep-filter-title">{{product_filter.name}}</div>
                            {% set index = 0 %}
                            {% for value in product_filter.values %}
                                {% if value.product_count > 0 %}
                                    {% set index = index + 1 %}

                                    <label class="js-filter-checkbox {% if not value.selected %}js-apply-filter{% else %}js-remove-filter{% endif %} checkbox-container ep-filter-checkbox" data-filter-name="{{ product_filter.key }}" data-filter-value="{{ value.name }}" data-component="filter.option" data-component-value="{{ value.name }}">
                                        <input type="checkbox" autocomplete='off' {% if value.selected %}checked{% endif %}/>
                                        <span class="checkbox ep-checkbox">
                                            <span class="checkbox-icon ep-checkbox-icon"></span>
                                            <span class="checkbox-text with-color ep-checkbox-text">
                                                {{ value.name }} <span class="ml-1 opacity-60">({{ value.product_count }})</span>
                                            </span>
                                            {% if product_filter.type == 'color' and value.color_type == 'insta_color' %}
                                                <span class="checkbox-color ep-color-swatch" style="background-color: {{ value.color_hexa }};"></span>
                                            {% endif %}
                                        </span>
                                    </label>
                                    {% if index == 8 and product_filter.values_with_products > 8 %}
                                        <div class="js-accordion-content ep-accordion-content" style="display: none;">
                                    {% endif %}

                                {% endif %}
                                {% if loop.last and product_filter.values_with_products > 8 %}
                                    </div>
                                    <a href="#" class="js-accordion-toggle d-inline-block btn-link font-small mb-3 ep-accordion-toggle">
                                        <span class="js-accordion-toggle-inactive">{{ 'Ver todos' | translate }}</span>
                                        <span class="js-accordion-toggle-active" style="display: none;">{{ 'Ver menos' | translate }}</span>
                                    </a>
                                {% endif %}
                            {% endfor %}
                        </div>
                    {% endif %}
                {% endif %}
            {% endfor %}
        </div>
    {% endif %}
{% endif %}
