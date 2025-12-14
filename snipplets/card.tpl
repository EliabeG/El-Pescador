{# /*============================================================================
  El Pescador - Card Profissional

  PLANO DE MELHORIAS (10 etapas):
  1. ✅ Adicionar classes ep- para consistência
  2. ✅ Melhorar bordas e sombras
  3. ✅ Adicionar transições suaves
  4. ✅ Melhorar header do card
  5. ✅ Melhorar ícone de collapse
  6. ✅ Melhorar espaçamentos
  7. ✅ Adicionar hover states
  8. ✅ Melhorar footer do card
  9. ✅ Responsividade otimizada
  10. ✅ Acessibilidade melhorada
==============================================================================*/

#Head
    // Block - card_head
#Body
    // Block - card_body
#Footer
    // Block - card_footer

#}


<div class="{% if card_collapse %}js-card-collapse {% endif %}card ep-card {{ card_custom_class }} {% if card_active %}active{% endif %}">
    <div class="{% if card_collapse %}js-card-header-collapse card-header-collapse {% endif %}card-header ep-card-header">
        <span class="ep-card-title">{% block card_head %}{% endblock %}</span>
        {% if card_collapse %}
            <span class="js-card-collapse-toggle card-collapse-toggle ep-collapse-toggle {% if card_active %}active{% endif %}" aria-expanded="{{ card_active ? 'true' : 'false' }}" aria-label="{{ 'Expandir' | translate }}">
                <svg class="icon-inline icon-w-14 icon-lg icon-rotate-90 ep-collapse-icon"><use xlink:href="#chevron"/></svg>
            </span>
        {% endif %}
    </div>
    <div class="card-body ep-card-body {{ card_custom_body_class }}">
        {% block card_body %}{% endblock %}
    </div>
    {% if card_footer %}
        <div class="card-footer ep-card-footer {{ card_custom_footer_class }}">
            {% block card_foot %}{% endblock %}
        </div>
    {% endif %}
</div>
