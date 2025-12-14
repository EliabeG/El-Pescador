{# /*============================================================================
  El Pescador - Descricao de Produto Profissional

  PLANO DE MELHORIAS (10 etapas):
  1. ✅ Adicionar classes ep- para consistência
  2. ✅ Melhorar área de descrição
  3. ✅ Melhorar tipografia
  4. ✅ Traduzir textos para PT-BR
  5. ✅ Melhorar espaçamentos
  6. ✅ Adicionar seção de comentários
  7. ✅ Melhorar reviews
  8. ✅ Responsividade otimizada
  9. ✅ Melhorar acessibilidade
  10. ✅ Adicionar estrutura semântica
==============================================================================*/ #}

{% set description_content = product.description is not empty or settings.show_product_fb_comment_box %}

{% if description_content %}
    <section class="mt-2 pb-md-4 text-center ep-description-section {% if settings.full_width_description %}mt-md-5 text-md-center{% else %}mt-md-3 text-md-left{% endif %}" data-store="product-description-{{ product.id }}" aria-label="{{ 'Descricao do produto' | translate }}">
        {# Product description #}

        {% if product.description is not empty %}
            <div class="user-content font-small mb-4 ep-description-content">
                {{ product.description }}
            </div>
        {% endif %}

        {% if settings.show_product_fb_comment_box %}
            <div class="fb-comments section-fb-comments mb-3 ep-fb-comments" data-href="{{ product.social_url }}" data-num-posts="5" data-width="100%"></div>
        {% endif %}
        <div id="reviewsapp" class="ep-reviews"></div>
    </section>
{% endif %}
