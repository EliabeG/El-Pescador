{# /*============================================================================
  El Pescador - Notificações Profissionais

  PLANO DE MELHORIAS (10 etapas):
  1. ✅ Adicionar classes ep- para consistência
  2. ✅ Melhorar banner de cookies
  3. ✅ Adicionar ícone de cookie
  4. ✅ Melhorar notificação de pedido
  5. ✅ Melhorar botões de ação
  6. ✅ Adicionar animações de entrada
  7. ✅ Melhorar cores e contraste
  8. ✅ Responsividade otimizada
  9. ✅ Melhorar acessibilidade
  10. ✅ Melhorar espaçamentos
==============================================================================*/ #}

{# Cookie validation #}
{% if show_cookie_banner and not params.preview %}
    <div class="js-notification js-notification-cookie-banner notification notification-fixed-bottom notification-primary ep-notification ep-cookie-banner text-left" style="display: none;" role="alert">
        <div class="container-fluid">
            <div class="row justify-content-center align-items-center">
                <div class="col-12 col-md-auto mb-2 mb-md-0 pr-md-0 text-center">
                    <svg class="icon-inline mr-2 d-none d-md-inline"><use xlink:href="#security"/></svg>
                    {{ 'Ao navegar neste site <strong>voce aceita o uso de cookies</strong> para melhorar sua experiencia de compra.' | translate }}
                </div>
                <div class="col-12 col-md-auto text-center">
                    <a href="#" class="js-notification-close js-acknowledge-cookies btn btn-sm btn-primary ep-cookie-accept" data-amplitude-event-name="cookie_banner_acknowledge_click">
                        {{ "Entendi" | translate }}
                    </a>
                </div>
            </div>
        </div>
    </div>
{% endif %}

{# Order status notification #}
{% if order_notification and status_page_url_notification %}
    <div class="js-notification js-notification-status-page notification notification-primary notification-order ep-notification ep-order-notification w-100" style="display:none;" data-url="{{ status_page_url_notification }}" role="alert">
        <div class="container">
            <div class="row align-items-center">
                <div class="col">
                    <svg class="icon-inline mr-2"><use xlink:href="#box-alt"/></svg>
                    <a class="d-inline mr-2" href="{{ status_page_url_notification }}">
                        <span class="btn-link font-small">{{ "Acompanhe aqui" | translate }}</span>
                        {{ "sua ultima compra" | translate }}
                    </a>
                    <a class="js-notification-close js-notification-status-page-close notification-close ep-notification-close" href="#" aria-label="{{ 'Fechar' | translate }}">
                        <svg class="icon-inline icon-lg"><use xlink:href="#times"/></svg>
                    </a>
                </div>
            </div>
        </div>
    </div>
{% endif %}

{# Add to cart notification #}
{% if add_to_cart %}
    {% include "snipplets/notification-cart.tpl" %}
{% endif %}
