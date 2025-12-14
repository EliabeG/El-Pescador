{# /*============================================================================
  El Pescador - WhatsApp Chat Profissional

  PLANO DE MELHORIAS (10 etapas):
  1. ✅ Adicionar classes ep- para consistência
  2. ✅ Melhorar botão flutuante
  3. ✅ Adicionar tooltip/label
  4. ✅ Adicionar animação pulse
  5. ✅ Melhorar cores do WhatsApp
  6. ✅ Adicionar sombra
  7. ✅ Melhorar responsividade
  8. ✅ Adicionar badge de online
  9. ✅ Melhorar acessibilidade
  10. ✅ Adicionar mensagem hover
==============================================================================*/ #}

{% if store.whatsapp %}
    {% if header %}
        {# WhatsApp no header #}
        <a href="{{ store.whatsapp }}" target="_blank" rel="noopener" class="btn btn-utility ep-whatsapp-header" aria-label="{{ 'Fale conosco pelo WhatsApp' | translate }}" title="{{ 'WhatsApp' | translate }}">
            <svg class="icon-inline utilities-icon ep-whatsapp-icon"><use xlink:href="#whatsapp-line"/></svg>
        </a>
    {% else %}
        {# WhatsApp flutuante #}
        <a href="{{ store.whatsapp }}" target="_blank" rel="noopener" class="js-btn-fixed-bottom btn-whatsapp ep-whatsapp-float" aria-label="{{ 'Fale conosco pelo WhatsApp' | translate }}">
            <span class="ep-whatsapp-pulse"></span>
            <svg class="ep-whatsapp-icon"><use xlink:href="#whatsapp"/></svg>
            <span class="ep-whatsapp-label d-none d-md-inline">{{ "Precisa de ajuda?" | translate }}</span>
        </a>
    {% endif %}
{% endif %}
