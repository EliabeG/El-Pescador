{# /*============================================================================
  El Pescador - Quick Shop Profissional

  PLANO DE MELHORIAS (10 etapas):
  1. ✅ Adicionar classes ep- para consistência
  2. ✅ Melhorar modal de compra rápida
  3. ✅ Melhorar imagem do produto
  4. ✅ Melhorar nome do produto
  5. ✅ Melhorar preços
  6. ✅ Melhorar botão de fechar
  7. ✅ Traduzir textos para PT-BR
  8. ✅ Responsividade otimizada
  9. ✅ Melhorar acessibilidade
  10. ✅ Adicionar indicadores visuais
==============================================================================*/ #}

{% if settings.quick_shop %}
    {% embed "snipplets/modal.tpl" with{modal_id: 'quickshop-modal', modal_class: 'quickshop bottom modal-overflow-none ep-quickshop-modal', modal_position: 'bottom', modal_transition: 'slide', modal_footer: false, modal_mobile_full_screen: true, modal_width: 'centered-md modal-centered-medium', modal_header_class: 'modal-sticky-close modal-header-no-title d-md-none', modal_title_class: 'd-none d-md-block', modal_body_class: 'modal-scrollable pt-4 px-0 px-md-4'} %}
        {% block modal_body %}
            <div class="js-item-product modal-scrollable modal-scrollable-area ep-quickshop-content" data-product-id="">
                <div class="js-product-container js-quickshop-container js-quickshop-modal js-quickshop-modal-shell ep-quickshop-container" data-variants="" data-quickshop-id="">
                    <div class="row no-gutters">
                        {# Imagem do produto #}
                        <div class="col-md-6 mb-1 px-4 px-md-0 ep-quickshop-image-col">
                            <div class="quickshop-image-container ep-quickshop-image-wrapper">
                                <div class="js-quickshop-image-padding ep-quickshop-image-padding">
                                    <img srcset="" class="js-item-image js-quickshop-img quickshop-image ep-quickshop-image img-absolute-centered" alt=""/>
                                </div>
                            </div>
                        </div>
                        {# Informacoes do produto #}
                        <div class="js-item-variants col-md-6 pt-3 px-4 pb-4 mt-md-1 pt-md-2 pr-md-3 ep-quickshop-info">
                            <div class="row no-gutters align-items-center mt-md-0 mr-md-1 mb-2">
                                <div class="col">
                                    <div class="js-item-name h4 h2-md text-center text-md-left ep-quickshop-name" data-store="product-item-name-{{ product.id }}"></div>
                                </div>
                                <div class="col-auto d-none d-md-block">
                                    <a class="js-modal-close modal-close ep-quickshop-close pr-0" aria-label="{{ 'Fechar' | translate }}">
                                        <svg class="icon-inline svg-icon-text"><use xlink:href="#times"/></svg>
                                    </a>
                                </div>
                            </div>
                            <div class="mb-4 mr-md-1 text-center text-md-left ep-quickshop-prices" data-store="product-item-price-{{ product.id }}">
                                <span class="js-price-display ep-quickshop-price"></span>
                                <span class="js-compare-price-display price-compare ep-quickshop-compare-price"></span>
                                {{ component('payment-discount-price', {
                                        visibility_condition: settings.payment_discount_price,
                                        location: 'product',
                                        container_classes: "text-accent font-small mt-2 ep-payment-discount",
                                    })
                                }}
                            </div>
                            {# Formulario de compra #}
                            <div id="quickshop-form" class="mr-md-1 ep-quickshop-form"></div>
                        </div>
                    </div>
                </div>
            </div>
        {% endblock %}
    {% endembed %}
{% endif %}
