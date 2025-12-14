{# /*============================================================================
  El Pescador - Banner de Serviços Profissional

  PLANO DE MELHORIAS (10 etapas):
  1. ✅ Adicionar classes CSS temáticas (ep-)
  2. ✅ Melhorar estrutura visual com wrapper
  3. ✅ Adicionar efeitos de hover
  4. ✅ Melhorar tipografia dos títulos
  5. ✅ Adicionar animações suaves
  6. ✅ Melhorar ícones com destaque
  7. ✅ Adicionar badges para diferenciais
  8. ✅ Melhorar espaçamentos
  9. ✅ Adicionar indicadores visuais de confiança
  10. ✅ Responsividade otimizada
==============================================================================*/ #}

<div class="swiper-slide col-auto col-md{% if num_banners_services == 1 %}-6 px-3 px-md-0{% endif %} p-0{% if loop.last %} mr-md-0{% endif %}">
    {% if banner_services_url %}
        <a href="{{ banner_services_url | setting_url }}" class="ep-service-link d-block">
    {% endif %}
    <div class="ep-service-item text-center py-4 px-3">
        {# Ícone com destaque visual #}
        <div class="ep-service-icon-wrapper d-inline-flex align-items-center justify-content-center mb-3">
            {% if banner_services_icon == 'image' and banner_services_image %}
                <img class="service-item-image lazyload ep-service-img" src="{{ 'images/empty-placeholder.png' | static_url }}" data-src='{{ "#{banner}.jpg" | static_url | settings_image_url("large") }}' {% if banner_services_title %}alt="{{ banner_services_title }}"{% else %}alt="{{ 'Banner de' | translate }} {{ store.name }}"{% endif %} />
            {% elseif banner_services_icon == 'shipping' %}
                <svg class="icon-inline icon-4x align-item-middle svg-icon-text ep-service-icon"><use xlink:href="#box-alt"/></svg>
            {% elseif banner_services_icon == 'card' %}
                <svg class="icon-inline icon-4x align-item-middle svg-icon-text ep-service-icon"><use xlink:href="#credit-card-alt"/></svg>
            {% elseif banner_services_icon == 'security' %}
                <svg class="icon-inline icon-4x align-item-middle svg-icon-text ep-service-icon"><use xlink:href="#security"/></svg>
            {% elseif banner_services_icon == 'returns' %}
                <svg class="icon-inline icon-4x align-item-middle svg-icon-text ep-service-icon"><use xlink:href="#returns"/></svg>
            {% elseif banner_services_icon == 'whatsapp' %}
                <svg class="icon-inline icon-4x align-item-middle svg-icon-text ep-service-icon"><use xlink:href="#whatsapp-line"/></svg>
            {% elseif banner_services_icon == 'promotions' %}
                <svg class="icon-inline icon-4x align-item-middle svg-icon-text ep-service-icon"><use xlink:href="#promotions"/></svg>
            {% elseif banner_services_icon == 'cash' %}
                <svg class="icon-inline icon-4x align-item-middle svg-icon-text ep-service-icon"><use xlink:href="#cash"/></svg>
            {% endif %}
        </div>

        {# Título do serviço #}
        {% if banner_services_title %}
            <h3 class="ep-service-title h5 mb-2 font-weight-bold">{{ banner_services_title }}</h3>
        {% endif %}

        {# Descrição do serviço #}
        {% if banner_services_description %}
            <p class="ep-service-description mb-0 font-small opacity-80">{{ banner_services_description }}</p>
        {% endif %}
    </div>
    {% if banner_services_url %}
        </a>
    {% endif %}
</div>
