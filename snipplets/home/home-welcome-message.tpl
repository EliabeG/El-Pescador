{# /*============================================================================
  El Pescador - Mensagem de Boas-vindas Profissional

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

{% if settings.welcome_message or settings.welcome_text %}
    <section class="section-welcome-home ep-welcome-section" data-store="home-welcome-message" aria-label="{{ 'Mensagem de boas-vindas' | translate }}">
        <div class="container ep-welcome-container">
            <div class="row text-center justify-content-center">
                <div class="col-md-8 ep-welcome-content">
                    <p class="js-welcome-message-title mb-3 ep-welcome-subtitle" {% if not settings.welcome_message %}style="display: none"{% endif %}>{{ settings.welcome_message }}</p>
                    <h2 class="js-welcome-message-text mb-4 ep-welcome-title{% if settings.welcome_italic %} font-italic{% endif %}" {% if not settings.welcome_text %}style="display: none"{% endif %}>{{ settings.welcome_text }}</h2>
                    <a href="{{ settings.welcome_link }}" class="js-welcome-message-button btn-link ep-welcome-btn" data-has-url="{{ settings.welcome_link ? 'true' : 'false' }}" {% if not (settings.welcome_button and settings.welcome_link) %}style="display: none"{% endif %}>{{ settings.welcome_button }}</a>
                </div>
            </div>
        </div>
    </section>
{% endif %}
