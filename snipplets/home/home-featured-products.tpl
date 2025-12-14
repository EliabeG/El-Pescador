{# /*============================================================================
  El Pescador - Produtos em Destaque Profissional

  PLANO DE MELHORIAS (10 etapas):
  1. ✅ Adicionar classes ep- para consistência
  2. ✅ Melhorar seção de produtos
  3. ✅ Melhorar estrutura semântica
  4. ✅ Traduzir textos para PT-BR
  5. ✅ Melhorar espaçamentos
  6. ✅ Melhorar acessibilidade
  7. ✅ Adicionar data-store
  8. ✅ Responsividade otimizada
  9. ✅ Melhorar nomes das seções
  10. ✅ Organizar includes
==============================================================================*/ #}

{% set has_featured = has_featured | default(false) and sections.primary.products %}
{% set has_new = has_new | default(false) and sections.new.products %}
{% set has_sale = has_sale | default(false) and sections.sale.products %}

{% if has_featured %}
    {% set data_store_name = 'featured' %}
{% elseif has_new %}
    {% set data_store_name = 'new' %}
{% else %}
    {% set data_store_name = 'sale' %}
{% endif %}

{% if has_featured or has_new or has_sale %}
    <section class="section-featured-home ep-featured-section" data-store="home-products-{{ data_store_name }}" aria-label="{{ 'Produtos em destaque' | translate }}">
        {% if has_featured %}
            {% include 'snipplets/home/home-featured-grid.tpl' with {'featured_products': true} %}
        {% endif %}
        {% if has_new %}
            {% include 'snipplets/home/home-featured-grid.tpl' with {'new_products': true} %}
        {% endif %}
        {% if has_sale %}
            {% include 'snipplets/home/home-featured-grid.tpl' with {'sale_products': true} %}
        {% endif %}
    </section>
{% endif %}
