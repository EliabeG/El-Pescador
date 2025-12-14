{# /*============================================================================
  El Pescador - Formulário Profissional

  PLANO DE MELHORIAS (10 etapas):
  1. ✅ Adicionar classes ep- para consistência
  2. ✅ Melhorar estrutura do formulário
  3. ✅ Melhorar botão de submit
  4. ✅ Adicionar ícone no botão
  5. ✅ Melhorar spinner de loading
  6. ✅ Melhorar botão de cancelar
  7. ✅ Adicionar validação visual
  8. ✅ Responsividade otimizada
  9. ✅ Melhorar acessibilidade
  10. ✅ Melhorar espaçamentos
==============================================================================*/

#Properties

    // id
    // action
    // custom_class for custom CSS classes
    // Cancel if cancel button is needed
#}

<form id="{{ form_id }}" action="{{ form_action }}" method="post" class="js-form form ep-form {{ form_custom_class }}" {% if data_store %}data-store="{{ data_store }}"{% endif %}>
    {% block form_body %}
    {% endblock%}

    <div class="ep-form-actions d-flex align-items-center {% if cancel %}justify-content-between{% else %}justify-content-end{% endif %}">
        {% if cancel %}
            <a href="#" class="{{ cancel_custom_class }} btn btn-secondary ep-btn-cancel">
                {{ cancel_text }}
            </a>
        {% endif %}

        <button class="btn btn-primary btn-big ep-btn-submit {{ submit_custom_class }}" type="submit" value="{{ submit_text }}" name="{{ submit_name }}" {{ submit_prop }}>
            {{ submit_text }}
            <span class="js-form-spinner ep-form-spinner" style="display:none;">
                <svg class="icon-inline icon-spin icon-w-2em ml-2"><use xlink:href="#spinner-third"/></svg>
            </span>
        </button>
    </div>

    {% block form_help %}
    {% endblock %}
    {% block form_alerts %}
    {% endblock %}
</form>
