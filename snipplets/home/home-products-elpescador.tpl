{# El Pescador - Seção de Produtos em Destaque #}

{% set products = sections.primary.products | default(sections.new.products) | default(sections.sale.products) %}

{% if products %}
<section class="ep-products" data-store="home-products-elpescador">
    <div class="ep-container">
        <h2 class="ep-section-title">Produtos em <span>Destaque</span></h2>
        <div class="ep-products-grid">
            {% for product in products | slice(0, 8) %}
                <div class="ep-product-card" data-product-id="{{ product.id }}">
                    <a href="{{ product.url }}" class="ep-product-image">
                        {% if product.compare_at_price %}
                            {% set discount = ((product.compare_at_price - product.price) / product.compare_at_price * 100) | round %}
                            <span class="ep-product-badge">-{{ discount }}%</span>
                        {% endif %}
                        {{ product.featured_image | product_image_url('medium') | img_tag(product.name) }}
                    </a>
                    <div class="ep-product-info">
                        {% if product.category %}
                            <span class="ep-product-category">{{ product.category.name }}</span>
                        {% endif %}
                        <h3><a href="{{ product.url }}">{{ product.name }}</a></h3>
                        <div class="ep-product-price">
                            {% if product.compare_at_price %}
                                <span class="ep-price-old">{{ product.compare_at_price | money }}</span>
                            {% endif %}
                            <span class="ep-price-current">{{ product.price | money }}</span>
                        </div>
                        {% if product.free_shipping %}
                            <div class="ep-free-shipping">🚚 Frete Grátis</div>
                        {% endif %}
                        {% if product.available %}
                            <form method="post" action="{{ store.cart_url }}">
                                <input type="hidden" name="add_to_cart" value="{{ product.id }}">
                                {% if product.variations | length > 0 %}
                                    <a href="{{ product.url }}" class="ep-product-btn">Ver Opções</a>
                                {% else %}
                                    <button type="submit" class="ep-product-btn js-addtocart">Adicionar ao Carrinho</button>
                                {% endif %}
                            </form>
                        {% else %}
                            <button class="ep-product-btn disabled" disabled>Esgotado</button>
                        {% endif %}
                    </div>
                </div>
            {% endfor %}
        </div>
    </div>
</section>
{% endif %}
