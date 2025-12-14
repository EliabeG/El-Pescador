{# /*============================================================================
  El Pescador - Banners Principais (Demo) Profissional

  PLANO DE MELHORIAS (10 etapas):
  1. ✅ Adicionar classes ep- para consistência
  2. ✅ Traduzir textos para PT-BR
  3. ✅ Melhorar estrutura semântica
  4. ✅ Melhorar grid de banners
  5. ✅ Adicionar aria-labels
  6. ✅ Melhorar overlay
  7. ✅ Responsividade otimizada
  8. ✅ Melhorar espaçamentos
  9. ✅ Melhorar transições
  10. ✅ Melhorar acessibilidade
==============================================================================*/ #}

<div class="js-{{ banner_name }}-banner-placeholder ep-demo-banners-placeholder">
    <div class="container ep-demo-banners-container">
        <div class="row">
            <div class="col-12">
                <div class="row px-2 ep-demo-banners-grid">
                    <div class="col-grid col-md-6 ep-demo-banner-col">
                        <div class="textbanner ep-demo-textbanner">
                            <div class="textbanner-image overlay textbanner-image-empty textbanner-image-empty-vertical ep-demo-banner-image" role="img" aria-label="{{ 'Banner de exemplo' | translate }}">
                            </div>
                            <div class="textbanner-text over-image ep-demo-banner-text">
                                <div class="h3 mb-1 ep-demo-banner-title">{{ banner_title }}</div>
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
                    <div class="col-grid col-md-6 ep-demo-banner-col">
                        <div class="textbanner ep-demo-textbanner">
                            <div class="textbanner-image overlay textbanner-image-empty textbanner-image-empty-vertical ep-demo-banner-image" role="img" aria-label="{{ 'Banner de exemplo' | translate }}">
                            </div>
                            <div class="textbanner-text over-image ep-demo-banner-text">
                                <div class="h3 mb-1 ep-demo-banner-title">{{ banner_title }}</div>
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
        </div>
    </div>
</div>

{# Skeleton of "true" section accessed from instatheme.js #}
<div class="js-{{ banner_name }}-banner-top" style="display:none">
    {% if banner_name == 'category' %}
        {% include 'snipplets/home/home-banners.tpl' with {'has_banner': true} %}
    {% endif %}
    {% if banner_name == 'promotional' %}
        {% include 'snipplets/home/home-banners.tpl' with {'has_banner_promotional': true} %}
    {% endif %}
    {% if banner_name == 'news' %}
        {% include 'snipplets/home/home-banners.tpl' with {'has_banner_news': true} %}
    {% endif %}
</div>
