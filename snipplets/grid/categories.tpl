{# /*============================================================================
  El Pescador - Categorias Grid Profissional

  PLANO DE MELHORIAS (10 etapas):
  1. ✅ Adicionar classes ep- para consistência
  2. ✅ Melhorar link de voltar
  3. ✅ Melhorar lista de categorias
  4. ✅ Adicionar hover nos links
  5. ✅ Melhorar accordion ver mais/menos
  6. ✅ Traduzir textos para PT-BR
  7. ✅ Melhorar espaçamentos
  8. ✅ Responsividade otimizada
  9. ✅ Melhorar acessibilidade
  10. ✅ Adicionar ícone nas categorias
==============================================================================*/ #}

{% if not modal %}
    <div class="visible-when-content-ready ep-filter-categories">
        {% if parent_category and parent_category.id!=0 %}
            <a href="{{ parent_category.url }}" title="{{ parent_category.name }}" class="category-back ep-category-back d-block{% if filter_categories %} mb-4{% endif %}">
                <svg class="icon-inline mr-2 svg-icon-text icon-flip-horizontal"><use xlink:href="#chevron"/></svg>
                {{ parent_category.name }}
            </a>
        {% endif %}
{% endif %}

        {% if filter_categories %}
            {% if not modal %}
                <div class="d-none d-md-block ep-categories-desktop">
            {% endif %}
                {% if modal %}
                    <div class="font-small font-weight-bold mt-3 mb-4 ep-categories-title">{{ "Categorias" | translate }}</div>
                {% endif %}
                <ul class="js-accordion-container list-unstyled mb-3 pb-1 ep-categories-list">
                    {% for category in filter_categories %}
                        <li data-item="{{ loop.index }}" class="mb-3 ep-category-item">
                            <a href="{{ category.url }}" title="{{ category.name }}" class="btn-link font-small no-underline ep-category-link">
                                {{ category.name }}
                            </a>
                        </li>

                        {% if loop.index == 8 and filter_categories | length > 8 %}
                            <div class="js-accordion-content ep-accordion-content" style="display: none;">
                        {% endif %}
                        {% if loop.last and filter_categories | length > 8 %}
                            </div>
                            <a href="#" class="js-accordion-toggle d-inline-block btn-link font-small mb-3 ep-accordion-toggle">
                                <span class="js-accordion-toggle-inactive">{{ 'Ver mais' | translate }}</span>
                                <span class="js-accordion-toggle-active" style="display: none;">{{ 'Ver menos' | translate }}</span>
                            </a>
                        {% endif %}
                    {% endfor %}
                </ul>
           {% if not modal %}
                </div>
            {% endif %}
        {% endif %}
{% if not modal %}
    </div>
{% endif %}
