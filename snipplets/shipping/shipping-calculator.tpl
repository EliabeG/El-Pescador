{# /*============================================================================
  El Pescador - Calculadora de Frete Profissional

  PLANO DE MELHORIAS (10 etapas):
  1. ✅ Adicionar classes ep- para consistência
  2. ✅ Melhorar campo de CEP
  3. ✅ Melhorar botão calcular
  4. ✅ Traduzir textos para PT-BR
  5. ✅ Melhorar mensagens de erro
  6. ✅ Adicionar ícones
  7. ✅ Melhorar modal de país
  8. ✅ Responsividade otimizada
  9. ✅ Melhorar acessibilidade
  10. ✅ Melhorar loading
==============================================================================*/ #}

{% if product_detail %}
    {% set cart_zipcode = false %}
{% else %}
    {% set cart_zipcode = cart.shipping_zipcode %}
{% endif %}

<div data-store="shipping-calculator" class="ep-shipping-calc">
    <div class="js-shipping-calculator-head shipping-calculator-head position-relative transition-soft ep-calc-head {% if cart_zipcode %}with-zip{% else %}with-form{% endif %}">
        <div class="js-shipping-calculator-with-zipcode ep-saved-zip {% if cart_zipcode %}js-cart-saved-zipcode transition-up-active{% endif %} w-100 transition-up position-absolute">
            <div class="row">
                <span class="col ep-zip-info">
                    <span class="font-small align-bottom">
                        <svg class="icon-inline mr-1"><use xlink:href="#map-marker"/></svg>
                        <span>{{ "Entregas para o CEP:" | translate }}</span>
                        <strong class="js-shipping-calculator-current-zip ep-current-zip">{{ cart_zipcode }}</strong>
                    </span>
                </span>
                <div class="col-auto col-btn ep-change-zip">
                    <a class="js-shipping-calculator-change-zipcode btn btn-link font-small float-right ep-change-btn" href="#">{{ "Alterar CEP" | translate }}</a>
                </div>
            </div>
        </div>

        <div class="js-shipping-calculator-form shipping-calculator-form transition-up position-absolute w-100 ep-calc-form">

            {# Shipping calculator input #}

            {% embed "snipplets/forms/form-input.tpl" with{type_tel: true, input_value: cart_zipcode, input_name: 'zipcode', input_custom_class: 'js-shipping-input form-control-big d-block ep-zip-input', input_placeholder: "Seu CEP" | translate, input_aria_label: 'Seu CEP' | translate, input_label: false, input_append_content: true, input_group_custom_class: 'mb-0 ep-zip-group'} %}
                {% block input_prepend_content %}
                    <div class="form-label ep-calc-label">
                        <svg class="icon-inline mr-1"><use xlink:href="#truck"/></svg>
                        {{ "Opcoes de envio" | translate }}
                    </div>
                    <div class="position-relative ep-input-wrapper">
                {% endblock input_prepend_content %}
                {% block input_append_content %}
                        <div class="js-calculate-shipping form-control-submit ep-calc-submit" aria-label="{{ 'Calcular frete' | translate }}">
                            <span class="js-calculate-shipping-wording btn-link font-small ep-calc-btn">
                                {{ 'Calcular' | translate }}
                            </span>
                            <span class="loading mr-1 ep-calc-loading" style="display: none;">
                                <svg class="icon-inline icon-spin icon-w-2em icon-md ml-2"><use xlink:href="#spinner-third"/></svg>
                            </span>
                        </div>
                    </div>
                {% endblock input_append_content %}
                {% block input_form_alert %}
                {% set zipcode_help_countries = ['BR', 'AR', 'MX'] %}
                {% if store.country in zipcode_help_countries %}
                    {% set zipcode_help_ar = 'https://www.correoargentino.com.ar/formularios/cpa' %}
                    {% set zipcode_help_br = 'http://www.buscacep.correios.com.br/sistemas/buscacep/' %}
                    {% set zipcode_help_mx = 'https://www.correosdemexico.gob.mx/SSLServicios/ConsultaCP/Descarga.aspx' %}
                    <a class="btn-link font-small mt-2 mb-2 d-inline-block ep-zip-help {% if product_detail %} js-shipping-zipcode-help {% endif %}" href="{% if store.country == 'AR' %}{{ zipcode_help_ar }}{% elseif store.country == 'BR' %}{{ zipcode_help_br }}{% elseif store.country == 'MX' %}{{ zipcode_help_mx }}{% endif %}" target="_blank" rel="noopener noreferrer">
                        <svg class="icon-inline icon-xs mr-1"><use xlink:href="#question-circle"/></svg>
                        {{ "Nao sei meu CEP" | translate }}
                    </a>
                {% endif %}
                <div class="js-ship-calculator-error invalid-zipcode alert alert-danger mt-2 ep-zip-error" style="display: none;">

                    {# Specific error message considering if store has multiple languages #}

                    {% for language in languages %}
                        {% if language.active %}
                            {% if languages | length > 1 %}
                                {% set wrong_zipcode_wording = ' para ' | translate ~ language.country_name ~ '. Voce pode tentar outro ou' | translate %}
                            {% else %}
                                {% set wrong_zipcode_wording = '. Esta correto?' | translate %}
                            {% endif %}
                            <svg class="icon-inline mr-1"><use xlink:href="#alert"/></svg>
                            {{ "Nao encontramos este CEP{1}" | translate(wrong_zipcode_wording) }}

                            {% if languages | length > 1 %}
                                <a href="#" data-toggle="#{% if product_detail %}product{% else %}cart{% endif %}-shipping-country" class="js-modal-open js-open-over-modal btn-link text-lowercase font-small ep-change-country">
                                    {{ 'alterar seu pais de entrega' | translate }}
                                </a>
                            {% endif %}
                        {% endif %}
                    {% endfor %}
                </div>
                <div class="js-ship-calculator-error js-ship-calculator-common-error alert alert-danger mt-2 ep-common-error" style="display: none;">
                    <svg class="icon-inline mr-1"><use xlink:href="#alert"/></svg>
                    {{ "Ocorreu um erro ao calcular o frete. Por favor tente novamente em alguns segundos." | translate }}
                </div>
                <div class="js-ship-calculator-error js-ship-calculator-external-error alert alert-danger mt-2 ep-external-error" style="display: none;">
                    <svg class="icon-inline mr-1"><use xlink:href="#alert"/></svg>
                    {{ "O calculo falhou por um problema com o meio de envio. Por favor tente novamente em alguns segundos." | translate }}
                </div>
                {% endblock input_form_alert %}
                {% block input_add_on %}
                    {% if shipping_calculator_variant %}
                        <input type="hidden" name="variant_id" id="shipping-variant-id" value="{{ shipping_calculator_variant.id }}">
                    {% endif %}
                {% endblock input_add_on %}
            {% endembed %}
        </div>
    </div>
    <div class="js-shipping-calculator-spinner pt-3 pb-4 ep-calc-spinner" style="display: none;">
        {% include "snipplets/placeholders/shipping-placeholder.tpl"%}
    </div>
    <div class="js-shipping-calculator-response transition-soft ep-calc-response {% if product_detail %}list {% else %} radio-buttons-group{% endif %}" style="display: none;"></div>
</div>


{# Shipping country modal #}

{% if languages | length > 1 %}

    {% if product_detail %}
        {% set country_modal_id = 'product-shipping-country' %}
    {% else %}
        {% set country_modal_id = 'cart-shipping-country' %}
    {% endif %}

    {% embed "snipplets/modal.tpl" with{modal_id: country_modal_id, modal_class: 'bottom modal-centered-small js-modal-shipping-country ep-country-modal', modal_position: 'center', modal_position_desktop: 'bottom', modal_transition: 'slide', modal_header_title: true, modal_footer: true, modal_width: 'centered', modal_zindex_top: true, modal_mobile_full_screen: false} %}
        {% block modal_head %}
            <svg class="icon-inline mr-2"><use xlink:href="#globe"/></svg>
            {{ 'Pais de entrega' | translate }}
        {% endblock %}
        {% block modal_body %}
            {% embed "snipplets/forms/form-select.tpl" with{select_label: true, select_label_name: 'Pais onde entregaremos sua compra' | translate, select_aria_label: 'Pais onde entregaremos sua compra' | translate, select_custom_class: 'js-country-select ep-country-select' } %}
                {% block select_options %}
                    {% for language in languages %}
                        <option value="{{ language.country }}" data-country-url="{{ language.url }}" {% if language.active %}selected{% endif %}>{{ language.country_name }}</option>
                    {% endfor %}
                {% endblock select_options%}
            {% endembed %}
        {% endblock %}
        {% block modal_foot %}
            <a href="#" class="js-save-shipping-country btn btn-primary d-inline-block ep-save-country">
                <svg class="icon-inline mr-1"><use xlink:href="#check"/></svg>
                {{ 'Aplicar' | translate }}
            </a>
        {% endblock %}
    {% endembed %}
{% endif %}
