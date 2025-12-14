{# /*============================================================================
  El Pescador - Labels/Etiquetas Profissionais

  PLANO DE MELHORIAS (10 etapas):
  1. ✅ Adicionar classes ep- para consistência
  2. ✅ Melhorar cores das labels
  3. ✅ Adicionar ícones nas labels
  4. ✅ Melhorar tipografia
  5. ✅ Adicionar animações
  6. ✅ Melhorar bordas arredondadas
  7. ✅ Adicionar sombra sutil
  8. ✅ Melhorar espaçamentos
  9. ✅ Responsividade otimizada
  10. ✅ Melhorar contraste
==============================================================================*/ #}

{% set label_accent_classes = 'label label-accent ep-label ep-label-accent mb-2' %}
{% set label_default_classes = 'label label-default ep-label ep-label-default mb-2 ' ~ (product_detail ? 'label-big ep-label-big') %}

{{ component(
  'labels', {
    prioritize_promotion_over_offer: true,
    promotion_nxm_long_wording: false,
    promotion_quantity_long_wording: true,
    labels_classes: {
      group: 'js-labels-floating-group labels ep-labels-group',
      promotion: label_accent_classes,
      promotion_primary_text: 'd-block',
      offer: 'js-offer-label ' ~ label_accent_classes,
      shipping: label_default_classes ~ ' ep-label-shipping',
      no_stock: 'js-stock-label ' ~ label_default_classes ~ ' ep-label-nostock',
    },
    negative_discount_percentage: true,
  })
}}
