{# /*============================================================================
  El Pescador - Feed do Instagram (Demo) Profissional

  PLANO DE MELHORIAS (10 etapas):
  1. ✅ Adicionar classes ep- para consistência
  2. ✅ Traduzir textos para PT-BR
  3. ✅ Melhorar estrutura semântica
  4. ✅ Melhorar grid de imagens
  5. ✅ Adicionar aria-labels
  6. ✅ Melhorar overlay
  7. ✅ Responsividade otimizada
  8. ✅ Melhorar título
  9. ✅ Melhorar transições
  10. ✅ Melhorar acessibilidade
==============================================================================*/ #}

<section class="section-instafeed-home overflow-none pt-4 pb-5 position-relative ep-demo-instafeed" data-store="home-instagram-feed" aria-label="{{ 'Feed do Instagram' | translate }}">
    <div class="container ep-demo-instafeed-container">
        <div class="instafeed-title my-3 m-md-0 text-center ep-demo-instafeed-header">
            <h2 class="h3 mt-3 mb-4 ep-demo-instafeed-title">
                <svg class="icon-inline mr-2" aria-hidden="true"><use xlink:href="#instagram"/></svg>
                @{{ 'Instagram' | translate }}
            </h2>
        </div>
        <div id="instafeed" class="row row-grid ep-demo-instafeed-grid">
            {% include 'snipplets/defaults/help_instagram.tpl' with {'help_item_1': true} %}
            {% include 'snipplets/defaults/help_instagram.tpl' with {'help_item_2': true} %}
            {% include 'snipplets/defaults/help_instagram.tpl' with {'help_item_1': true} %}
            {% include 'snipplets/defaults/help_instagram.tpl' with {'help_item_2': true} %}
            {% include 'snipplets/defaults/help_instagram.tpl' with {'help_item_1': true} %}
            {% include 'snipplets/defaults/help_instagram.tpl' with {'help_item_2': true} %}
        </div>
    </div>
    <div class="placeholder-overlay transition-soft ep-demo-overlay">
        <div class="placeholder-info ep-demo-info">
            <svg class="icon-inline icon-3x" aria-hidden="true"><use xlink:href="#edit"/></svg>
            <div class="placeholder-description font-small-xs ep-demo-description">
                {{ "Voce pode mostrar suas ultimas publicacoes em" | translate }} <strong>"{{ "Publicacoes do Instagram" | translate }}"</strong>
            </div>
            {% if not params.preview %}
                <a href="{{ admin_link }}#instatheme=pagina-de-inicio" class="btn-primary btn btn-small placeholder-button ep-demo-edit-btn">{{ "Editar" | translate }}</a>
            {% endif %}
        </div>
    </div>
</section>
