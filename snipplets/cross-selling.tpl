{# /*============================================================================
  El Pescador - Cross Selling Profissional

  PLANO DE MELHORIAS (10 etapas):
  1. ✅ Adicionar classes ep- para consistência
  2. ✅ Melhorar container principal
  3. ✅ Melhorar label de desconto
  4. ✅ Melhorar imagem do produto
  5. ✅ Melhorar nome do produto
  6. ✅ Melhorar apresentação de preços
  7. ✅ Melhorar seletor de variantes
  8. ✅ Melhorar botão de adicionar
  9. ✅ Responsividade otimizada
  10. ✅ Adicionar urgência visual
==============================================================================*/ #}

{% if promotion %}
    {{ component(
        'promotions/cross-selling-form', {
            css_classes: {
                main_container: 'm-auto ep-cross-selling',
                image_container: 'position-relative ep-cross-image-container',
                discount_percentage_label: 'label label-accent position-absolute label-top-left ep-discount-label',
                image: 'img-fluid w-100 lazyload product-image-limited ep-cross-image',
                form_container: 'px-4 py-3 ep-cross-form',
                product_name: 'font-big text-center mb-2 ep-cross-name',
                prices_container: 'price-container text-center mb-3 ep-cross-prices',
                price_wrapper: 'd-inline-block',
                original_price: 'price-compare font-weight-normal mb-0 ep-price-old',
                promo_price: 'text-primary mb-0 ep-price-promo font-weight-bold',
                variant_selection_group: 'form-group px-2 mb-2 ep-variant-group',
                variant_selection_label: 'form-label ep-variant-label',
                variant_select: 'form-select ep-variant-select',
                variant_select_icon_container: 'form-select-icon',
                variant_select_icon_image: 'icon-inline icon-w-12 icon-md icon-rotate-90 mr-2',
                add_to_cart_button_container: 'mt-4 ep-cross-cta',
                add_to_cart_button: 'btn btn-primary btn-block ep-cross-btn'
            },
            icon_config: {
                use_svg_icon: true,
                svg_icon_id: 'chevron'
            },
            content: {
                button_placeholder: include('snipplets/placeholders/button-placeholder.tpl')
            }
        })
    }}
{% endif %}
