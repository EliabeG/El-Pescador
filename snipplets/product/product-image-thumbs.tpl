{# /*============================================================================
  El Pescador - Thumbnails de Imagem Profissional

  PLANO DE MELHORIAS (10 etapas):
  1. ✅ Adicionar classes ep- para consistência
  2. ✅ Melhorar thumbnails
  3. ✅ Melhorar ícone de vídeo
  4. ✅ Traduzir textos para PT-BR
  5. ✅ Melhorar lazy loading
  6. ✅ Melhorar estado selecionado
  7. ✅ Melhorar espaçamentos
  8. ✅ Responsividade otimizada
  9. ✅ Melhorar acessibilidade
  10. ✅ Melhorar transições
==============================================================================*/ #}

<a href="#" {% if media.isVideo %}data-video_id="{{ media.id }}"{% endif %} class="js-product-thumb {% if loop.last and last_open_modal %}js-product-thumb-modal{% endif %} product-thumb d-block position-relative mb-3 ep-thumb {% if loop.first %}selected ep-thumb-selected{% endif %}" style="padding-bottom: {{ media.dimensions['height'] / media.dimensions['width'] * 100}}%;" data-thumb-loop="{{loop.index0}}" aria-label="{{ 'Ver imagem' | translate }} {{ loop.index }}" role="button">
    {% if media.isImage %}
        <img data-sizes="auto" src="{{ 'images/empty-placeholder.png' | static_url }}" data-srcset='{{  media | product_image_url('large') }} 480w, {{  media | product_image_url('huge') }} 640w' class="img-absolute img-absolute-centered lazyautosizes lazyload ep-thumb-img" {% if media.alt %}alt="{{media.alt}}"{% else %}alt="{{ product.name }} - {{ 'Imagem' | translate }} {{ loop.index }}"{% endif %} />
    {% else %}
        <div class="video-player-icon video-player-icon-small ep-video-icon">
            <svg class="icon-inline icon-xs svg-icon-text"><use xlink:href="#play"/></svg>
        </div>
        <img alt="{{ 'Video de' | translate }} {% if template != 'product' %}{{ product.name }}{% else %}{{ store.name }}{% endif %}" data-sizes="auto" src="{{ 'images/empty-placeholder.png' | static_url }}" data-src="{{ media.thumbnail }}" class="img-absolute img-absolute-centered lazyautosizes lazyload ep-video-thumb-img"/>
    {% endif %}
</a>
