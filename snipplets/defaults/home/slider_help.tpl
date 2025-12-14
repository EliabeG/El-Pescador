{# /*============================================================================
  El Pescador - Slider Principal (Demo) Profissional

  PLANO DE MELHORIAS (10 etapas):
  1. ✅ Adicionar classes ep- para consistência
  2. ✅ Traduzir textos para PT-BR
  3. ✅ Melhorar estrutura semântica
  4. ✅ Melhorar navegação do slider
  5. ✅ Adicionar aria-labels
  6. ✅ Melhorar overlay
  7. ✅ Responsividade otimizada
  8. ✅ Melhorar botões
  9. ✅ Melhorar transições
  10. ✅ Melhorar acessibilidade
==============================================================================*/ #}

{% set slide_view_box = '0 0 1440 770' %}

<div class="js-home-slider-placeholder ep-demo-slider-placeholder">
    <div class="section-slider p-0 ep-demo-slider-section">
        <div class="container ep-demo-slider-container">
            <div class="js-home-empty-slider swiper-container ep-demo-slider" role="region" aria-label="{{ 'Carrossel de imagens' | translate }}">
                <div class="swiper-wrapper ep-demo-slider-wrapper">
                    <div class="swiper-slide slide-container ep-demo-slide">
                        <svg viewBox='{{ slide_view_box }}' aria-hidden="true"><use xlink:href="#slider-slide-placeholder"/></svg>
                    </div>
                    <div class="swiper-slide slide-container ep-demo-slide">
                        <svg viewBox='{{ slide_view_box }}' aria-hidden="true"><use xlink:href="#slider-slide-placeholder"/></svg>
                    </div>
                    <div class="swiper-slide slide-container ep-demo-slide">
                        <svg viewBox='{{ slide_view_box }}' aria-hidden="true"><use xlink:href="#slider-slide-placeholder"/></svg>
                    </div>
                </div>
                <div class="placeholder-overlay placeholder-slider transition-soft ep-demo-overlay">
                    <div class="placeholder-info ep-demo-info">
                        <svg class="icon-inline icon-3x" aria-hidden="true"><use xlink:href="#edit"/></svg>
                        <div class="placeholder-description font-small-xs ep-demo-description">
                            {{ "Voce pode subir imagens principais em" | translate }} <strong>"{{ "Carrossel de imagens" | translate }}"</strong>
                        </div>
                        {% if not params.preview %}
                            <a href="{{ admin_link }}#instatheme=pagina-de-inicio" class="btn-primary btn btn-small placeholder-button ep-demo-edit-btn">{{ "Editar" | translate }}</a>
                        {% endif %}
                    </div>
                </div>
                <div class="mt-2 text-center ep-demo-slider-nav">
                    <button type="button" class="js-swiper-empty-home-prev swiper-button-prev ep-demo-prev" aria-label="{{ 'Slide anterior' | translate }}">
                        <svg class="icon-inline icon-lg icon-flip-horizontal" aria-hidden="true"><use xlink:href="#arrow-long"/></svg>
                    </button>
                    <div class="js-swiper-empty-home-pagination swiper-pagination-fraction ep-demo-pagination"></div>
                    <button type="button" class="js-swiper-empty-home-next swiper-button-next ep-demo-next" aria-label="{{ 'Proximo slide' | translate }}">
                        <svg class="icon-inline icon-lg" aria-hidden="true"><use xlink:href="#arrow-long"/></svg>
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>

{# Skeleton of "true" section accessed from instatheme.js #}
<div class="js-home-slider-top" style="display:none">
    {% include 'snipplets/home/home-slider.tpl' %}
    {% if has_mobile_slider %}
        {% include 'snipplets/home/home-slider.tpl' with {mobile: true} %}
    {% endif %}
</div>
