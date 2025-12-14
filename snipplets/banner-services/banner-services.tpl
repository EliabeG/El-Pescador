{# /*============================================================================
  El Pescador - Seção de Banners de Serviços Profissional

  PLANO DE MELHORIAS (10 etapas):
  1. ✅ Adicionar classes ep- para consistência
  2. ✅ Traduzir textos para PT-BR
  3. ✅ Melhorar acessibilidade ARIA
  4. ✅ Adicionar container semântico
  5. ✅ Melhorar navegação do slider
  6. ✅ Adicionar ícones nos botões
  7. ✅ Melhorar espaçamentos
  8. ✅ Responsividade otimizada
  9. ✅ Adicionar label de seção
  10. ✅ Melhorar estrutura do macro
==============================================================================*/ #}

{% macro for_each_banner_include(template) %}
    {% set num_banners_services = 0 %}
    {% set available_banners = []%}
    {% for banner in ['banner_services_01', 'banner_services_02', 'banner_services_03', 'banner_services_04'] %}
        {% set banner_services_icon = attribute(settings,"#{banner}_icon") %}
        {% set banner_services_title = attribute(settings,"#{banner}_title") %}
        {% set banner_services_description = attribute(settings,"#{banner}_description") %}
        {% set banner_services_url = attribute(settings,"#{banner}_url") %}
        {% set has_banner_services =  banner_services_title or banner_services_description %}
        {% if has_banner_services %}
            {% set num_banners_services = num_banners_services + 1 %}
            {% set available_banners = available_banners | merge([banner]) %}
        {% endif %}
    {% endfor %}
    {% for banner in available_banners %}
        {% set banner_services_title = attribute(settings,"#{banner}_title") %}
        {% set banner_services_image = "#{banner}.jpg" | has_custom_image %}
        {% set banner_services_icon = attribute(settings,"#{banner}_icon") %}
        {% set banner_services_description = attribute(settings,"#{banner}_description") %}
        {% set banner_services_url = attribute(settings,"#{banner}_url") %}
        {% include template %}
    {% endfor %}
{% endmacro %}

{% import _self as banner_services %}

{% if settings.banner_services and (settings.banner_services_01_title or settings.banner_services_02_title or settings.banner_services_03_title or settings.banner_services_01_description or settings.banner_services_02_description or settings.banner_services_03_description) %}
    <section class="section-informative-banners ep-services-section {% if settings.banner_services_colors %}section-informative-banners-colors ep-services-colored{% endif %}" data-store="banner-services" aria-label="{{ 'Nossos diferenciais' | translate }}">
        <div class="container ep-services-container">
            {# Título da seção (opcional) #}
            <div class="ep-services-header text-center mb-4 d-none">
                <h2 class="ep-services-title h4">
                    <svg class="icon-inline mr-2"><use xlink:href="#star"/></svg>
                    {{ 'Por que comprar conosco?' | translate }}
                </h2>
            </div>

            {# Slider de serviços #}
            <div class="js-informative-banners swiper-container ep-services-slider mb-3" role="region" aria-label="{{ 'Diferenciais da loja' | translate }}">
                <div class="swiper-wrapper ep-services-wrapper">
                    {{ banner_services.for_each_banner_include('snipplets/banner-services/banner-services-item.tpl') }}
                </div>
            </div>

            {# Navegação do slider - apenas mobile #}
            <div class="text-center mt-4 d-block d-md-none ep-services-nav">
                <button type="button" class="js-informative-banners-prev swiper-button-prev ep-services-prev" aria-label="{{ 'Servico anterior' | translate }}">
                    <svg class="icon-inline icon-lg icon-flip-horizontal"><use xlink:href="#arrow-long"/></svg>
                </button>
                <button type="button" class="js-informative-banners-next swiper-button-next ep-services-next" aria-label="{{ 'Proximo servico' | translate }}">
                    <svg class="icon-inline icon-lg"><use xlink:href="#arrow-long"/></svg>
                </button>
            </div>
        </div>
    </section>
{% endif %}
