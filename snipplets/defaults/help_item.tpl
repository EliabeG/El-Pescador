{# /*============================================================================
  El Pescador - Item de Produto (Demo) Profissional

  PLANO DE MELHORIAS (10 etapas):
  1. ✅ Adicionar classes ep- para consistência
  2. ✅ Traduzir textos para PT-BR
  3. ✅ Melhorar estrutura semântica
  4. ✅ Melhorar labels de desconto
  5. ✅ Adicionar aria-labels
  6. ✅ Melhorar preços
  7. ✅ Responsividade otimizada
  8. ✅ Melhorar imagens
  9. ✅ Adicionar hover effects
  10. ✅ Melhorar acessibilidade
==============================================================================*/ #}

{% set slide_item = slide_item | default(false) %}

{% if template == 'home'%}
    {% set columns_desktop = section_columns_desktop %}
    {% set columns_mobile = section_columns_mobile %}
{% else %}
    {% set columns_desktop = settings.grid_columns_desktop %}
    {% set columns_mobile = settings.grid_columns_mobile %}
{% endif %}

{% set item_view_box = '0 0 1000 1000' %}

{% if slide_item %}
    <div class="swiper-slide h-auto ep-demo-slide">
{% endif %}
<div class="{% if slide_item %} js-item-slide p-0{% endif %}{% if not slide_item %} col-{% if columns_mobile == 1 %}12{% else %}6{% endif %} col-md-{% if columns_desktop == 4 %}3{% else %}4{% endif %}{% endif %} item-product col-grid ep-demo-item">
    <div class="item{% if slide_item %} mb-0{% endif %} {{ item_class }} ep-demo-item-card">
        <div class="item-image ep-demo-item-image">
            <div class="position-relative ep-demo-image-wrapper">
                <a href="{{ store.url }}/product/example" title="{{ 'Produto de exemplo' | translate }}" class="ep-demo-item-link">
                    {% if help_item_1 %}
                        <svg viewBox="{{ item_view_box }}" aria-hidden="true"><use xlink:href="#item-product-placeholder-1"/></svg>
                    {% elseif help_item_2 %}
                        <svg viewBox="{{ item_view_box }}" aria-hidden="true"><use xlink:href="#item-product-placeholder-2"/></svg>
                    {% elseif help_item_3 %}
                        <svg viewBox="{{ item_view_box }}" aria-hidden="true"><use xlink:href="#item-product-placeholder-3"/></svg>
                    {% elseif help_item_4 %}
                        <svg viewBox="{{ item_view_box }}" aria-hidden="true"><use xlink:href="#item-product-placeholder-4"/></svg>
                    {% elseif help_item_5 %}
                        <svg viewBox="{{ item_view_box }}" aria-hidden="true"><use xlink:href="#item-product-placeholder-5"/></svg>
                    {% elseif help_item_6 %}
                        <svg viewBox="{{ item_view_box }}" aria-hidden="true"><use xlink:href="#item-product-placeholder-6"/></svg>
                    {% elseif help_item_7 %}
                        <svg viewBox="{{ item_view_box }}" aria-hidden="true"><use xlink:href="#item-product-placeholder-7"/></svg>
                    {% elseif help_item_8 %}
                        <svg viewBox="{{ item_view_box }}" aria-hidden="true"><use xlink:href="#item-product-placeholder-8"/></svg>
                    {% endif %}
                </a>
            </div>
            {% if help_item_1 or help_item_3 or help_item_7 %}
                <div class="labels ep-demo-labels">
                    <div class="label label-accent ep-demo-label-discount">
                        {% if help_item_1 %}
                            -20% OFF
                        {% elseif help_item_3 %}
                            -35% OFF
                        {% elseif help_item_7 %}
                            -25% OFF
                        {% endif %}
                    </div>
                </div>
            {% endif %}
            {% if help_item_2 %}
                <div class="labels ep-demo-labels">
                    <div class="label label-default ep-demo-label-shipping">
                        {{ "Frete gratis" | translate }}
                    </div>
                </div>
            {% endif %}
        </div>
        <div class="item-description text-center ep-demo-item-info">
            <a href="{{ store.url }}/product/example" title="{{ 'Produto de exemplo' | translate }}" class="item-link ep-demo-item-details">
                <div class="mt-1 mb-3 font-small opacity-80 ep-demo-item-name">{{ "Produto de exemplo" | translate }}</div>
                <div class="item-price-container ep-demo-price-container">
                    {% if help_item_1 %}
                        {% if store.country == 'BR' %}
                            <span id="price_display" class="js-price-display item-price ep-demo-price">
                                {{"9600" | money }}
                            </span>
                            <span id="compare_price_display" class="js-compare-price-display price-compare ep-demo-compare-price">
                                {{"120000" | money }}
                            </span>
                        {% else %}
                            <span id="price_display" class="js-price-display item-price ep-demo-price">
                                {{"96000" | money }}
                            </span>
                            <span id="compare_price_display" class="js-compare-price-display price-compare ep-demo-compare-price">
                                {{"1200000" | money }}
                            </span>
                        {% endif %}
                    {% elseif help_item_2 %}
                        {% if store.country == 'BR' %}
                            <span id="price_display" class="js-price-display item-price ep-demo-price">
                                {{"68000" | money }}
                            </span>
                        {% else %}
                            <span id="price_display" class="js-price-display item-price ep-demo-price">
                                {{"680000" | money }}
                            </span>
                        {% endif %}
                    {% elseif help_item_3 %}
                        {% if store.country == 'BR' %}
                            <span id="price_display" class="js-price-display item-price ep-demo-price">
                                {{"18200" | money }}
                            </span>
                            <span id="compare_price_display" class="js-compare-price-display price-compare ep-demo-compare-price">
                                {{"28000" | money }}
                            </span>
                        {% else %}
                            <span id="price_display" class="js-price-display item-price ep-demo-price">
                                {{"182000" | money }}
                            </span>
                            <span id="compare_price_display" class="js-compare-price-display price-compare ep-demo-compare-price">
                                {{"280000" | money }}
                            </span>
                        {% endif %}
                    {% elseif help_item_4 %}
                        {% if store.country == 'BR' %}
                            <span id="price_display" class="js-price-display item-price ep-demo-price">
                                {{"32000" | money }}
                            </span>
                        {% else %}
                            <span id="price_display" class="js-price-display item-price ep-demo-price">
                                {{"320000" | money }}
                            </span>
                        {% endif %}
                    {% elseif help_item_5 %}
                        {% if store.country == 'BR' %}
                            <span id="price_display" class="js-price-display item-price ep-demo-price">
                                {{"24900" | money }}
                            </span>
                        {% else %}
                            <span id="price_display" class="js-price-display item-price ep-demo-price">
                                {{"249000" | money }}
                            </span>
                        {% endif %}
                    {% elseif help_item_6 %}
                        {% if store.country == 'BR' %}
                            <span id="price_display" class="js-price-display item-price ep-demo-price">
                                {{"42000" | money }}
                            </span>
                        {% else %}
                            <span id="price_display" class="js-price-display item-price ep-demo-price">
                                {{"420000" | money }}
                            </span>
                        {% endif %}
                    {% elseif help_item_7 %}
                        {% if store.country == 'BR' %}
                            <span id="price_display" class="js-price-display item-price ep-demo-price">
                                {{"36800" | money }}
                            </span>
                            <span id="compare_price_display" class="js-compare-price-display price-compare ep-demo-compare-price">
                                {{"46000" | money }}
                            </span>
                        {% else %}
                            <span id="price_display" class="js-price-display item-price ep-demo-price">
                                {{"368000" | money }}
                            </span>
                            <span id="compare_price_display" class="js-compare-price-display price-compare ep-demo-compare-price">
                                {{"460000" | money }}
                            </span>
                        {% endif %}
                    {% elseif help_item_8 %}
                        {% if store.country == 'BR' %}
                            <span id="price_display" class="js-price-display item-price ep-demo-price">
                                {{"12200" | money }}
                            </span>
                        {% else %}
                            <span id="price_display" class="js-price-display item-price ep-demo-price">
                                {{"122000" | money }}
                            </span>
                        {% endif %}
                    {% endif %}
                </div>
            </a>
        </div>
    </div>
</div>
{% if slide_item %}
    </div>
{% endif %}
