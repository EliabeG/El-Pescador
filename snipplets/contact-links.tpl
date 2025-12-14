{# /*============================================================================
  El Pescador - Links de Contato Profissionais

  PLANO DE MELHORIAS (10 etapas):
  1. ✅ Melhorar estrutura visual com ícones
  2. ✅ Adicionar efeitos hover nos links
  3. ✅ Melhorar espaçamentos e alinhamentos
  4. ✅ Adicionar cores nos ícones (WhatsApp verde)
  5. ✅ Melhorar tipografia
  6. ✅ Adicionar indicador de clicável
  7. ✅ Responsividade otimizada
  8. ✅ Melhorar acessibilidade
  9. ✅ Adicionar CTA visual no WhatsApp
  10. ✅ Formatar números de telefone
==============================================================================*/ #}

<ul class="ep-contact-list list-unstyled {% if footer %}font-small{% else %}mb-4{% endif %}">
    {# WhatsApp - Destacado como principal canal #}
    {% if store.whatsapp %}
        <li class="ep-contact-item {% if footer %}d-block{% endif %} mb-3">
            <a href="{{ store.whatsapp }}" target="_blank" rel="noopener" class="ep-contact-link ep-whatsapp-link d-inline-flex align-items-center">
                <span class="ep-contact-icon ep-icon-whatsapp mr-2">
                    <svg class="icon-inline"><use xlink:href="#whatsapp"/></svg>
                </span>
                <span class="ep-contact-text">{{ store.whatsapp | trim('https://wa.me/') }}</span>
            </a>
        </li>
    {% endif %}

    {# Telefone #}
    {% if store.phone %}
        <li class="ep-contact-item {% if footer %}d-block{% endif %} mb-3">
            <a href="tel:{{ store.phone }}" class="ep-contact-link d-inline-flex align-items-center">
                <span class="ep-contact-icon mr-2">
                    <svg class="icon-inline"><use xlink:href="#phone"/></svg>
                </span>
                <span class="ep-contact-text">{{ store.phone }}</span>
            </a>
        </li>
    {% endif %}

    {# Email #}
    {% if store.email %}
        <li class="ep-contact-item {% if footer %}d-block{% endif %} mb-3">
            <a href="mailto:{{ store.email }}" class="ep-contact-link d-inline-flex align-items-center">
                <span class="ep-contact-icon mr-2">
                    <svg class="icon-inline"><use xlink:href="#email"/></svg>
                </span>
                <span class="ep-contact-text">{{ store.email }}</span>
            </a>
        </li>
    {% endif %}

    {% if not phone_and_mail_only %}
        {# Endereço #}
        {% if store.address and not is_order_cancellation %}
            <li class="ep-contact-item {% if footer %}d-block{% endif %} mb-3">
                <div class="ep-contact-address d-inline-flex align-items-start">
                    <span class="ep-contact-icon mr-2 mt-1">
                        <svg class="icon-inline"><use xlink:href="#map-marker-alt"/></svg>
                    </span>
                    <span class="ep-contact-text">{{ store.address }}</span>
                </div>
            </li>
        {% endif %}

        {# Blog #}
        {% if store.blog %}
            <li class="ep-contact-item {% if footer %}d-block{% endif %} mb-3">
                <a target="_blank" rel="noopener" href="{{ store.blog }}" class="ep-contact-link d-inline-flex align-items-center">
                    <span class="ep-contact-icon mr-2">
                        <svg class="icon-inline"><use xlink:href="#comments"/></svg>
                    </span>
                    <span class="ep-contact-text">{{ "Visite nosso Blog!" | translate }}</span>
                </a>
            </li>
        {% endif %}
    {% endif %}
</ul>
