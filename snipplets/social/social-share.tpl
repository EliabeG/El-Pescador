{# /*============================================================================
  El Pescador - Compartilhamento Social Profissional

  PLANO DE MELHORIAS (10 etapas):
  1. ✅ Adicionar classes ep- para consistência
  2. ✅ Traduzir textos para PT-BR
  3. ✅ Melhorar acessibilidade
  4. ✅ Adicionar container flexbox
  5. ✅ Melhorar ícones com wrapper
  6. ✅ Adicionar rel noopener para segurança
  7. ✅ Melhorar espaçamento entre botões
  8. ✅ Responsividade otimizada
  9. ✅ Adicionar efeito hover
  10. ✅ Melhorar estrutura semântica
==============================================================================*/ #}

<div class="ep-social-share d-flex flex-wrap align-items-center" role="group" aria-label="{{ 'Compartilhar produto' | translate }}">

    {# Botão WhatsApp - apenas mobile #}
    <a class="social-share-button ep-share-btn ep-share-whatsapp d-inline-block d-md-none"
       data-network="whatsapp"
       target="_blank"
       rel="noopener noreferrer"
       href="whatsapp://send?text={{ product.social_url }}"
       title="{{ 'Compartilhar no WhatsApp' | translate }}"
       aria-label="{{ 'Compartilhar no WhatsApp' | translate }}">
        <span class="ep-share-icon-wrapper">
            <svg class="icon-inline svg-icon-text ep-share-icon"><use xlink:href="#whatsapp"/></svg>
        </span>
    </a>

    {# Botão Facebook #}
    <a class="social-share-button ep-share-btn ep-share-facebook"
       data-network="facebook"
       target="_blank"
       rel="noopener noreferrer"
       href="https://www.facebook.com/sharer/sharer.php?u={{ product.social_url }}"
       title="{{ 'Compartilhar no Facebook' | translate }}"
       aria-label="{{ 'Compartilhar no Facebook' | translate }}">
        <span class="ep-share-icon-wrapper">
            <svg class="icon-inline svg-icon-text ep-share-icon"><use xlink:href="#facebook-f"/></svg>
        </span>
    </a>

    {# Botão Twitter/X #}
    <a class="social-share-button ep-share-btn ep-share-twitter"
       data-network="twitter"
       target="_blank"
       rel="noopener noreferrer"
       href="https://twitter.com/share?url={{ product.social_url }}"
       title="{{ 'Compartilhar no X (Twitter)' | translate }}"
       aria-label="{{ 'Compartilhar no X (Twitter)' | translate }}">
        <span class="ep-share-icon-wrapper">
            <svg class="icon-inline svg-icon-text ep-share-icon"><use xlink:href="#twitter"/></svg>
        </span>
    </a>

    {# Botão Pinterest #}
    <a class="js-pinterest-share social-share-button ep-share-btn ep-share-pinterest"
       data-network="pinterest"
       target="_blank"
       rel="noopener noreferrer"
       href="#"
       title="{{ 'Compartilhar no Pinterest' | translate }}"
       aria-label="{{ 'Compartilhar no Pinterest' | translate }}">
        <span class="ep-share-icon-wrapper">
            <svg class="icon-inline svg-icon-text ep-share-icon"><use xlink:href="#pinterest"/></svg>
        </span>
    </a>

    {# Container oculto do Pinterest para funcionalidade #}
    <div class="pinterest-hidden social-share-button ep-pinterest-hidden" style="display: none;" data-network="pinterest">
        {{product.social_url | pin_it('https:' ~ product.featured_image | product_image_url('large'))}}
    </div>

</div>
