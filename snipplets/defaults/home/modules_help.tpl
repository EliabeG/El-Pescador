{# /*============================================================================
  El Pescador - Modulos/Banners (Demo) Profissional

  PLANO DE MELHORIAS (10 etapas):
  1. ✅ Adicionar classes ep- para consistência
  2. ✅ Traduzir textos para PT-BR
  3. ✅ Melhorar estrutura semântica
  4. ✅ Melhorar layout dos banners
  5. ✅ Adicionar aria-labels
  6. ✅ Melhorar overlay
  7. ✅ Responsividade otimizada
  8. ✅ Melhorar espaçamentos
  9. ✅ Melhorar transições
  10. ✅ Melhorar acessibilidade
==============================================================================*/ #}

<div class="js-module-banner-placeholder ep-demo-module-placeholder">
    <div class="container ep-demo-module-container">
        <div class="textbanner mb-md-5 pb-md-5 ep-demo-textbanner">
            <div class="row no-gutters align-items-center">
                <div class="col-md-6 textbanner-image overlay overflow-none textbanner-image-empty textbanner-image-empty-module ep-demo-banner-image" role="img" aria-label="{{ 'Banner de exemplo' | translate }}">
                </div>
                <div class="col-md-6 px-3 px-md-4 textbanner-text ep-demo-banner-text">
                    <div class="h3 mb-3 ep-demo-banner-title">{{ module_title }}</div>
                    <div class="textbanner-paragraph mb-3 ep-demo-banner-desc">{{ module_description }}</div>
                </div>
                <div class="placeholder-overlay transition-soft ep-demo-overlay">
                    <div class="placeholder-info ep-demo-info">
                        <svg class="icon-inline icon-3x" aria-hidden="true"><use xlink:href="#edit"/></svg>
                        <div class="placeholder-description font-small-xs ep-demo-description">
                            {{ help_text }} <strong>"{{ section_name }}"</strong>
                        </div>
                        {% if not params.preview %}
                            <a href="{{ admin_link }}#instatheme=pagina-de-inicio" class="btn-primary btn btn-small placeholder-button ep-demo-edit-btn">{{ "Editar" | translate }}</a>
                        {% endif %}
                    </div>
                </div>
            </div>
        </div>
        <div class="textbanner mb-md-5 pb-md-5 ep-demo-textbanner">
            <div class="row no-gutters align-items-center">
                <div class="col-md-6 textbanner-image overlay overflow-none textbanner-image-empty textbanner-image-empty-module ep-demo-banner-image" role="img" aria-label="{{ 'Banner de exemplo' | translate }}">
                </div>
                <div class="col-md-6 px-3 px-md-4 order-md-first textbanner-text ep-demo-banner-text">
                    <div class="h3 mb-3 ep-demo-banner-title">{{ module_title }}</div>
                    <div class="textbanner-paragraph mb-3 ep-demo-banner-desc">{{ module_description }}</div>
                </div>
                <div class="placeholder-overlay transition-soft ep-demo-overlay">
                    <div class="placeholder-info ep-demo-info">
                        <svg class="icon-inline icon-3x" aria-hidden="true"><use xlink:href="#edit"/></svg>
                        <div class="placeholder-description font-small-xs ep-demo-description">
                            {{ help_text }} <strong>"{{ section_name }}"</strong>
                        </div>
                        {% if not params.preview %}
                            <a href="{{ admin_link }}#instatheme=pagina-de-inicio" class="btn-primary btn btn-small placeholder-button ep-demo-edit-btn">{{ "Editar" | translate }}</a>
                        {% endif %}
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

{# Skeleton of "true" section accessed from instatheme.js #}
<div class="js-module-banner-top" style="display:none">
    {% include 'snipplets/home/home-banners.tpl' with {'has_module': true} %}
</div>
