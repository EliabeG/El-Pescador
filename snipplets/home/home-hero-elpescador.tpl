{# /*============================================================================
  El Pescador - Hero Section
  Design: Preto + Ciano + Logo Grande
==============================================================================*/ #}

<section class="ep-hero" data-store="home-hero-elpescador">
    <div class="ep-hero-overlay"></div>
    <div class="container ep-hero-container">
        <div class="row justify-content-center">
            <div class="col-12 text-center">
                <div class="ep-hero-content">
                    {# Logo Grande #}
                    <div class="ep-hero-logo-large mb-4">
                        {% if "logo.png" | has_custom_image %}
                            <img src="{{ 'logo.png' | static_url }}" alt="{{ store.name }}" class="img-fluid" style="max-width: 250px; border-radius: 50%; border: 3px solid #00D4FF;">
                        {% else %}
                            <div style="width: 250px; height: 250px; background: #000; border-radius: 50%; border: 3px solid #00D4FF; display: flex; align-items: center; justify-content: center; flex-direction: column; margin: 0 auto;">
                                <span style="color: #fff; font-family: 'Oswald', sans-serif; font-size: 36px;">{{ store.name }}</span>
                                <span style="color: #00D4FF; font-family: 'Oswald', sans-serif; font-size: 14px; text-transform: uppercase; letter-spacing: 2px;">Material de Pesca</span>
                            </div>
                        {% endif %}
                    </div>

                    {# Subtitulo - CIANO #}
                    <p class="ep-hero-subtitle mb-3">{{ settings.welcome_message | default('Material de Pesca') }}</p>

                    {# Descricao #}
                    <p class="ep-hero-text mb-4">
                        {{ settings.welcome_text | default('Sua loja especializada em pesca sub, mergulho, pesca esportiva e caca. Equipamentos profissionais para todas as modalidades.') }}
                    </p>

                    {# Botoes de acao #}
                    <div class="ep-hero-buttons">
                        <a href="{{ store.products_url }}" class="btn ep-btn ep-btn-primary">
                            {{ "Ver Produtos" | translate }}
                        </a>
                        <a href="{% if store.categories | length > 0 %}{{ (store.categories | first).url }}{% else %}{{ store.products_url }}{% endif %}" class="btn ep-btn ep-btn-secondary">
                            {{ "Categorias" | translate }}
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
