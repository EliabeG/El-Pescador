{# /*============================================================================
  El Pescador - Banners Informativos (Demo) Profissional

  PLANO DE MELHORIAS (10 etapas):
  1. ✅ Adicionar classes ep- para consistência
  2. ✅ Traduzir textos para PT-BR
  3. ✅ Melhorar estrutura semântica
  4. ✅ Melhorar slider
  5. ✅ Adicionar aria-labels
  6. ✅ Melhorar navegação
  7. ✅ Responsividade otimizada
  8. ✅ Melhorar overlay
  9. ✅ Melhorar transições
  10. ✅ Melhorar acessibilidade
==============================================================================*/ #}

<section class="section-informative-banners ep-demo-informative" data-store="banner-services" aria-label="{{ 'Informacoes da loja' | translate }}">
    <div class="container position-relative py-3 ep-demo-informative-container">
        <div class="js-informative-banners-demo swiper-container mb-3 ep-demo-informative-slider">
            <div class="swiper-wrapper ep-demo-informative-wrapper">
                {% include 'snipplets/defaults/help_banner_services_item.tpl' with {'help_item_1': true} %}
                {% include 'snipplets/defaults/help_banner_services_item.tpl' with {'help_item_2': true} %}
                {% include 'snipplets/defaults/help_banner_services_item.tpl' with {'help_item_3': true} %}
                {% include 'snipplets/defaults/help_banner_services_item.tpl' with {'help_item_4': true} %}
            </div>
        </div>
        <div class="text-center mt-4 d-block d-md-none ep-demo-informative-nav">
            <button type="button" class="js-informative-banners-prev-demo swiper-button-prev ep-demo-info-prev" aria-label="{{ 'Banner anterior' | translate }}">
                <svg class="icon-inline icon-lg icon-flip-horizontal" aria-hidden="true"><use xlink:href="#arrow-long"/></svg>
            </button>
            <button type="button" class="js-informative-banners-next-demo swiper-button-next ep-demo-info-next" aria-label="{{ 'Proximo banner' | translate }}">
                <svg class="icon-inline icon-lg" aria-hidden="true"><use xlink:href="#arrow-long"/></svg>
            </button>
        </div>
        <div class="placeholder-overlay transition-soft ep-demo-overlay">
            <div class="placeholder-info p-2 ep-demo-info">
                <svg class="icon-inline icon-2x" aria-hidden="true"><use xlink:href="#edit"/></svg>
                <div class="placeholder-description font-small-xs my-2 ep-demo-description">
                    {{ "Voce pode mostrar informacoes de compra em" | translate }} <br><strong>"{{ "Informacoes de envio, pagamento e compra" | translate }}"</strong>
                </div>
                {% if not params.preview %}
                    <a href="{{ admin_link }}#instatheme=pagina-de-inicio" class="btn-primary btn btn-small placeholder-button ep-demo-edit-btn">{{ "Editar" | translate }}</a>
                {% endif %}
            </div>
        </div>
    </div>
</section>
