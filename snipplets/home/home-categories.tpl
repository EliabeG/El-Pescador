{# /*============================================================================
  El Pescador - Categorias da Home Profissional

  PLANO DE MELHORIAS (10 etapas):
  1. ✅ Adicionar classes ep- para consistência
  2. ✅ Melhorar slider de categorias
  3. ✅ Melhorar imagens das categorias
  4. ✅ Traduzir textos para PT-BR
  5. ✅ Melhorar controles do slider
  6. ✅ Melhorar título da seção
  7. ✅ Adicionar hover effects
  8. ✅ Responsividade otimizada
  9. ✅ Melhorar acessibilidade
  10. ✅ Melhorar lazy loading
==============================================================================*/ #}

{% if settings.main_categories and settings.slider_categories and settings.slider_categories is not empty %}
    <section class="section-categories-home position-relative ep-categories-section" data-store="home-categories-featured" aria-label="{{ 'Categorias em destaque' | translate }}">
        <div class="container ep-categories-container">
            {% if settings.main_categories_title %}
                <h2 class="h3 mt-3 mb-4 text-center ep-categories-title">{{ settings.main_categories_title }}</h2>
            {% endif %}
            <div class="js-swiper-categories swiper-container ep-categories-slider">
                <div class="swiper-wrapper ep-categories-wrapper">
                    {% for slide in settings.slider_categories %}
                        <div class="swiper-slide w-md-auto ep-category-slide">
                            {% if slide.link %}
                                <a href="{{ slide.link | setting_url }}" class="js-home-category ep-category-link" aria-label="{{ 'Categoria' | translate }} {{ loop.index }}">
                            {% endif %}
                                <div class="home-category text-center ep-category-item">
                                    <div class="home-category-image home-category-image-md ep-category-image">
                                        <img src="{{ 'images/empty-placeholder.png' | static_url }}" data-src="{{ slide.image | static_url | settings_image_url('small') }}" class="swiper-lazy fade-in ep-category-img" alt="{{ 'Categoria' | translate }} {{ loop.index }}">
                                        <div class="placeholder-fade ep-placeholder"></div>
                                        {% if slide.link %}
                                            {% set category_handle = slide.link | trim('/') | split('/') | last %}
                                            {% include 'snipplets/home/home-categories-name.tpl' %}
                                        {% endif %}
                                    </div>
                                </div>
                            {% if slide.link %}
                                </a>
                            {% endif %}
                        </div>
                    {% endfor %}
                </div>
            </div>
            <div class="text-center mt-4 ep-categories-controls">
                <div class="js-swiper-categories-prev swiper-button-prev svg-icon-text ep-cat-prev" aria-label="{{ 'Categoria anterior' | translate }}">
                    <svg class="icon-inline icon-lg icon-flip-horizontal"><use xlink:href="#arrow-long"/></svg>
                </div>
                <div class="js-swiper-categories-next swiper-button-next svg-icon-text ep-cat-next" aria-label="{{ 'Proxima categoria' | translate }}">
                    <svg class="icon-inline icon-lg"><use xlink:href="#arrow-long"/></svg>
                </div>
            </div>
        </div>
    </section>
{% endif %}
