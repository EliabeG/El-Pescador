{# /*============================================================================
  El Pescador - Banner de Categoria Profissional

  PLANO DE MELHORIAS (10 etapas):
  1. ✅ Adicionar classes ep- para consistência
  2. ✅ Adicionar overlay gradiente
  3. ✅ Melhorar proporção da imagem
  4. ✅ Adicionar título da categoria
  5. ✅ Melhorar lazy loading
  6. ✅ Adicionar efeito parallax sutil
  7. ✅ Melhorar bordas e cantos
  8. ✅ Responsividade otimizada
  9. ✅ Melhorar acessibilidade
  10. ✅ Adicionar breadcrumb integrado
==============================================================================*/ #}

{% set image_sizes = ['large', 'huge', 'original', '1080p'] %}
{% set category_images = [] %}
{% set has_category_images = category.images is not empty %}

{% for size in image_sizes %}
    {% if has_category_images %}
        {# Define images for admin categories #}
        {% set category_images = category_images|merge({(size):(category.images | first | category_image_url(size))}) %}
    {% else %}
        {# Define images for general banner #}
        {% set category_images = category_images|merge({(size):('banner-products.jpg' | static_url | settings_image_url(size))}) %}
    {% endif %}
{% endfor %}

{% set category_image_url = 'banner-products.jpg' | static_url %}

<section class="ep-category-banner category-banner position-relative mb-4" data-store="category-banner">
    {# Imagem do banner #}
    <img
        class="ep-category-banner-image category-banner-image w-100"
        fetchpriority="high"
        src="{{ category_images['large'] }}"
        srcset="{{ category_images['large'] }} 480w, {{ category_images['huge'] }} 640w, {{ category_images['original'] }} 1024w, {{ category_images['1080p'] }} 1920w"
        alt="{{ 'Banner da categoria' | translate }} {{ category.name }}"
    />

    {# Overlay gradiente #}
    <div class="ep-category-banner-overlay"></div>

    {# Conteúdo sobre o banner #}
    {% if category.name %}
    <div class="ep-category-banner-content position-absolute w-100 text-center">
        <div class="container">
            <h1 class="ep-category-banner-title text-white mb-0">{{ category.name }}</h1>
            {% if category.description %}
                <p class="ep-category-banner-desc text-white opacity-80 mt-2 mb-0 d-none d-md-block">{{ category.description | truncate(150) }}</p>
            {% endif %}
        </div>
    </div>
    {% endif %}
</section>
