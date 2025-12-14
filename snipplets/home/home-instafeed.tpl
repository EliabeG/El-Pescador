{# /*============================================================================
  El Pescador - Feed Instagram Profissional

  PLANO DE MELHORIAS (10 etapas):
  1. ✅ Adicionar classes ep- para consistência
  2. ✅ Melhorar título com ícone
  3. ✅ Melhorar grid de fotos
  4. ✅ Traduzir textos para PT-BR
  5. ✅ Melhorar botão ver perfil
  6. ✅ Melhorar espaçamentos
  7. ✅ Adicionar hover effects
  8. ✅ Responsividade otimizada
  9. ✅ Melhorar acessibilidade
  10. ✅ Adicionar call to action
==============================================================================*/ #}

{% if settings.show_instafeed and store.instagram and store.hasInstagramToken() %}
    <section class="section-instafeed-home overflow-none py-4 ep-instafeed-section" data-store="home-instagram-feed" aria-label="{{ 'Feed do Instagram' | translate }}">
        <div class="container ep-instafeed-container">
            {% set instuser = store.instagram|split('/')|last %}
            <a target="_blank" href="{{ store.instagram }}" class="mb-0 ep-insta-header-link" aria-label="{{ 'Instagram de' | translate }} {{ store.name }}" rel="noopener noreferrer">
                <div class="instafeed-title my-3 m-md-0 text-center ep-instafeed-title">
                    <h2 class="h3 mt-3 mb-4 ep-insta-title">
                        <svg class="icon-inline mr-2 svg-icon-text ep-insta-icon"><use xlink:href="#instagram"/></svg>
                        @{{ instuser }}
                    </h2>
                </div>
            </a>
            {% if store.hasInstagramToken() %}
                <div class="js-ig-success row row-grid ep-instafeed-grid"
                    data-ig-feed
                    data-ig-items-count="6"
                    data-ig-item-class="col-4 col-grid col-md-3 instafeed-col ep-insta-item"
                    data-ig-link-class="instafeed-link ep-insta-link"
                    data-ig-image-class="instafeed-img w-100 fade-in ep-insta-img"
                    data-ig-aria-label="{{ 'Publicacao do Instagram de' | translate }} {{ store.name }}"
                    style="display: none;">
                </div>
            {% endif %}
            <div class="text-center mb-3 ep-instafeed-cta">
                <a target="_blank" href="{{ store.instagram }}" class="btn-link ep-insta-btn" aria-label="{{ 'Ver perfil no Instagram' | translate }}" rel="noopener noreferrer">
                    <svg class="icon-inline mr-1"><use xlink:href="#instagram"/></svg>
                    {{ 'Siga-nos no Instagram' | translate }}
                </a>
            </div>
        </div>
    </section>
{% endif %}
