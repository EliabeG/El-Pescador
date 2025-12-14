{# /*============================================================================
  El Pescador - Categorias Principais (Demo) Profissional

  PLANO DE MELHORIAS (10 etapas):
  1. ✅ Adicionar classes ep- para consistência
  2. ✅ Traduzir textos para PT-BR
  3. ✅ Melhorar estrutura semântica
  4. ✅ Melhorar slider de categorias
  5. ✅ Adicionar aria-labels
  6. ✅ Melhorar navegação
  7. ✅ Responsividade otimizada
  8. ✅ Melhorar overlay
  9. ✅ Melhorar transições
  10. ✅ Melhorar acessibilidade
==============================================================================*/ #}

<section class="section-categories-home position-relative ep-demo-categories" data-store="home-categories-featured" aria-label="{{ 'Categorias principais' | translate }}">
    <div class="container position-relative ep-demo-categories-container">
        <h2 class="h3 mt-3 mb-4 text-center ep-demo-categories-title">{{ 'Categorias' | translate }}</h2>
        <div class="js-swiper-categories-demo swiper-container ep-demo-categories-slider">
            <div class="swiper-wrapper ep-demo-categories-wrapper">
                {% include 'snipplets/defaults/home/main_category_item_help.tpl' with {'help_item_1': true} %}
                {% include 'snipplets/defaults/home/main_category_item_help.tpl' with {'help_item_2': true} %}
                {% include 'snipplets/defaults/home/main_category_item_help.tpl' with {'help_item_3': true} %}
                {% include 'snipplets/defaults/home/main_category_item_help.tpl' with {'help_item_1': true} %}
                {% include 'snipplets/defaults/home/main_category_item_help.tpl' with {'help_item_2': true} %}
                {% include 'snipplets/defaults/home/main_category_item_help.tpl' with {'help_item_3': true} %}
                {% include 'snipplets/defaults/home/main_category_item_help.tpl' with {'help_item_1': true} %}
                {% include 'snipplets/defaults/home/main_category_item_help.tpl' with {'help_item_2': true} %}
                {% include 'snipplets/defaults/home/main_category_item_help.tpl' with {'help_item_3': true} %}
                {% include 'snipplets/defaults/home/main_category_item_help.tpl' with {'help_item_1': true} %}
                {% include 'snipplets/defaults/home/main_category_item_help.tpl' with {'help_item_2': true} %}
                {% include 'snipplets/defaults/home/main_category_item_help.tpl' with {'help_item_3': true} %}
            </div>
        </div>
        <div class="text-center mt-4 ep-demo-categories-nav">
            <button type="button" class="js-swiper-categories-prev-demo swiper-button-prev svg-icon-text ep-demo-cat-prev" aria-label="{{ 'Categoria anterior' | translate }}">
                <svg class="icon-inline icon-lg icon-flip-horizontal" aria-hidden="true"><use xlink:href="#arrow-long"/></svg>
            </button>
            <button type="button" class="js-swiper-categories-next-demo swiper-button-next svg-icon-text ep-demo-cat-next" aria-label="{{ 'Proxima categoria' | translate }}">
                <svg class="icon-inline icon-lg" aria-hidden="true"><use xlink:href="#arrow-long"/></svg>
            </button>
        </div>
        <div class="placeholder-overlay transition-soft ep-demo-overlay">
            <div class="placeholder-info p-2 ep-demo-info">
                <svg class="icon-inline icon-2x" aria-hidden="true"><use xlink:href="#edit"/></svg>
                <div class="placeholder-description font-small-xs my-2 ep-demo-description">
                    {{ "Voce pode mostrar suas categorias principais em" | translate }} <br><strong>"{{ "Categorias principais" | translate }}"</strong>
                </div>
                {% if not params.preview %}
                    <a href="{{ admin_link }}#instatheme=pagina-de-inicio" class="btn-primary btn btn-small placeholder-button ep-demo-edit-btn">{{ "Editar" | translate }}</a>
                {% endif %}
            </div>
        </div>
    </div>
</section>
