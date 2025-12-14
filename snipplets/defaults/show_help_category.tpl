{# /*============================================================================
  El Pescador - Pagina de Categoria (Demo) Profissional

  PLANO DE MELHORIAS (10 etapas):
  1. ✅ Adicionar classes ep- para consistência
  2. ✅ Traduzir textos para PT-BR
  3. ✅ Melhorar estrutura semântica
  4. ✅ Melhorar header da página
  5. ✅ Adicionar aria-labels
  6. ✅ Melhorar grid de produtos
  7. ✅ Responsividade otimizada
  8. ✅ Melhorar container
  9. ✅ Melhorar espaçamentos
  10. ✅ Melhorar acessibilidade
==============================================================================*/ #}

{% embed "snipplets/page-header.tpl" %}
    {% block page_header_text %}{{ category.name }}{% endblock page_header_text %}
{% endembed %}

<section class="category-body ep-demo-category" aria-label="{{ 'Produtos da categoria' | translate }}">
    <div class="container mt-3 mb-5 ep-demo-category-container">
        <div class="row row-grid ep-demo-products-grid">
            {% include "snipplets/svg/empty-placeholders.tpl" %}
            {% include 'snipplets/defaults/help_item.tpl' with {'help_item_1': true} %}
            {% include 'snipplets/defaults/help_item.tpl' with {'help_item_2': true} %}
            {% include 'snipplets/defaults/help_item.tpl' with {'help_item_3': true} %}
            {% include 'snipplets/defaults/help_item.tpl' with {'help_item_4': true} %}
            {% include 'snipplets/defaults/help_item.tpl' with {'help_item_5': true} %}
            {% include 'snipplets/defaults/help_item.tpl' with {'help_item_6': true} %}
            {% include 'snipplets/defaults/help_item.tpl' with {'help_item_7': true} %}
            {% include 'snipplets/defaults/help_item.tpl' with {'help_item_8': true} %}
            {% include 'snipplets/defaults/help_item.tpl' with {'help_item_1': true} %}
            {% include 'snipplets/defaults/help_item.tpl' with {'help_item_2': true} %}
        </div>
    </div>
</section>
