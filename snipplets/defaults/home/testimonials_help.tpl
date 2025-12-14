{# /*============================================================================
  El Pescador - Depoimentos (Demo) Profissional

  PLANO DE MELHORIAS (10 etapas):
  1. ✅ Adicionar classes ep- para consistência
  2. ✅ Traduzir textos para PT-BR
  3. ✅ Melhorar estrutura semântica
  4. ✅ Melhorar slider de depoimentos
  5. ✅ Adicionar aria-labels
  6. ✅ Melhorar navegação
  7. ✅ Responsividade otimizada
  8. ✅ Melhorar overlay
  9. ✅ Melhorar tipografia
  10. ✅ Melhorar acessibilidade
==============================================================================*/ #}

<section class="section-testimonials-home overflow-none pt-4 ep-demo-testimonials" data-store="home-testimonials" aria-label="{{ 'Depoimentos de clientes' | translate }}">
    <h2 class="h3 mt-3 mb-4 text-center ep-demo-testimonials-title">{{ 'Depoimentos' | translate }}</h2>
    <div class="row justify-content-center position-relative">
        <div class="col-md-6 ep-demo-testimonials-col">
            <div class="js-swiper-testimonials-demo swiper-testimonials swiper-container ep-demo-testimonials-slider">
                <div class="swiper-wrapper ep-demo-testimonials-wrapper">
                    <div class="swiper-slide ep-demo-testimonial-slide">
                        <div class="py-3 px-5 p-md-3 text-center ep-demo-testimonial-content">
                            <div class="testimonials-image mb-3 line ep-demo-quote">
                                <svg class="icon-inline icon-lg" aria-hidden="true"><use xlink:href="#quote"/></svg>
                            </div>
                            <p class="mb-3 ep-demo-testimonial-text">{{ 'Descricao do depoimento' | translate }}</p>
                            <h3 class="h6 font-weight-bold mb-0 ep-demo-testimonial-author">{{ 'Depoimento' | translate }}</h3>
                        </div>
                    </div>
                    <div class="swiper-slide ep-demo-testimonial-slide">
                        <div class="py-3 px-5 p-md-3 text-center ep-demo-testimonial-content">
                            <div class="testimonials-image mb-3 line ep-demo-quote">
                                <svg class="icon-inline icon-lg" aria-hidden="true"><use xlink:href="#quote"/></svg>
                            </div>
                            <p class="mb-3 ep-demo-testimonial-text">{{ 'Descricao do depoimento' | translate }}</p>
                            <h3 class="h6 font-weight-bold mb-0 ep-demo-testimonial-author">{{ 'Depoimento' | translate }}</h3>
                        </div>
                    </div>
                    <div class="swiper-slide ep-demo-testimonial-slide">
                        <div class="py-3 px-5 p-md-3 text-center ep-demo-testimonial-content">
                            <div class="testimonials-image mb-3 line ep-demo-quote">
                                <svg class="icon-inline icon-lg" aria-hidden="true"><use xlink:href="#quote"/></svg>
                            </div>
                            <p class="mb-3 ep-demo-testimonial-text">{{ 'Descricao do depoimento' | translate }}</p>
                            <h3 class="h6 font-weight-bold mb-0 ep-demo-testimonial-author">{{ 'Depoimento' | translate }}</h3>
                        </div>
                    </div>
                </div>
            </div>
            <div class="text-center mb-2 ep-demo-testimonials-nav">
                <button type="button" class="js-swiper-testimonials-prev-demo swiper-button-prev svg-icon-text ep-demo-test-prev" aria-label="{{ 'Depoimento anterior' | translate }}">
                    <svg class="icon-inline icon-lg icon-flip-horizontal" aria-hidden="true"><use xlink:href="#arrow-long"/></svg>
                </button>
                <button type="button" class="js-swiper-testimonials-next-demo swiper-button-next svg-icon-text ep-demo-test-next" aria-label="{{ 'Proximo depoimento' | translate }}">
                    <svg class="icon-inline icon-lg" aria-hidden="true"><use xlink:href="#arrow-long"/></svg>
                </button>
            </div>
        </div>
        <div class="placeholder-overlay transition-soft ep-demo-overlay">
            <div class="placeholder-info p-2 ep-demo-info">
                <svg class="icon-inline icon-2x" aria-hidden="true"><use xlink:href="#edit"/></svg>
                <div class="placeholder-description font-small-xs my-2 ep-demo-description">
                    {{ "Voce pode mostrar depoimentos de seus clientes em" | translate }} <br><strong>"{{ "Depoimentos" | translate }}"</strong>
                </div>
                {% if not params.preview %}
                    <a href="{{ admin_link }}#instatheme=pagina-de-inicio" class="btn-primary btn btn-small placeholder-button ep-demo-edit-btn">{{ "Editar" | translate }}</a>
                {% endif %}
            </div>
        </div>
    </div>
</section>
