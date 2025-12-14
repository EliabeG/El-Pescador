{# El Pescador - Hero Section Customizado #}

<section class="ep-hero" data-store="home-hero-elpescador">
    <div class="ep-container">
        <div class="ep-hero-content">
            {# Logo #}
            <div class="ep-hero-logo">
                {% if "logo.png" | has_custom_image %}
                    <img src="{{ "logo.png" | static_url }}" alt="{{ store.name }}" />
                {% elseif store.logo %}
                    {{ store.logo | img_tag(store.name) }}
                {% else %}
                    <div style="width:200px; height:200px; background:#000; border-radius:50%; border:3px solid #00D4FF; display:flex; align-items:center; justify-content:center; flex-direction:column; margin:0 auto;">
                        <span style="color:#fff; font-family:Oswald,sans-serif; font-size:32px;">{{ store.name }}</span>
                    </div>
                {% endif %}
            </div>

            {# Subtítulo #}
            <p class="ep-subtitle">{{ settings.welcome_message | default('Material de Pesca') }}</p>

            {# Descrição #}
            <p>{{ settings.welcome_text | default('Sua loja especializada em pesca sub, mergulho, pesca esportiva e caça. Equipamentos profissionais para todas as modalidades.') }}</p>

            {# Botões #}
            <a href="{{ store.products_url }}" class="ep-btn ep-btn-primary">Ver Produtos</a>
            <a href="{{ store.categories | first ? (store.categories | first).url : '#' }}" class="ep-btn ep-btn-secondary">Categorias</a>
        </div>
    </div>
</section>
