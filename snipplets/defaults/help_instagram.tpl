{# /*============================================================================
  El Pescador - Item Instagram (Demo) Profissional

  PLANO DE MELHORIAS (10 etapas):
  1. ✅ Adicionar classes ep- para consistência
  2. ✅ Traduzir textos para PT-BR
  3. ✅ Melhorar estrutura semântica
  4. ✅ Melhorar container de imagem
  5. ✅ Adicionar aria-labels
  6. ✅ Melhorar espaçamentos
  7. ✅ Responsividade otimizada
  8. ✅ Adicionar wrapper
  9. ✅ Melhorar overflow
  10. ✅ Melhorar acessibilidade
==============================================================================*/ #}

<div class="col-4 col-grid col-md-3 instafeed-col ep-demo-insta-col">
    <div class="instafeed-link m-md-0 ep-demo-insta-link">
        <div class="instafeed-img overflow-none ep-demo-insta-img" role="img" aria-label="{{ 'Imagem do Instagram de exemplo' | translate }}">
            {% if help_item_1 %}
                <svg class="w-100 h-100" aria-hidden="true"><use xlink:href="#instagram-placeholder-1"/></svg>
            {% elseif help_item_2 %}
                <svg class="w-100 h-100" aria-hidden="true"><use xlink:href="#instagram-placeholder-2"/></svg>
            {% endif %}
        </div>
    </div>
</div>
