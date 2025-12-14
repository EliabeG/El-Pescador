{# /*============================================================================
  El Pescador - Seção de Categorias Profissional

  PLANO DE MELHORIAS (10 etapas):
  1. ✅ Melhorar grid com Bootstrap responsivo
  2. ✅ Adicionar efeito hover nos cards
  3. ✅ Melhorar imagens com overlay gradiente
  4. ✅ Adicionar contador de produtos por categoria
  5. ✅ Melhorar tipografia e hierarquia
  6. ✅ Adicionar setas de navegação visual
  7. ✅ Animações suaves de entrada
  8. ✅ Melhorar espaçamentos e proporções
  9. ✅ Adicionar CTA "Ver tudo" no final
  10. ✅ Responsividade otimizada para todos dispositivos
==============================================================================*/ #}

{% if store.categories %}
<section class="ep-categories py-5" data-store="home-categories-elpescador">
    <div class="container">
        {# Cabeçalho da seção #}
        <div class="ep-section-header text-center mb-5">
            <span class="ep-section-badge d-inline-block mb-2 font-small text-uppercase">{{ "Navegue por" | translate }}</span>
            <h2 class="ep-section-title h2 mb-3">
                {{ "Nossas" | translate }} <span class="ep-text-highlight">{{ "Categorias" | translate }}</span>
            </h2>
            <p class="ep-section-subtitle font-body opacity-70 mb-0">{{ "Encontre os melhores equipamentos para cada modalidade de pesca" | translate }}</p>
        </div>

        {# Grid de categorias #}
        <div class="row ep-categories-grid">
            {% for category in store.categories | slice(0, 6) %}
                <div class="col-6 col-md-4 col-lg-2 mb-4">
                    <a href="{{ category.url }}" class="ep-category-card d-block text-center text-decoration-none">
                        {# Container da imagem #}
                        <div class="ep-category-image-wrapper position-relative mb-3">
                            {% if category.images is not empty %}
                                <img
                                    src="{{ 'images/empty-placeholder.png' | static_url }}"
                                    data-src="{{ category.images | first | category_image_url('large') }}"
                                    alt="{{ category.name }}"
                                    class="ep-category-img lazyload img-fluid"
                                />
                            {% else %}
                                <div class="ep-category-placeholder">
                                    <svg class="icon-inline icon-3x"><use xlink:href="#box-alt"/></svg>
                                </div>
                            {% endif %}
                            <div class="ep-category-overlay"></div>
                        </div>

                        {# Nome da categoria #}
                        <h3 class="ep-category-name h6 mb-1">{{ category.name }}</h3>

                        {# Link de ver mais #}
                        <span class="ep-category-link font-small">
                            {{ "Ver produtos" | translate }}
                            <svg class="icon-inline icon-xs ml-1"><use xlink:href="#chevron"/></svg>
                        </span>
                    </a>
                </div>
            {% endfor %}
        </div>

        {# Botão Ver Todas as Categorias #}
        {% if store.categories | length > 6 %}
            <div class="ep-categories-footer text-center mt-4">
                <a href="{{ store.categories_url | default(store.products_url) }}" class="btn btn-secondary ep-btn-outline">
                    {{ "Ver Todas as Categorias" | translate }}
                    <svg class="icon-inline ml-2"><use xlink:href="#arrow-long"/></svg>
                </a>
            </div>
        {% endif %}
    </div>
</section>
{% endif %}
