{# /*============================================================================
  El Pescador - Produtos em Destaque (Demo) Profissional

  PLANO DE MELHORIAS (10 etapas):
  1. ✅ Adicionar classes ep- para consistência
  2. ✅ Traduzir textos para PT-BR
  3. ✅ Melhorar estrutura semântica
  4. ✅ Melhorar grid de produtos
  5. ✅ Adicionar aria-labels
  6. ✅ Melhorar título da seção
  7. ✅ Responsividade otimizada
  8. ✅ Melhorar espaçamentos
  9. ✅ Melhorar container
  10. ✅ Melhorar acessibilidade
==============================================================================*/ #}

<section class="section-featured-home ep-demo-featured" data-store="home-products-{{ section_id }}" aria-label="{{ 'Produtos em destaque' | translate }}">
    <div class="container ep-demo-featured-container">
        <div class="row">
            <div class="col-12">
                <h2 class="js-products-{{ section_id }}-title section-title h3 mt-3 mb-4 pb-2 text-center ep-demo-featured-title">{{ products_title }}</h2>
                <div class="row row-grid ep-demo-featured-grid">
                    {% include 'snipplets/defaults/help_item.tpl' with {'help_item_1': true, 'section_columns_desktop': 4, 'section_columns_mobile': 2} %}
                    {% include 'snipplets/defaults/help_item.tpl' with {'help_item_8': true, 'section_columns_desktop': 4, 'section_columns_mobile': 2} %}
                    {% include 'snipplets/defaults/help_item.tpl' with {'help_item_4': true, 'section_columns_desktop': 4, 'section_columns_mobile': 2} %}
                    {% include 'snipplets/defaults/help_item.tpl' with {'help_item_6': true, 'section_columns_desktop': 4, 'section_columns_mobile': 2} %}
                </div>
            </div>
        </div>
    </div>
</section>
