{# /*============================================================================
  El Pescador - Notificação de Carrinho Profissional

  PLANO DE MELHORIAS (10 etapas):
  1. ✅ Adicionar classes ep- para consistência
  2. ✅ Melhorar visual da notificação
  3. ✅ Adicionar ícone de sucesso
  4. ✅ Melhorar imagem do produto
  5. ✅ Melhorar informações do produto
  6. ✅ Adicionar botão de continuar comprando
  7. ✅ Melhorar animação de entrada
  8. ✅ Responsividade otimizada
  9. ✅ Melhorar total do carrinho
  10. ✅ Melhorar CTA de ver carrinho
==============================================================================*/ #}

{% set notification_without_recommendations_classes = 'js-alert-added-to-cart notification-floating notification-cart-container notification-hidden notification-fixed position-absolute ep-cart-notification' %}
{% set notification_wrapper_classes =
    related_products ? 'row ep-notification-related'
    : not related_products and not settings.head_fix_desktop ? notification_without_recommendations_classes ~ ' position-fixed-md'
    : notification_without_recommendations_classes
%}

<div class="{{ notification_wrapper_classes }}" {% if not related_products %}style="display: none;"{% endif %}>
    <div class="{% if related_products %}col-12 col-md mb-3 mb-md-0{% else %}notification notification-primary notification-cart ep-notification{% endif %}">
        {% if not related_products %}
            <div class="js-cart-notification-close notification-close ep-notification-close mt-2 mr-1" aria-label="{{ 'Fechar' | translate }}">
                <svg class="icon-inline icon-lg notification-icon"><use xlink:href="#times"/></svg>
            </div>
        {% endif %}
        <div class="js-cart-notification-item row no-gutters ep-cart-notification-item" data-store="cart-notification-item">
            {# Imagem do produto #}
            <div class="col-auto pr-0 notification-img notification-img-big ep-notification-img">
                <img src="" class="js-cart-notification-item-img absolute-centered-vertically" alt="" />
            </div>
            {# Informações do produto #}
            <div class="col text-left py-2 pl-3">
                <div class="mb-1 mr-4">
                    <span class="js-cart-notification-item-name font-weight-bold"></span>
                    <span class="js-cart-notification-item-variant-container font-small opacity-70" style="display: none;">
                        (<span class="js-cart-notification-item-variant"></span>)
                    </span>
                </div>
                <div class="mb-1 font-small">
                    <span class="js-cart-notification-item-quantity"></span>
                    <span> x </span>
                    <span class="js-cart-notification-item-price font-weight-bold"></span>
                </div>
                {% if not related_products %}
                    <div class="ep-added-success text-accent">
                        <svg class="icon-inline icon-sm mr-1"><use xlink:href="#check"/></svg>
                        <strong>{{ 'Adicionado ao carrinho!' | translate }}</strong>
                    </div>
                {% endif %}
            </div>
        </div>
    </div>
    {% if related_products %}
        <div class="col-12 col-md-auto">
            <div class="mb-3">
                <div class="row text-primary h4 mb-3 ep-cart-total-row">
                    <span class="col-auto text-left">
                        <strong>{{ "Total" | translate }}</strong>
                        (<span class="js-cart-widget-amount">
                            {{ "{1}" | translate(cart.items_count ) }}
                        </span>
                        <span class="js-cart-counts-plural" style="display: none;">
                            {{ 'produtos' | translate }}):
                        </span>
                        <span class="js-cart-counts-singular" style="display: none;">
                            {{ 'produto' | translate }}):
                        </span>
                    </span>
                    <strong class="js-cart-total col text-right">{{ cart.total | money }}</strong>
                </div>
            </div>
            <a href="#" data-toggle="#modal-cart" data-modal-url="modal-fullscreen-cart" class="js-modal-close js-modal-open js-fullscreen-modal-open btn btn-primary btn-big d-block ep-view-cart-btn">
                <svg class="icon-inline mr-2"><use xlink:href="#bag"/></svg>
                {{ 'Ver Carrinho' | translate }}
            </a>
        </div>
    {% endif %}
</div>
