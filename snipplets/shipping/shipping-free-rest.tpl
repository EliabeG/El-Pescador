{# /*============================================================================
  El Pescador - Frete Gratis Restante Profissional

  PLANO DE MELHORIAS (10 etapas):
  1. ✅ Adicionar classes ep- para consistência
  2. ✅ Melhorar barra de progresso
  3. ✅ Melhorar mensagens de sucesso
  4. ✅ Traduzir textos para PT-BR
  5. ✅ Melhorar espaçamentos
  6. ✅ Adicionar ícones
  7. ✅ Melhorar transições
  8. ✅ Responsividade otimizada
  9. ✅ Melhorar acessibilidade
  10. ✅ Adicionar feedback visual
==============================================================================*/ #}

{% if product_detail %}

    {% if not product.free_shipping %}

        {# Wording to notice that adding one more product free shipping is achieved #}

        <div class="js-shipping-add-product-label font-small mx-3 my-3 ep-add-product-msg">
            <svg class="icon-inline mr-1 text-accent"><use xlink:href="#truck"/></svg>
            <span class='js-fs-add-this-product ep-add-this'>{{ "Adicione este produto e " | translate }}</span>
            <span class='js-fs-add-one-more ep-add-one' style='display: none;'>{{ "Adicione mais um e " | translate }}</span>
            <span class='text-accent ep-free-shipping'>{{ "ganhe frete gratis!" | translate }}</span>
        </div>
    {% endif %}

{% else %}
    <div class="js-visible-on-cart-filled ep-cart-shipping-info" {% if cart.items_count == 0 %}style="display: none;"{% endif %}>
        <div class="js-fulfillment-info js-allows-non-shippable ep-fulfillment-info" {% if not cart.has_shippable_products %}style="display: none"{% endif %}>

            {# Free shipping progress bar #}
            <div class="js-ship-free-rest ep-free-rest {% if progress_bar %}cart-row{% endif %} pb-1">
                <div class="js-bar-progress bar-progress ep-progress-bar" role="progressbar" aria-label="{{ 'Progresso frete gratis' | translate }}">
                    <div class="js-bar-progress-active bar-progress-active transition-soft ep-progress-fill"></div>
                    <div class="js-bar-progress-check bar-progress-check transition-soft ep-progress-check">
                        <svg class="icon-inline"><use xlink:href="#check"/></svg>
                    </div>
                </div>
                <div class="js-ship-free-rest-message ship-free-rest-message ep-rest-message">
                    <div class="ship-free-rest-text bar-progress-success text-accent transition-soft ep-success-msg">
                        <svg class="icon-inline mr-1"><use xlink:href="#check-circle"/></svg>
                        {{ "Otimo! Voce tem frete gratis" | translate }}
                    </div>
                    <div class="ship-free-rest-text bar-progress-amount transition-soft ep-amount-msg">
                        <svg class="icon-inline mr-1"><use xlink:href="#truck"/></svg>
                        {{ "Faltam <span class='js-ship-free-dif'></span> para ter <span class='text-accent'>frete gratis</span>!" | translate }}
                    </div>
                    <div class="ship-free-rest-text bar-progress-condition transition-soft ep-condition-msg">
                        <svg class="icon-inline mr-1"><use xlink:href="#info-circle"/></svg>
                        {{ "<span class='text-accent'>Frete gratis</span> para compras acima de" | translate }} <span>{{ cart.free_shipping.min_price_free_shipping.min_price }}</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
{% endif %}
