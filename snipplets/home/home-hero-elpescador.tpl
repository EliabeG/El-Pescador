{# El Pescador - Hero Section - Design Limpo #}

<section class="ep-hero" data-store="home-hero-elpescador">
    <div class="ep-container">
        <div class="ep-hero-content">
            {# Subtitulo pequeno #}
            <span class="ep-hero-subtitle">{{ settings.welcome_message | default('Desde 2010 | Especialistas em Pesca') }}</span>

            {# Titulo principal - Frase impactante #}
            <h1 class="ep-hero-title">Equipamentos de Elite<br>para sua <span>Maior Conquista</span></h1>

            {# Descricao #}
            <p class="ep-hero-text">{{ settings.welcome_text | default('Pesca Sub, Mergulho, Pesca Esportiva e Caca. Equipamentos profissionais para pescadores exigentes.') }}</p>

            {# Botoes #}
            <div class="ep-hero-buttons">
                <a href="{{ store.products_url }}" class="ep-btn ep-btn-primary">Ver Produtos</a>
                <a href="{{ store.categories | first ? (store.categories | first).url : '#' }}" class="ep-btn ep-btn-secondary">Categorias</a>
            </div>
        </div>
    </div>
</section>
