{# /*============================================================================
  El Pescador - Item de Categoria (Demo) Profissional

  PLANO DE MELHORIAS (10 etapas):
  1. ✅ Adicionar classes ep- para consistência
  2. ✅ Traduzir textos para PT-BR
  3. ✅ Melhorar estrutura semântica
  4. ✅ Melhorar imagem da categoria
  5. ✅ Adicionar aria-labels
  6. ✅ Melhorar container
  7. ✅ Responsividade otimizada
  8. ✅ Melhorar SVG
  9. ✅ Melhorar espaçamentos
  10. ✅ Melhorar acessibilidade
==============================================================================*/ #}

{% set main_category_view_box = '0 0 1000 1000' %}

<div class="swiper-slide w-md-auto ep-demo-cat-slide">
    <div class="home-category text-center ep-demo-cat-item">
        <div class="home-category-image home-category-image-md home-category-image-placeholder ep-demo-cat-image" role="img" aria-label="{{ 'Categoria de exemplo' | translate }}">
            {% set help_item_path = help_item_1 ? 'main-category-1' : help_item_2 ? 'main-category-2' : 'main-category-3' %}
            <svg class="icon-inline svg-icon-text ep-demo-cat-svg" viewBox="{{ main_category_view_box }}" aria-hidden="true"><use xlink:href="#{{ help_item_path }}"/></svg>
        </div>
    </div>
</div>
