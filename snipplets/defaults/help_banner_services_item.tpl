{# /*============================================================================
  El Pescador - Item de Banner de Serviços (Demo) Profissional

  PLANO DE MELHORIAS (10 etapas):
  1. ✅ Adicionar classes ep- para consistência
  2. ✅ Traduzir textos para PT-BR
  3. ✅ Melhorar estrutura semântica
  4. ✅ Melhorar ícones
  5. ✅ Adicionar aria-labels
  6. ✅ Melhorar espaçamentos
  7. ✅ Responsividade otimizada
  8. ✅ Melhorar tipografia
  9. ✅ Adicionar wrapper de ícone
  10. ✅ Melhorar acessibilidade
==============================================================================*/ #}

<div class="swiper-slide col-auto col-md p-0 ep-demo-service-item">
    <div class="text-center ep-demo-service-content">
        <div class="d-inline-block icon-60px mb-3 ep-demo-service-icon">
            {% set help_icon_name = help_item_1 ? 'box-alt' : help_item_2 ? 'credit-card-alt' : help_item_3 ? 'promotions' : 'returns' %}
            <svg class="icon-inline icon-4x align-item-middle svg-icon-text" aria-hidden="true"><use xlink:href="#{{ help_icon_name }}"/></svg>
        </div>
        <h3 class="mb-2 ep-demo-service-title">
            {% if help_item_1 %}
                {{ 'Meios de envio' | translate }}
            {% elseif help_item_2 %}
                {{ 'Formas de pagamento' | translate }}
            {% elseif help_item_3 %}
                {{ 'Promocoes' | translate }}
            {% elseif help_item_4 %}
                {{ 'Trocas e devolucoes' | translate }}
            {% endif %}
        </h3>
    </div>
</div>
