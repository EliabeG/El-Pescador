{# /*============================================================================
  El Pescador - Select de Formulário Profissional

  PLANO DE MELHORIAS (10 etapas):
  1. ✅ Adicionar classes ep- para consistência
  2. ✅ Melhorar label do select
  3. ✅ Melhorar estilo do select
  4. ✅ Adicionar estados de foco
  5. ✅ Melhorar ícone dropdown
  6. ✅ Adicionar validação visual
  7. ✅ Melhorar opções
  8. ✅ Responsividade otimizada
  9. ✅ Melhorar acessibilidade
  10. ✅ Melhorar espaçamentos
==============================================================================*/

#Properties

#Group
    //select_group_custom_class for custom CSS classes
#Label
    // select_label_name for name
    // select_label_id for ID
    // select_for for label for
    // select_label_custom_class for custom CSS classes
#Select
    // select_id for id
    // select_name for name
    // select_custom_class for custom CSS classes
    // input_rows for textarea rows
    // select_options to insert select options
    // select_aria_label for aria-label attribute

#}

<div class="form-group ep-form-group ep-select-group {{ select_group_custom_class }}">
    {% if select_label %}
        <label {% if select_label_id%}id="{{ select_label_id }}"{% endif %} class="form-label ep-form-label {{ select_label_custom_class }}" {% if select_for %}for="{{ select_for }}"{% endif %}>{{ select_label_name }}</label>
    {% endif %}
    <div class="ep-select-wrapper position-relative">
        <select
            {% if select_id %}id="{{ select_id }}"{% endif %}
            class="form-select ep-select {{ select_custom_class }} {% if select_inline %}form-control-inline{% endif %}"
            {% if select_name %}name="{{ select_name }}"{% endif %}
            {% if select_aria_label %}aria-label="{{ select_aria_label }}"{% endif %}>
            {% block select_options %}
            {% endblock select_options %}
        </select>
        <div class="form-select-icon ep-select-icon">
            {% if sort %}
                {% set svg_icon = 'sort-alt' %}
                {% set rotate_class = '' %}
            {% else %}
                {% set svg_icon = 'chevron' %}
                {% set rotate_class = 'icon-rotate-90' %}
            {% endif %}
            <svg class="icon-inline icon-w-14 {{ rotate_class }}"><use xlink:href="#{{ svg_icon }}"/></svg>
        </div>
    </div>
</div>
