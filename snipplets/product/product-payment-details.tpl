{# /*============================================================================
  El Pescador - Detalhes de Pagamento Profissional

  PLANO DE MELHORIAS (10 etapas):
  1. ✅ Adicionar classes ep- para consistência
  2. ✅ Melhorar modal de pagamentos
  3. ✅ Melhorar lista de parcelas
  4. ✅ Traduzir textos para PT-BR
  5. ✅ Melhorar métodos de pagamento
  6. ✅ Melhorar espaçamentos
  7. ✅ Melhorar botão de fechar
  8. ✅ Responsividade otimizada
  9. ✅ Melhorar acessibilidade
  10. ✅ Melhorar layout do footer
==============================================================================*/ #}

{# Product payments details #}

{% if product.installments_info_from_any_variant %}

    {% embed "snipplets/modal.tpl" with{
        modal_id: 'installments-modal',
        modal_class: 'bottom-md modal-overflow-none modal-flex-column ep-payments-modal',
        modal_position: 'right modal-centered-md',
        modal_transition: 'slide',
        modal_header_title: true,
        modal_footer: true,
        modal_width: 'centered',
        modal_mobile_full_screen: 'true',
        modal_body_class: 'modal-scrollable pt-2 ep-payments-body'} %}
        {% block modal_head %}
            <svg class="icon-inline mr-2"><use xlink:href="#credit-card"/></svg>
            {{ 'Meios de pagamento' | translate }}
        {% endblock %}
        {% block modal_body %}

            <div class="modal-scrollable modal-scrollable-area ep-payments-scroll">

                {# Modal header and gateways tab links #}

                {{ component('payments/payments-details',
                    {
                        text_classes: {
                            text_accent: "text-accent font-small ep-accent",
                            subtitles: "h6 font-small mb-3 ep-subtitle",
                            text_big: "font-big ep-big",
                            text_small: "font-small ep-small",
                            align_right: "text-right ep-right",
                            opacity: "opacity-60 ep-opacity"
                        },
                        spacing_classes: {
                            top_1x: "mt-1",
                            top_2x: "mt-2",
                            top_3x: "mt-3",
                            right_1x: "mr-1",
                            right_2x: "mr-2",
                            right_3x: "mr-3",
                            bottom_1x: "mb-1",
                            bottom_2x: "mb-2",
                            bottom_3x: "mb-3",
                            left_3x: "ml-3",
                        },
                        container_classes : {
                            payment_method: "box ep-payment-box"
                        },
                        discounts_conditional_visibility: true
                    })
                }}
            </div>

        {% endblock %}
        {% block modal_foot %}
            <div class="text-right ep-payments-footer">
                <span class="js-modal-close js-fullscreen-modal-close btn-link pull-right ep-back-btn">
                    <svg class="icon-inline mr-1"><use xlink:href="#arrow-left"/></svg>
                    {{ 'Voltar ao produto' | translate }}
                </span>
            </div>
        {% endblock %}
    {% endembed %}

{% endif %}
