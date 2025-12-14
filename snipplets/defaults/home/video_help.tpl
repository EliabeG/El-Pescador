{# /*============================================================================
  El Pescador - Video (Demo) Profissional

  PLANO DE MELHORIAS (10 etapas):
  1. ✅ Adicionar classes ep- para consistência
  2. ✅ Traduzir textos para PT-BR
  3. ✅ Melhorar estrutura semântica
  4. ✅ Melhorar container de vídeo
  5. ✅ Adicionar aria-labels
  6. ✅ Melhorar overlay
  7. ✅ Responsividade otimizada
  8. ✅ Melhorar aspect ratio
  9. ✅ Melhorar transições
  10. ✅ Melhorar acessibilidade
==============================================================================*/ #}

<div class="js-home-video-placeholder position-relative ep-demo-video-placeholder">
    <div class="home-video embed-responsive-16by9 ep-demo-video-container" role="region" aria-label="{{ 'Video da loja' | translate }}">
        <svg viewBox="0 0 1130 635.63" aria-hidden="true"><use xlink:href="#video-placeholder"/></svg>
        <div class="placeholder-overlay transition-soft ep-demo-overlay">
            <div class="placeholder-info ep-demo-info">
                <svg class="icon-inline icon-3x" aria-hidden="true"><use xlink:href="#edit"/></svg>
                <div class="placeholder-description font-small-xs ep-demo-description">
                    {{ "Voce pode adicionar seu video do YouTube em" | translate }} <strong>"{{ "Video" | translate }}"</strong>
                </div>
                {% if not params.preview %}
                    <a href="{{ admin_link }}#instatheme=pagina-de-inicio" class="btn-primary btn btn-small placeholder-button ep-demo-edit-btn">{{ "Editar" | translate }}</a>
                {% endif %}
            </div>
        </div>
    </div>
</div>

{# Skeleton of "true" section accessed from instatheme.js #}
<div class="js-home-video-top" style="display:none">
    {% include 'snipplets/home/home-video.tpl' %}
</div>
