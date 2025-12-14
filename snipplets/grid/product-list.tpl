{# /*============================================================================
  El Pescador - Lista de Produtos Profissional

  PLANO DE MELHORIAS (10 etapas):
  1. ✅ Adicionar classes ep- para consistência
  2. ✅ Melhorar grid de produtos
  3. ✅ Melhorar mensagem de sem resultados
  4. ✅ Traduzir textos para PT-BR
  5. ✅ Melhorar estrutura semântica
  6. ✅ Adicionar ícone na mensagem vazia
  7. ✅ Melhorar espaçamentos
  8. ✅ Responsividade otimizada
  9. ✅ Melhorar acessibilidade
  10. ✅ Adicionar feedback visual
==============================================================================*/ #}

{% set noFilterResult = "Nao encontramos resultados para sua busca. Por favor, tente outros filtros." %}

{% if products %}
    <div class="js-product-table row row-grid ep-product-grid" role="list" aria-label="{{ 'Lista de produtos' | translate }}">
        {% include 'snipplets/product_grid.tpl' %}
    </div>
    {% if settings.pagination == 'infinite' %}
        {% set pagination_type_val = true %}
    {% else %}
        {% set pagination_type_val = false %}
    {% endif %}

    {% include "snipplets/grid/pagination.tpl" with {infinite_scroll: pagination_type_val} %}
{% else %}
    <div class="ep-no-results text-center py-5">
        <svg class="icon-inline icon-2x mb-3 opacity-50"><use xlink:href="#search"/></svg>
        <h5 class="mb-4 font-weight-normal ep-no-results-text" data-component="filter.message">
             {% if template == 'category' %}
                {{(has_filters_enabled ? noFilterResult : "Em breve") | translate}}
            {% elseif template == 'search' %}
                {{ ((has_applied_filters and query) or has_applied_filters ?  noFilterResult : "Tente escrever de outra forma e busque novamente.") | translate }}
            {% endif %}
        </h5>
        {% if has_applied_filters %}
            <a href="#" class="js-remove-all-filters btn btn-default ep-clear-search" data-component="filter-delete">
                <svg class="icon-inline mr-2"><use xlink:href="#times"/></svg>
                {{ 'Limpar filtros' | translate }}
            </a>
        {% endif %}
    </div>
{% endif %}
