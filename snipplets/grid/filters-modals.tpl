{# /*============================================================================
  El Pescador - Modal de Filtros Profissional

  PLANO DE MELHORIAS (10 etapas):
  1. ✅ Adicionar classes ep- para consistência
  2. ✅ Melhorar botão de filtrar
  3. ✅ Melhorar modal de filtros
  4. ✅ Traduzir textos para PT-BR
  5. ✅ Melhorar ordenação
  6. ✅ Adicionar ícones
  7. ✅ Melhorar overlay de loading
  8. ✅ Responsividade otimizada
  9. ✅ Melhorar acessibilidade
  10. ✅ Melhorar feedback visual
==============================================================================*/ #}

{% set has_filters_available = products and has_filters_enabled and product_filters is not empty %}
{% set search_page_filters = template == 'search' and search_filter %}
{% set category_page = template == 'category' %}
{% set show_filters = products or has_filters_available %}

{% if show_filters and (category_page or search_page_filters) %}
    <section class="js-category-controls category-controls visible-when-content-ready ep-category-controls">
        <div class="container category-controls-container text-center ep-controls-container">
            {% if products %}
                <a href="#" class="js-modal-open btn-link ep-filter-btn" data-toggle="#nav-filters" data-component="filter-button" aria-label="{{ has_filters_available ? 'Abrir filtros' : 'Abrir ordenacao' | translate }}">
                    <svg class="icon-inline mr-2"><use xlink:href="#filter"/></svg>
                    {% if has_filters_available %}
                        {{ "Filtrar" | translate }}
                    {% else %}
                        {{ "Ordenar" | translate }}
                    {% endif %}
                    {% if has_applied_filters %}
                        <span class="filters-badge ml-1 ep-filters-badge">
                            (<span class="js-filters-badge"></span>)
                        </span>
                    {% endif %}
                </a>
                {% embed "snipplets/modal.tpl" with{modal_id: 'nav-filters', modal_class: 'filters ep-filters-modal', modal_position: 'left', modal_transition: 'slide', modal_header_title: true, modal_close_floating: true, modal_width: 'drawer modal-docked-small' } %}
                    {% block modal_head %}
                        <svg class="icon-inline mr-2"><use xlink:href="#filter"/></svg>
                        {% if has_filters_available %}
                            {{ "Filtrar" | translate }}
                        {% else %}
                            {{ "Ordenar" | translate }}
                        {% endif %}
                    {% endblock %}
                    {% block modal_body %}
                        {% include "snipplets/grid/filters.tpl" with {applied_filters: true} %}
                        <div class="mb-4 pb-2 ep-sort-section">
                            {% if has_filters_available %}
                                <div class="font-small font-weight-bold mb-4 ep-sort-title">
                                    <svg class="icon-inline mr-2"><use xlink:href="#sort"/></svg>
                                    {{ 'Ordenar' | translate }}
                                </div>
                            {% endif %}
                            {{ component(
                                'sort-by',{
                                    list: true,
                                    list_title: false,
                                    svg_sprites: true,
                                    sort_by_classes: {
                                        list: "list-unstyled radio-button-container ep-sort-list",
                                        list_item: "radio-button-item ep-sort-item",
                                        radio_button: "radio-button ep-radio",
                                        radio_button_content: "radio-button-content ep-radio-content",
                                        radio_button_icons_container: "radio-button-icons-container ep-radio-icons",
                                        radio_button_icons: "radio-button-icons",
                                        radio_button_icon: "radio-button-icon ep-radio-icon",
                                        radio_button_label: "radio-button-label ep-radio-label",
                                        applying_feedback_message: "h5 mr-2 ep-feedback-msg",
                                        applying_feedback_icon: "icon-inline h5 icon-spin icon-w-2em svg-icon-text ml-2 ep-feedback-icon"
                                    },
                                    applying_feedback_svg_id: "spinner-third",
                                })
                            }}
                        </div>
                        {% if has_filters_available %}
                            {% if filter_categories is not empty %}
                                {% include "snipplets/grid/categories.tpl" with {modal: true} %}
                            {% endif %}
                            {% if product_filters is not empty %}
                                {% include "snipplets/grid/filters.tpl" with {modal: true} %}
                            {% endif %}
                            <div class="js-filters-overlay filters-overlay ep-filters-overlay" style="display: none;">
                                <div class="filters-updating-message ep-updating-message">
                                    <span class="js-applying-filter h5 mr-2 ep-applying" style="display: none;">{{ 'Aplicando filtro' | translate }}</span>
                                    <span class="js-removing-filter h5 mr-2 ep-removing" style="display: none;">{{ 'Removendo filtro' | translate }}</span>
                                    <svg class="icon-inline h5 icon-spin icon-w-2em svg-icon-text ml-2"><use xlink:href="#spinner-third"/></svg>
                                </div>
                            </div>
                        {% endif %}
                        <div class="js-sorting-overlay filters-overlay ep-sorting-overlay" style="display: none;">
                            <div class="filters-updating-message ep-updating-message">
                                <span class="h5 mr-2">{{ 'Ordenando produtos' | translate }}</span>
                                <span>
                                    <svg class="icon-inline h5 icon-spin icon-w-2em svg-icon-text"><use xlink:href="#spinner-third"/></svg>
                                </span>
                            </div>
                        </div>
                    {% endblock %}
                {% endembed %}
            {% endif %}
        </div>
    </section>
{% endif %}
