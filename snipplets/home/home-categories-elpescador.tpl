{# El Pescador - Seção de Categorias Customizada #}

{% if store.categories %}
<section class="ep-categories" data-store="home-categories-elpescador">
    <div class="ep-container">
        <h2 class="ep-section-title">Nossas <span>Categorias</span></h2>
        <div class="ep-categories-grid">
            {% for category in store.categories | slice(0, 5) %}
                <a href="{{ category.url }}" class="ep-category-card">
                    {% if category.image %}
                        {{ category.image | category_image_url('large') | img_tag(category.name) }}
                    {% endif %}
                    <div class="ep-category-content">
                        {% set category_icons = {
                            'pesca sub': '🤿',
                            'mergulho': '🫧',
                            'pesca esportiva': '🎣',
                            'roupas': '👕',
                            'caça': '🏹',
                            'acessórios': '🎒',
                            'equipamentos': '🔧'
                        } %}
                        {% set icon_found = false %}
                        {% for key, icon in category_icons %}
                            {% if category.name | lower starts with key or category.name | lower == key %}
                                <div class="ep-category-icon">{{ icon }}</div>
                                {% set icon_found = true %}
                            {% endif %}
                        {% endfor %}
                        {% if not icon_found %}
                            <div class="ep-category-icon">🐟</div>
                        {% endif %}
                        <h3>{{ category.name }}</h3>
                    </div>
                </a>
            {% endfor %}
        </div>
    </div>
</section>
{% endif %}
