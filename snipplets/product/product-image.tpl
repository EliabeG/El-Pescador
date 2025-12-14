{# /*============================================================================
  El Pescador - Imagem de Produto Profissional

  PLANO DE MELHORIAS (10 etapas):
  1. ✅ Adicionar classes ep- para consistência
  2. ✅ Melhorar galeria de imagens
  3. ✅ Melhorar thumbnails
  4. ✅ Traduzir textos para PT-BR
  5. ✅ Melhorar controles do slider
  6. ✅ Melhorar zoom da imagem
  7. ✅ Melhorar vídeo do produto
  8. ✅ Responsividade otimizada
  9. ✅ Melhorar acessibilidade
  10. ✅ Melhorar lazy loading
==============================================================================*/ #}

{% if home_main_product %}
    {% set has_multiple_slides = product.media_count > 1 %}
{% else %}
    {% set has_multiple_slides = product.media_count > 1 or product.video_url %}
{% endif %}

<div class="row ep-product-gallery" data-store="product-image-{{ product.id }}">
    {% if has_multiple_slides %}
        <div class="col-md-auto d-none d-md-block pr-0 ep-thumbs-col">
            <div class="product-thumbs-container position-relative ep-thumbs-container">
                <div class="js-swiper-product-thumbs swiper-product-thumb ep-thumbs-slider">
                    <div class="swiper-wrapper ep-thumbs-wrapper">
                        {% for media in product.media %}
                            <div class="swiper-slide h-auto w-auto ep-thumb-slide">
                                {% include 'snipplets/product/product-image-thumbs.tpl' %}
                            </div>
                        {% endfor %}
                        {% if not home_main_product %}
                            {# Video thumb #}
                            <div class="swiper-slide h-auto w-auto ep-thumb-slide ep-video-thumb">
                                {% include 'snipplets/product/product-video.tpl' with {thumb: true} %}
                            </div>
                        {% endif %}
                    </div>
                </div>
                <div class="mt-2 text-center d-none d-md-block ep-thumbs-controls">
                    <div class="js-swiper-product-thumbs-prev swiper-button-small swiper-button-prev swiper-product-thumb-control ep-thumb-prev" aria-label="{{ 'Imagem anterior' | translate }}">
                        <svg class="icon-inline icon-lg svg-icon-text icon-rotate-90-neg"><use xlink:href="#chevron"/></svg>
                    </div>
                    <div class="js-swiper-product-thumbs-next swiper-button-small swiper-button-next swiper-product-thumb-control ep-thumb-next" aria-label="{{ 'Proxima imagem' | translate }}">
                        <svg class="icon-inline icon-lg svg-icon-text icon-rotate-90"><use xlink:href="#chevron"/></svg>
                    </div>
                </div>
            </div>
        </div>
    {% endif %}
    {% if product.media_count > 0 %}
        <div class="col px-3 ep-main-image-col">
            <div class="js-swiper-product swiper-container product-detail-slider ep-main-slider" data-product-images-amount="{{ product.media_count }}">
                {% include 'snipplets/labels.tpl' with {product_detail: true, labels_floating: true} %}
                <div class="swiper-wrapper ep-slider-wrapper">
                    {% for media in product.media %}
                        {% if media.isImage %}
                            <div class="js-product-slide w-100 swiper-slide product-slide{% if home_main_product %}-small{% endif %} slider-slide ep-image-slide" data-image="{{media.id}}" data-image-position="{{loop.index0}}">
                                {% if home_main_product %}
                                    <div class="js-product-slide-link d-block position-relative ep-image-link" style="padding-bottom: {{ media.dimensions['height'] / media.dimensions['width'] * 100}}%;">
                                {% else %}
                                    <a href="{{ media | product_image_url('original') }}" data-fancybox="product-gallery" class="js-product-slide-link d-block position-relative ep-image-link" style="padding-bottom: {{ media.dimensions['height'] / media.dimensions['width'] * 100}}%;" aria-label="{{ 'Ampliar imagem' | translate }}">
                                {% endif %}

                                    {% set apply_lazy_load = home_main_product or not loop.first %}

                                    {% if apply_lazy_load %}
                                        {% set product_image_src = 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==' %}
                                    {% else %}
                                        {% set product_image_src = media | product_image_url('large') %}
                                    {% endif %}

                                    <img
                                        {% if not apply_lazy_load %}fetchpriority="high"{% endif %}
                                        {% if apply_lazy_load %}data-{% endif %}src="{{ product_image_src }}"
                                        {% if apply_lazy_load %}data-{% endif %}srcset='{{  media | product_image_url('large') }} 480w, {{  media | product_image_url('huge') }} 640w, {{  media | product_image_url('original') }} 1024w'
                                        class="js-product-slide-img product-slider-image img-absolute img-absolute-centered ep-product-img {% if apply_lazy_load %}lazyautosizes lazyload{% endif %}"
                                        {% if apply_lazy_load %}data-sizes="auto"{% endif %}
                                        {% if media.dimensions.width and media.dimensions.height %}width="{{ media.dimensions.width }}" height="{{ media.dimensions.height }}"{% endif %}
                                        {% if media.alt %}alt="{{media.alt}}"{% else %}alt="{{ product.name }}"{% endif %} />
                                {% if home_main_product %}
                                    </div>
                                {% else %}
                                    </a>
                                {% endif %}
                            </div>
                        {% else %}
                            {% include 'snipplets/product/product-video.tpl' with {video_id: media.next_video, product_native_video: true, home_main_product: home_main_product, media: media} %}
                        {% endif %}
                    {% endfor %}
                    {% if not home_main_product %}
                        {% include 'snipplets/product/product-video.tpl' with {video_id: 'yt'} %}
                    {% endif %}
                </div>
            </div>
            {% if has_multiple_slides %}
                <div class="row no-gutters my-1 text-center align-items-center d-md-none ep-mobile-controls">
                    <div class="js-swiper-product-prev col-auto swiper-button-small swiper-button-prev svg-icon-text mt-0 ep-prev-btn" aria-label="{{ 'Imagem anterior' | translate }}">
                        <svg class="icon-inline icon-lg icon-flip-horizontal"><use xlink:href="#arrow-long"/></svg>
                    </div>
                    <div class="js-swiper-product-pagination col swiper-pagination-fraction font-small ep-pagination"></div>
                    <div class="js-swiper-product-next col-auto swiper-button-small swiper-button-next svg-icon-text mt-0 ep-next-btn" aria-label="{{ 'Proxima imagem' | translate }}">
                        <svg class="icon-inline icon-lg"><use xlink:href="#arrow-long"/></svg>
                    </div>
                </div>
            {% endif %}
            {% if not home_main_product %}

                {# Product share #}

                <div class="text-center d-none d-md-block mt-4 ep-share-section">
                    {% include 'snipplets/social/social-share.tpl' %}
                </div>
            {% endif %}
        </div>
    {% endif %}
</div>
