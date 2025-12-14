{# /*============================================================================
  El Pescador - Marcas Profissional

  PLANO DE MELHORIAS (10 etapas):
  1. ✅ Adicionar classes ep- para consistência
  2. ✅ Melhorar slider de marcas
  3. ✅ Melhorar imagens das marcas
  4. ✅ Traduzir textos para PT-BR
  5. ✅ Melhorar controles do slider
  6. ✅ Melhorar título da seção
  7. ✅ Adicionar hover effects
  8. ✅ Responsividade otimizada
  9. ✅ Melhorar acessibilidade
  10. ✅ Melhorar lazy loading
==============================================================================*/ #}

{% if settings.brands and settings.brands is not empty %}
    <section class="section-brands-home overflow-none ep-brands-section{% if not settings.brands_title %} mt-3 pt-4{% endif %}" data-store="home-brands" aria-label="{{ 'Marcas parceiras' | translate }}">
        <div class="container ep-brands-container">
            {% if settings.brands_title %}
                <h2 class="h3 mt-3 mb-4 text-center ep-brands-title">{{ settings.brands_title }}</h2>
            {% endif %}
            {% if settings.brands_format == 'slider' %}
                <div class="js-swiper-brands swiper-container text-center w-auto mx-4 m-md-0 ep-brands-slider">
                    <div class="js-swiper-brands-wrapper swiper-wrapper ep-brands-wrapper">
            {% else %}
                <div class="row mb-2 align-items-center ep-brands-grid">
            {% endif %}
                    {% for slide in settings.brands %}
                        <div class="{% if settings.brands_format == 'slider' %}swiper-slide slide-container ep-brand-slide{% else %}col-md-2 col-4 mb-4 ep-brand-col{% endif %} text-center">
                            {% if slide.link %}
                                <a href="{{ slide.link | setting_url }}" title="{{ 'Marca' | translate }} {{ loop.index }}" aria-label="{{ 'Marca' | translate }} {{ loop.index }}" class="ep-brand-link">
                            {% endif %}
                                    <img src="{{ 'images/empty-placeholder.png' | static_url }}" data-src="{{ slide.image | static_url | settings_image_url('large') }}" class="lazyload fade-in brand-image ep-brand-img" alt="{{ 'Marca parceira' | translate }} {{ loop.index }}">
                                    <div class="placeholder-fade ep-placeholder"></div>
                            {% if slide.link %}
                                </a>
                            {% endif %}
                        </div>
                    {% endfor %}
                </div>
            {% if settings.brands_format == 'slider' %}
                </div>
                <div class="text-center mt-3 ep-brands-controls">
                    <div class="js-swiper-brands-prev swiper-button-prev svg-icon-text ep-brand-prev" aria-label="{{ 'Marca anterior' | translate }}">
                        <svg class="icon-inline icon-lg icon-flip-horizontal"><use xlink:href="#arrow-long"/></svg>
                    </div>
                    <div class="js-swiper-brands-next swiper-button-next svg-icon-text ep-brand-next" aria-label="{{ 'Proxima marca' | translate }}">
                        <svg class="icon-inline icon-lg"><use xlink:href="#arrow-long"/></svg>
                    </div>
                </div>
            {% endif %}
        </div>
    </section>
{% endif %}
