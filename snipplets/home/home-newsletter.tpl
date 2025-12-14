{# /*============================================================================
  El Pescador - Newsletter Home Profissional

  PLANO DE MELHORIAS (10 etapas):
  1. ✅ Adicionar classes ep- para consistência
  2. ✅ Melhorar formulário de newsletter
  3. ✅ Melhorar mensagens de sucesso/erro
  4. ✅ Traduzir textos para PT-BR
  5. ✅ Melhorar espaçamentos
  6. ✅ Adicionar ícone de email
  7. ✅ Melhorar imagem lateral
  8. ✅ Responsividade otimizada
  9. ✅ Melhorar acessibilidade
  10. ✅ Adicionar indicador de privacidade
==============================================================================*/ #}

{% set newsletter_contact_error = contact.type == 'newsletter' and not contact.success %}
{% set has_newsletter_full = settings.home_news_full %}
{% set newsletter_image = "home_news_image.jpg" | has_custom_image %}
{% set theme_editor = params.preview %}
<section class="position-relative overflow-none ep-newsletter-section" data-store="home-newsletter" aria-label="{{ 'Cadastre-se na newsletter' | translate }}">
    <div class="js-newsletter-home-container container{% if has_newsletter_full %}-fluid p-0{% else %} my-3{% endif %} ep-newsletter-container">
        <div class="js-newsletter-home row no-gutters section-newsletter-home ep-newsletter-row {% if settings.home_news_colors %}section-newsletter-home-colors{% endif %} align-items-center justify-content-center text-center">
            <div class="col-md-6 ep-newsletter-form-col">
                <div class="js-newsletter newsletter px-4 py-5 ep-newsletter-content">

                    <svg class="icon-inline icon-lg mb-3 text-accent ep-newsletter-icon"><use xlink:href="#envelope"/></svg>

                    <h2 class="js-home-newsletter-title h4 mb-2 ep-newsletter-title" {% if not settings.home_news_title %}style="display: none;"{% endif %}>{{ settings.home_news_title }}</h2>
                    <p class="js-home-newsletter-text font-small mb-2 ep-newsletter-text" {% if not settings.home_news_text %}style="display: none;"{% endif %}>{{ settings.home_news_text }}</p>

                    <form class="mt-3 mb-2 ep-newsletter-form" method="post" action="/winnie-pooh" onsubmit="this.setAttribute('action', '');" data-store="home-newsletter-form">
                        <div class="input-append ep-input-group">
                            {% embed "snipplets/forms/form-input.tpl" with{input_for: 'email', type_email: true, input_name: 'email', input_id: 'email', input_placeholder: 'Seu melhor email' | translate, input_group_custom_class: "mb-0 ep-newsletter-input",  input_aria_label: 'Email' | translate } %}
                            {% endembed %}
                            <div class="winnie-pooh" style="display: none;">
                                <label for="winnie-pooh-newsletter">{{ "Nao preencha este campo" | translate }}</label>
                                <input id="winnie-pooh-newsletter" type="text" name="winnie-pooh"/>
                            </div>
                            <input type="hidden" name="name" value="{{ 'Sem nome' | translate }}" />
                            <input type="hidden" name="message" value="{{ 'Inscricao na newsletter' | translate }}" />
                            <input type="hidden" name="type" value="newsletter" />
                            <input type="submit" name="contact" class="btn btn-link font-small newsletter-btn ep-newsletter-btn" value="{{ 'Inscrever' | translate }}" />
                        </div>
                    </form>

                    <p class="font-smallest opacity-60 mt-2 ep-privacy-note">
                        <svg class="icon-inline icon-xs mr-1"><use xlink:href="#lock"/></svg>
                        {{ 'Seus dados estao seguros conosco' | translate }}
                    </p>

                    {% if contact and contact.type == 'newsletter' %}
                        {% if contact.success %}
                            <div class="alert alert-success ep-alert-success">
                                <svg class="icon-inline mr-2"><use xlink:href="#check"/></svg>
                                {{ "Obrigado por se inscrever! A partir de agora voce recebera nossas novidades no seu email" | translate }}
                            </div>
                        {% else %}
                            <div class="alert alert-danger ep-alert-error">
                                <svg class="icon-inline mr-2"><use xlink:href="#alert"/></svg>
                                {{ "Precisamos do seu email para enviar nossas novidades." | translate }}
                            </div>
                        {% endif %}
                    {% endif %}

                </div>
            </div>
            {% if newsletter_image or theme_editor %}
                <div class="js-home-newsletter-image-container col-md-6 order-first order-md-last ep-newsletter-image-col" {% if not newsletter_image %}style="display: none;"{% endif %}>
                    <img {% if newsletter_image %}src="{{ 'images/empty-placeholder.png' | static_url }}" data-srcset='{{ "home_news_image.jpg" | static_url | settings_image_url('large') }} 480w, {{ "home_news_image.jpg" | static_url | settings_image_url('huge') }} 640w, {{ "home_news_image.jpg" | static_url | settings_image_url('original') }} 1024w, {{ "home_news_image.jpg" | static_url | settings_image_url('1080p') }} 1920w'{% endif %} class='js-home-newsletter-image lazyload fade-in d-block w-100 ep-newsletter-img' alt="{{ 'Newsletter El Pescador' | translate }}"/>
                    <div class="placeholder-fade ep-placeholder"></div>
                </div>
            {% endif %}
        </div>
    </div>
</section>
