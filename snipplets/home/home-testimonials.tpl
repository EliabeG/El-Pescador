{# /*============================================================================
  El Pescador - Depoimentos Profissional

  PLANO DE MELHORIAS (10 etapas):
  1. ✅ Adicionar classes ep- para consistência
  2. ✅ Melhorar slider de depoimentos
  3. ✅ Melhorar imagens dos clientes
  4. ✅ Traduzir textos para PT-BR
  5. ✅ Melhorar controles do slider
  6. ✅ Adicionar ícone de citação
  7. ✅ Melhorar espaçamentos
  8. ✅ Responsividade otimizada
  9. ✅ Melhorar acessibilidade
  10. ✅ Adicionar estrelas de avaliação
==============================================================================*/ #}

{% set has_home_testimonials = false %}
{% set num_testimonials = 0 %}
{% for testimonial in ['testimonial_01', 'testimonial_02', 'testimonial_03'] %}
    {% set testimonial_image = "#{testimonial}.jpg" | has_custom_image %}
    {% set testimonial_name = attribute(settings,"#{testimonial}_name") %}
    {% set testimonial_description = attribute(settings,"#{testimonial}_description") %}
    {% set has_testimonial = testimonial_name or testimonial_description or testimonial_image %}
    {% if has_testimonial %}
        {% set has_home_testimonials = true %}
        {% set num_testimonials = num_testimonials + 1 %}
    {% endif %}
{% endfor %}

{% if has_home_testimonials %}
    <section class="section-testimonials-home overflow-none ep-testimonials-section{% if not settings.testimonials_title %} pt-4{% endif %}" data-store="home-testimonials" aria-label="{{ 'Depoimentos de clientes' | translate }}">
        <div class="container ep-testimonials-container">
            {% if settings.testimonials_title %}
                <h2 class="h3 mt-3 mb-4 text-center ep-testimonials-title">{{ settings.testimonials_title }}</h2>
            {% endif %}
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="js-swiper-testimonials swiper-testimonials swiper-container ep-testimonials-slider">
                        <div class="swiper-wrapper ep-testimonials-wrapper">
                            {% for testimonial in ['testimonial_01', 'testimonial_02', 'testimonial_03'] %}
                                {% set testimonial_image = "#{testimonial}.jpg" | has_custom_image %}
                                {% set testimonial_name = attribute(settings,"#{testimonial}_name") %}
                                {% set testimonial_description = attribute(settings,"#{testimonial}_description") %}
                                {% set has_testimonial = testimonial_name or testimonial_description or testimonial_image %}
                                {% if has_testimonial %}
                                    <div class="swiper-slide ep-testimonial-slide">
                                        <div class="py-3 px-5 p-md-3 text-center ep-testimonial-content">
                                            <div class="testimonials-image mb-3 ep-testimonial-image{% if not testimonial_image %} line ep-no-image{% endif %}">
                                                {% if testimonial_image %}
                                                    <img class="testimonials-image-background lazyload ep-testimonial-img" src="{{ 'images/empty-placeholder.png' | static_url }}" data-src='{{ "#{testimonial}.jpg" | static_url | settings_image_url("small") }}' {% if testimonial_name %}alt="{{ testimonial_name }}"{% else %}alt="{{ 'Depoimento de cliente' | translate }} {{ store.name }}"{% endif %} />
                                                        <div class="placeholder-fade ep-placeholder"></div>
                                                {% else %}
                                                    <svg class="icon-inline icon-lg ep-quote-icon"><use xlink:href="#quote"/></svg>
                                                {% endif %}
                                            </div>
                                            {# Star rating #}
                                            <div class="mb-2 ep-testimonial-stars">
                                                {% for i in 1..5 %}
                                                    <svg class="icon-inline icon-sm text-accent"><use xlink:href="#star"/></svg>
                                                {% endfor %}
                                            </div>
                                            {% if testimonial_description %}
                                                <p class="mb-3 ep-testimonial-text{% if settings.testimonials_italic %} font-italic{% endif %}">{{ testimonial_description }}</p>
                                            {% endif %}
                                            {% if testimonial_name %}
                                                <h3 class="h6 font-weight-bold ep-testimonial-name {% if num_testimonials > 1 %}mb-0{% else %}mb-3{% endif %}">{{ testimonial_name }}</h3>
                                            {% endif %}
                                        </div>
                                    </div>
                                {% endif %}
                            {% endfor %}
                        </div>
                    </div>
                    {% if num_testimonials > 1 %}
                        <div class="text-center mb-2 ep-testimonials-controls">
                            <div class="js-swiper-testimonials-prev swiper-button-prev svg-icon-text ep-test-prev" aria-label="{{ 'Depoimento anterior' | translate }}">
                                <svg class="icon-inline icon-lg icon-flip-horizontal"><use xlink:href="#arrow-long"/></svg>
                            </div>
                            <div class="js-swiper-testimonials-next swiper-button-next svg-icon-text ep-test-next" aria-label="{{ 'Proximo depoimento' | translate }}">
                                <svg class="icon-inline icon-lg"><use xlink:href="#arrow-long"/></svg>
                            </div>
                        </div>
                    {% endif %}
                </div>
            </div>
        </div>
    </section>
{% endif %}
