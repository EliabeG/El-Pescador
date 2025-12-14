{# /*============================================================================
  El Pescador - Variantes de Produto Profissional

  PLANO DE MELHORIAS (10 etapas):
  1. ✅ Adicionar classes ep- para consistência
  2. ✅ Melhorar seletores de variantes
  3. ✅ Melhorar botões de cor
  4. ✅ Traduzir textos para PT-BR
  5. ✅ Melhorar guia de tamanhos
  6. ✅ Melhorar espaçamentos
  7. ✅ Adicionar feedback visual
  8. ✅ Responsividade otimizada
  9. ✅ Melhorar acessibilidade
  10. ✅ Melhorar imagens de variantes
==============================================================================*/ #}

<div class="js-product-variants {% if quickshop %}js-product-quickshop-variants{% endif %} form-row ep-variants {% if not settings.bullet_variants %}mb-2{% endif %}">
    {% set has_size_variations = false %}
    {% if settings.bullet_variants %}
        {% set hidden_variant_select = ' d-none' %}
    {% endif %}
    {% for variation in product.variations %}
        {% if variation.name in ['Talle', 'Talla', 'Tamanho', 'Size'] %}
            {% set has_size_variations = true %}
        {% endif %}

        {% if settings.image_color_variants and not (settings.bullet_variants)  %}
            {% if variation.name in ['Color', 'Cor'] %}
                {% set hidden_variant_select = ' d-none' %}
            {% else %}
                {% set hidden_variant_select = ' d-block' %}
            {% endif %}
        {% endif %}

        {% set is_button_variant = settings.bullet_variants or (settings.image_color_variants and variation.name in ['Color', 'Cor']) %}
        <div class="js-product-variants-group {% if variation.name in ['Color', 'Cor'] %}js-color-variants-container{% endif %} ep-variant-group {% if is_button_variant %}form-group col-12 text-center text-md-left ep-variant-buttons {% if loop.last and not (show_size_guide and settings.size_guide_url and has_size_variations) %}mb-4{% else %}mb-2{% endif %}{% else %}{% if loop.length == 1 or loop.length == 3 or settings.image_color_variants %}col-12 col-md-8{% else %}col-6{% endif %}{% endif %}" data-variation-id="{{ variation.id }}">
            {% if quickshop %}
                {% embed "snipplets/forms/form-select.tpl" with{select_label: true, select_label_name: '' ~ variation.name ~ '', select_for: 'variation_' ~ loop.index , select_id: 'variation_' ~ loop.index, select_name: 'variation' ~ '[' ~ variation.id ~ ']', select_group_custom_class: hidden_variant_select ~ ' ep-variant-select', select_custom_class: 'js-variation-option js-refresh-installment-data ep-select'} %}
                    {% block select_options %}
                        {% for option in variation.options %}
                            <option value="{{ option.id }}" {% if product.default_options[variation.id] is same as(option.id) %}selected="selected"{% endif %}>{{ option.name }}</option>
                        {% endfor %}
                    {% endblock select_options%}
                {% endembed %}
            {% else %}
                {% embed "snipplets/forms/form-select.tpl" with{select_label: true, select_label_name: '' ~ variation.name ~ '', select_for: 'variation_' ~ loop.index , select_id: 'variation_' ~ loop.index, select_name: 'variation' ~ '[' ~ variation.id ~ ']', select_custom_class: 'js-variation-option js-refresh-installment-data ep-select', select_group_custom_class: hidden_variant_select ~ ' ep-variant-select'} %}
                    {% block select_options %}
                        {% for option in variation.options %}
                            <option value="{{ option.id }}" {% if product.default_options[variation.id] is same as(option.id) %}selected="selected"{% endif %}>{{ option.name }}</option>
                        {% endfor %}
                    {% endblock select_options%}
                {% endembed %}
            {% endif %}
            {% if is_button_variant %}
                <label class="form-label text-center text-md-left ep-variant-label">{{ variation.name }}: <span class="js-insta-variation-label ep-selected-variant">{{ product.default_options[variation.id] }}</span></label>
                <div class="ep-variant-options" role="radiogroup" aria-label="{{ variation.name }}">
                {% for option in variation.options %}
                    <a data-option="{{ option.id }}" class="js-insta-variant btn btn-variant ep-variant-btn{% if product.default_options[variation.id] is same as(option.id) %} selected ep-selected{% endif %}{% if variation.name in ['Color', 'Cor'] %} {% if option.custom_data or settings.image_color_variants %}btn-variant-color ep-color-btn{% endif %} p-0{% endif %}" title="{{ option.name }}" data-option="{{ option.id }}" data-variation-id="{{ variation.id }}" role="radio" aria-checked="{% if product.default_options[variation.id] is same as(option.id) %}true{% else %}false{% endif %}" aria-label="{{ option.name }}">
                        <span class="btn-variant-content ep-variant-content{% if settings.image_color_variants and variation.name in ['Color', 'Cor'] %} btn-variant-content-square ep-color-square{% endif %}"{% if option.custom_data and variation.name in ['Color', 'Cor'] and (settings.bullet_variants and not settings.image_color_variants) %} style="background: {{ option.custom_data }}; border: 1px solid #eee"{% endif %} data-name="{{ option.name }}">
                            {% if settings.image_color_variants and variation.name in ['Color', 'Cor'] %}
                                {% if product.default_options[variation.id] is same as(option.id) %}
                                    <img src="{{ 'images/empty-placeholder.png' | static_url }}" data-src="{{ product.featured_variant_image | product_image_url('thumb')}}" data-sizes="auto" class="lazyload absolute-centered-vertically ep-variant-img" {% if image.alt %}alt="{{image.alt}}"{% else %}alt="{{ option.name }}"{% endif %} />
                                {% else %}
                                    {% for variant in product.variants if (variant.option1 == option.id) or (variant.option2 == option.id) or (variant.option3 == option.id) %}
                                        {% if loop.first %}
                                            <img src="{{ 'images/empty-placeholder.png' | static_url }}" data-src="{{ variant.image | product_image_url('thumb') }}" data-sizes="auto" class="lazyload absolute-centered-vertically ep-variant-img" alt="{{ option.name }}" />
                                        {% endif %}
                                    {% endfor %}
                                {% endif %}
                            {% endif %}
                            {% if not(variation.name in ['Color', 'Cor']) or ((variation.name in ['Color', 'Cor']) and not option.custom_data and not settings.image_color_variants) %}
                                {{ option.name }}
                            {% endif %}
                        </span>
                    </a>
                {% endfor %}
                </div>
            {% endif %}
        </div>
    {% endfor %}
    {% if show_size_guide and settings.size_guide_url and has_size_variations %}
        {% set has_size_guide_page_finded = false %}
        {% set size_guide_url_handle = settings.size_guide_url | trim('/') | split('/') | last %}

        {% for page in pages if page.handle == size_guide_url_handle and not has_size_guide_page_finded %}
            {% set has_size_guide_page_finded = true %}
            {% if has_size_guide_page_finded %}
                <a data-toggle="#size-guide-modal" data-modal-url="modal-fullscreen-size-guide" class="js-modal-open js-fullscreen-modal-open font-small col-12 pb-2 mb-2 ep-size-guide-link">
                    <span class="btn-link font-small ep-size-guide-btn">
                        <svg class="icon-inline mr-1"><use xlink:href="#ruler"/></svg>
                        {{ 'Guia de tamanhos' | translate }}
                    </span>
                </a>
                {% embed "snipplets/modal.tpl" with{modal_id: 'size-guide-modal',modal_class: 'bottom-md ep-size-guide-modal', modal_position: 'right modal-centered-md', modal_transition: 'slide', modal_header_title: true, modal_width: 'centered', modal_mobile_full_screen: 'true'} %}
                    {% block modal_head %}
                        {{ 'Guia de tamanhos' | translate }}
                    {% endblock %}
                    {% block modal_body %}
                        <div class="user-content ep-size-guide-content">
                            {{ page.content }}
                        </div>
                    {% endblock %}
                {% endembed %}
            {% endif %}
        {% endfor %}
    {% endif %}
</div>
