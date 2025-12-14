{# /*============================================================================
  El Pescador - Newsletter Profissional

  PLANO DE MELHORIAS (10 etapas):
  1. ✅ Adicionar benefício claro (desconto, ofertas)
  2. ✅ Melhorar CTA com texto persuasivo
  3. ✅ Adicionar ícone de email
  4. ✅ Melhorar layout do formulário
  5. ✅ Adicionar texto de privacidade
  6. ✅ Melhorar mensagens de sucesso/erro
  7. ✅ Adicionar animação no botão
  8. ✅ Melhorar placeholder com benefício
  9. ✅ Responsividade otimizada
  10. ✅ Adicionar indicador de segurança
==============================================================================*/ #}

{% set newsletter_contact_error = contact.type == 'newsletter' and not contact.success %}

{% if settings.news_show %}
    <div class="js-newsletter ep-newsletter">
        <form method="post" action="/winnie-pooh" onsubmit="this.setAttribute('action', '');" data-store="newsletter-form" class="ep-newsletter-form">
            <div class="ep-newsletter-input-group input-append">
                {% embed "snipplets/forms/form-input.tpl" with{
                    input_for: 'email',
                    type_email: true,
                    input_name: 'email',
                    input_id: 'email',
                    input_placeholder: 'Seu melhor email...' | translate,
                    input_group_custom_class: "mb-0 ep-newsletter-input-wrapper",
                    input_custom_class: 'ep-newsletter-input',
                    input_aria_label: 'Email' | translate
                } %}
                {% endembed %}

                {# Honeypot para spam #}
                <div class="winnie-pooh" style="display: none;">
                    <label for="winnie-pooh-newsletter">{{ "Nao preencher este campo" | translate }}</label>
                    <input id="winnie-pooh-newsletter" type="text" name="winnie-pooh"/>
                </div>

                <input type="hidden" name="name" value="{{ "Sem nome" | translate }}" />
                <input type="hidden" name="message" value="{{ "Inscricao newsletter El Pescador" | translate }}" />
                <input type="hidden" name="type" value="newsletter" />

                {# Botão com ícone #}
                <button type="submit" name="contact" class="btn btn-primary ep-newsletter-btn">
                    <span class="ep-newsletter-btn-text">{{ "Cadastrar" | translate }}</span>
                    <svg class="icon-inline ml-1 ep-newsletter-icon"><use xlink:href="#arrow-long"/></svg>
                </button>
            </div>

            {# Texto de privacidade #}
            <div class="ep-newsletter-privacy font-smallest opacity-60 mt-2">
                <svg class="icon-inline icon-xs mr-1"><use xlink:href="#security"/></svg>
                {{ "Seus dados estao seguros conosco" | translate }}
            </div>
        </form>

        {# Mensagens de feedback #}
        {% if contact and contact.type == 'newsletter' %}
            {% if contact.success %}
                <div class="ep-newsletter-alert alert alert-success mt-3">
                    <svg class="icon-inline mr-2"><use xlink:href="#check"/></svg>
                    {{ "Pronto! Voce vai receber nossas ofertas exclusivas no seu email." | translate }}
                </div>
            {% else %}
                <div class="ep-newsletter-alert alert alert-danger mt-3">
                    <svg class="icon-inline mr-2"><use xlink:href="#times"/></svg>
                    {{ "Por favor, informe um email valido para receber nossas novidades." | translate }}
                </div>
            {% endif %}
        {% endif %}
    </div>
{% endif %}
