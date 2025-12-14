{# /*============================================================================
  El Pescador - Slider Principal Profissional

  PLANO DE MELHORIAS (10 etapas):
  1. ✅ Adicionar classes ep- para consistência
  2. ✅ Melhorar estrutura do slider
  3. ✅ Melhorar controles de navegação
  4. ✅ Traduzir textos para PT-BR
  5. ✅ Melhorar textos sobre imagem
  6. ✅ Melhorar lazy loading
  7. ✅ Melhorar animações
  8. ✅ Responsividade otimizada
  9. ✅ Melhorar acessibilidade
  10. ✅ Adicionar indicadores visuais
==============================================================================*/ #}

{% set has_main_slider = settings.slider and settings.slider is not empty %}
{% set has_mobile_slider = settings.toggle_slider_mobile and settings.slider_mobile and settings.slider_mobile is not empty %}
{% set slider_animation = settings.slider_animation ? 'true' : 'false' %}

{% if not mobile %}
<div class="js-home-main-slider-container ep-slider-container {% if not has_main_slider and not params.preview %}hidden{% endif %}">
{% endif %}
    <div class="{% if mobile %}js-home-mobile-slider{% else %}js-home-main-slider{% endif %}-visibility ep-slider-visibility {% if has_main_slider and has_mobile_slider %}{% if mobile %}d-md-none{% else %}d-none d-md-block{% endif %}{% elseif not settings.toggle_slider_mobile and mobile %}hidden{% endif %}{% if not settings.slider_full and not settings.head_transparent %} mt-4{% endif %}">
        <div class="section-slider position-relative ep-section-slider">
            <div class="js-home-slider-container container{% if settings.slider_full %}-fluid p-0{% endif %} ep-slider-inner">
                <div class="js-home-slider-row row{% if settings.slider_full %} no-gutters{% endif %} ep-slider-row">
                    <div class="col-12">
                        <div class="js-home-slider{% if mobile %}-mobile{% endif %} swiper-container swiper-container-horizontal ep-swiper" data-animation="{{ slider_animation }}" role="region" aria-label="{{ 'Carrossel de banners' | translate }}">
                            <div class="swiper-wrapper ep-swiper-wrapper">
                                {% if mobile %}
                                    {% set slider = settings.slider_mobile %}
                                {% else %}
                                    {% set slider = settings.slider %}
                                {% endif %}
                                {% for slide in slider %}
                                    {% set has_text = slide.title or slide.description or slide.button %}
                                    <div class="swiper-slide slide-container swiper-{{ slide.color }} ep-slide" role="group" aria-label="{{ 'Slide' | translate }} {{ loop.index }}">
                                        {% if slide.link %}
                                            <a href="{{ slide.link | setting_url }}" aria-label="{{ slide.title ? slide.title : ('Banner' | translate ~ ' ' ~ loop.index) }}" class="ep-slide-link">
                                        {% endif %}
                                        <div class="slider-slide ep-slide-content">

                                            {% set apply_lazy_load =
                                                settings.home_order_position_1 != 'slider'
                                                or not (
                                                    loop.first and (
                                                        (has_main_slider and not has_mobile_slider) or
                                                        (has_mobile_slider and mobile)
                                                    )
                                                )
                                            %}

                                            {% if apply_lazy_load %}
                                                {% set slide_src = 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==' %}
                                            {% else %}
                                                {% set slide_src = slide.image | static_url | settings_image_url('large') %}
                                            {% endif %}

                                            <img
                                                {% if not apply_lazy_load %}fetchpriority="high"{% endif %}
                                                {% if slide.width and slide.height %} width="{{ slide.width }}" height="{{ slide.height }}" {% endif %}
                                                {% if apply_lazy_load %}data-{% endif %}src="{{ slide_src }}"
                                                {% if apply_lazy_load %}data-{% endif %}srcset="{{ slide.image | static_url | settings_image_url('large') }} 480w, {{ slide.image | static_url | settings_image_url('huge') }} 640w, {{ slide.image | static_url | settings_image_url('original') }} 1024w, {{ slide.image | static_url | settings_image_url('1080p') }} 1920w"
                                                class="js-slider-image slider-image ep-slide-img {% if settings.slider_animation %}slider-image-animation{% endif %} {% if apply_lazy_load %}swiper-lazy fade-in{% endif %}" alt="{{ slide.title ? slide.title : ('Banner El Pescador' | translate) }}"
                                            />
                                            <div class="placeholder-fade ep-placeholder"></div>
                                            {% if has_text %}
                                                <div class="swiper-text swiper-text-centered swiper-text-{{ slide.color }} ep-slide-text">
                                                    {% if slide.title %}
                                                        <div class="h1-huge mb-1 ep-slide-title">{{ slide.title }}</div>
                                                    {% endif %}
                                                    {% if slide.description %}
                                                        <p class="mb-2 ep-slide-desc">{{ slide.description }}</p>
                                                    {% endif %}
                                                    {% if slide.button and slide.link %}
                                                        <div class="btn-link ep-slide-btn">{{ slide.button }}</div>
                                                    {% endif %}
                                                </div>
                                            {% endif %}
                                        </div>
                                        {% if slide.link %}
                                            </a>
                                        {% endif %}
                                    </div>
                                {% endfor %}
                            </div>
                        </div>
                        <div class="mt-2 text-center ep-slider-controls">
                            <div class="js-swiper-home-control js-swiper-home-prev{% if mobile %}-mobile{% endif %} swiper-button-prev ep-prev" aria-label="{{ 'Slide anterior' | translate }}">
                                <svg class="icon-inline icon-lg icon-flip-horizontal svg-icon-text"><use xlink:href="#arrow-long"/></svg>
                            </div>
                            <div class="js-swiper-home-control js-swiper-home-pagination{% if mobile %}-mobile{% endif %} swiper-pagination-fraction ep-pagination"></div>
                            <div class="js-swiper-home-control js-swiper-home-next{% if mobile %}-mobile{% endif %} swiper-button-next ep-next" aria-label="{{ 'Proximo slide' | translate }}">
                                <svg class="icon-inline icon-lg svg-icon-text"><use xlink:href="#arrow-long"/></svg>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
{% if not mobile %}
</div>
{% endif %}
