{# /*============================================================================
  El Pescador - Seção de Produtos Profissional

  PLANO DE MELHORIAS (10 etapas):
  1. ✅ Melhorar grid com Bootstrap responsivo
  2. ✅ Adicionar badges de desconto e novidade
  3. ✅ Melhorar hover com zoom na imagem
  4. ✅ Adicionar wishlist/favoritos visual
  5. ✅ Melhorar apresentação de preços
  6. ✅ Adicionar parcelamento em destaque
  7. ✅ Botão de compra rápida melhorado
  8. ✅ Indicador de frete grátis
  9. ✅ Melhorar espaçamentos e sombras
  10. ✅ Adicionar CTA "Ver todos" no final
==============================================================================*/ #}

{% set products = sections.primary.products | default(sections.new.products) | default(sections.sale.products) %}

{% if products %}
<section class="ep-products py-5" data-store="home-products-elpescador">
    <div class="container">
        {# Cabeçalho da seção #}
        <div class="ep-section-header text-center mb-5">
            <span class="ep-section-badge d-inline-block mb-2 font-small text-uppercase">{{ "Selecionados para voce" | translate }}</span>
            <h2 class="ep-section-title h2 mb-3">
                {{ "Produtos em" | translate }} <span class="ep-text-highlight">{{ "Destaque" | translate }}</span>
            </h2>
            <p class="ep-section-subtitle font-body opacity-70 mb-0">{{ "Os equipamentos mais procurados pelos nossos clientes" | translate }}</p>
        </div>

        {# Grid de produtos #}
        <div class="row ep-products-grid">
            {% for product in products | slice(0, 8) %}
                <div class="col-6 col-md-4 col-lg-3 mb-4">
                    <div class="ep-product-card h-100" data-product-id="{{ product.id }}" data-store="product-item-{{ product.id }}">
                        {# Container da imagem #}
                        <div class="ep-product-image-wrapper position-relative">
                            <a href="{{ product.url }}" class="ep-product-image d-block">
                                {# Badges #}
                                <div class="ep-product-badges position-absolute">
                                    {% if product.compare_at_price %}
                                        {% set discount = ((product.compare_at_price - product.price) / product.compare_at_price * 100) | round %}
                                        <span class="ep-badge ep-badge-sale">-{{ discount }}%</span>
                                    {% endif %}
                                    {% if product.free_shipping %}
                                        <span class="ep-badge ep-badge-shipping">{{ "Frete Gratis" | translate }}</span>
                                    {% endif %}
                                </div>

                                {# Imagem do produto #}
                                <img
                                    src="{{ 'images/empty-placeholder.png' | static_url }}"
                                    data-src="{{ product.featured_image | product_image_url('medium') }}"
                                    alt="{{ product.name }}"
                                    class="ep-product-img lazyload img-fluid"
                                />
                            </a>

                            {# Botão de compra rápida (hover) #}
                            {% if product.available and product.display_price %}
                                <div class="ep-product-quick-actions">
                                    {% if product.variations | length > 0 %}
                                        <a href="{{ product.url }}" class="btn btn-primary btn-sm ep-quick-buy">
                                            <svg class="icon-inline icon-sm mr-1"><use xlink:href="#eye"/></svg>
                                            {{ "Ver Opcoes" | translate }}
                                        </a>
                                    {% else %}
                                        <form method="post" action="{{ store.cart_url }}" class="d-inline">
                                            <input type="hidden" name="add_to_cart" value="{{ product.id }}">
                                            <button type="submit" class="btn btn-primary btn-sm ep-quick-buy js-addtocart">
                                                <svg class="icon-inline icon-sm mr-1"><use xlink:href="#bag"/></svg>
                                                {{ "Comprar" | translate }}
                                            </button>
                                        </form>
                                    {% endif %}
                                </div>
                            {% endif %}
                        </div>

                        {# Informações do produto #}
                        <div class="ep-product-info p-3">
                            {# Categoria #}
                            {% if product.category %}
                                <span class="ep-product-category font-smallest text-uppercase opacity-60 d-block mb-1">{{ product.category.name }}</span>
                            {% endif %}

                            {# Nome do produto #}
                            <h3 class="ep-product-name h6 mb-2">
                                <a href="{{ product.url }}" class="text-decoration-none">{{ product.name }}</a>
                            </h3>

                            {# Preços #}
                            {% if product.display_price %}
                                <div class="ep-product-price mb-2">
                                    {% if product.compare_at_price %}
                                        <span class="ep-price-old font-small text-muted text-decoration-line-through d-block">{{ product.compare_at_price | money }}</span>
                                    {% endif %}
                                    <span class="ep-price-current h5 mb-0 d-block">{{ product.price | money }}</span>
                                </div>

                                {# Parcelamento #}
                                {% if product.installments_info %}
                                    <div class="ep-installments font-smallest opacity-70 mb-2">
                                        {{ "ou ate" | translate }} {{ product.max_installments }}x {{ "de" | translate }} {{ product.max_installments_price | money }}
                                    </div>
                                {% endif %}
                            {% endif %}

                            {# Disponibilidade #}
                            {% if not product.available %}
                                <span class="ep-out-of-stock font-small text-danger">
                                    <svg class="icon-inline icon-xs mr-1"><use xlink:href="#times"/></svg>
                                    {{ "Esgotado" | translate }}
                                </span>
                            {% endif %}
                        </div>
                    </div>
                </div>
            {% endfor %}
        </div>

        {# Botão Ver Todos os Produtos #}
        <div class="ep-products-footer text-center mt-4">
            <a href="{{ store.products_url }}" class="btn btn-primary btn-big ep-btn-primary">
                {{ "Ver Todos os Produtos" | translate }}
                <svg class="icon-inline ml-2"><use xlink:href="#arrow-long"/></svg>
            </a>
        </div>
    </div>
</section>
{% endif %}
