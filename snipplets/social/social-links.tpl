{# /*============================================================================
  El Pescador - Links Sociais Profissionais

  PLANO DE MELHORIAS (10 etapas):
  1. ✅ Adicionar container flexbox
  2. ✅ Melhorar espaçamento entre ícones
  3. ✅ Adicionar efeito hover com cor da rede
  4. ✅ Melhorar tamanho dos ícones
  5. ✅ Adicionar transições suaves
  6. ✅ Melhorar acessibilidade (aria-labels)
  7. ✅ Adicionar fundo circular nos ícones
  8. ✅ Responsividade otimizada
  9. ✅ Adicionar tooltip com nome da rede
  10. ✅ Melhorar contraste e visibilidade
==============================================================================*/ #}

<div class="ep-social-links d-flex flex-wrap justify-content-center align-items-center">
    {% for sn in ['instagram', 'facebook', 'youtube', 'tiktok', 'twitter', 'pinterest'] %}
        {% set sn_url = attribute(store,sn) %}
        {% if sn_url %}
            {% if sn == "facebook" %}
                {% set social_network = sn ~ '-f' %}
            {% else %}
                {% set social_network = sn %}
            {% endif %}

            {# Definir nome amigável para tooltip #}
            {% set sn_names = {
                'instagram': 'Instagram',
                'facebook': 'Facebook',
                'youtube': 'YouTube',
                'tiktok': 'TikTok',
                'twitter': 'X (Twitter)',
                'pinterest': 'Pinterest'
            } %}

            <a
                href="{{ sn_url }}"
                target="_blank"
                rel="noopener noreferrer"
                class="ep-social-link ep-social-{{ sn }} mx-2"
                aria-label="{{ "Siga-nos no" | translate }} {{ sn_names[sn] }}"
                title="{{ sn_names[sn] }}"
            >
                <span class="ep-social-icon-wrapper">
                    <svg class="icon-inline icon-lg ep-social-icon"><use xlink:href="#{{ social_network }}"/></svg>
                </span>
            </a>
        {% endif %}
    {% endfor %}
</div>
