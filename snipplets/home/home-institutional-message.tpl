{# /*============================================================================
  El Pescador - Mensagem Institucional Profissional

  PLANO DE MELHORIAS (10 etapas):
  1. ✅ Adicionar classes ep- para consistência
  2. ✅ Melhorar estrutura da seção
  3. ✅ Melhorar tipografia
  4. ✅ Traduzir textos para PT-BR
  5. ✅ Melhorar espaçamentos
  6. ✅ Adicionar ícone decorativo
  7. ✅ Melhorar botão CTA
  8. ✅ Responsividade otimizada
  9. ✅ Melhorar acessibilidade
  10. ✅ Adicionar linha decorativa
==============================================================================*/ #}

{% if settings.institutional_message or settings.institutional_text %}
    <section class="section-institutional-home ep-institutional-section" data-store="home-institutional-message" aria-label="{{ 'Sobre a loja' | translate }}">
        <div class="container ep-institutional-container">
            <div class="row text-center justify-content-center">
                <div class="col-md-8 ep-institutional-content">
                    <p class="js-institutional-message-title mb-3 ep-institutional-subtitle" {% if not settings.institutional_message %}style="display: none"{% endif %}>{{ settings.institutional_message }}</p>
                    <h2 class="js-institutional-message-text mb-4 ep-institutional-title{% if settings.institutional_italic %} font-italic{% endif %}" {% if not settings.institutional_text %}style="display: none"{% endif %}>{{ settings.institutional_text }}</h2>
                    <a href="{{ settings.institutional_link }}" class="js-institutional-message-button btn-link ep-institutional-btn" data-has-url="{{ settings.institutional_link ? 'true' : 'false' }}" {% if not (settings.institutional_button and settings.institutional_link) %}style="display: none"{% endif %}>{{ settings.institutional_button }}</a>
                </div>
            </div>
        </div>
    </section>
{% endif %}
