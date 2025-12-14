{# /*============================================================================
  El Pescador - Seletor de Idioma Profissional

  PLANO DE MELHORIAS (10 etapas):
  1. ✅ Adicionar classes ep- para consistência
  2. ✅ Melhorar lista de idiomas
  3. ✅ Melhorar bandeiras
  4. ✅ Traduzir textos para PT-BR
  5. ✅ Melhorar espaçamentos
  6. ✅ Destacar idioma ativo
  7. ✅ Adicionar lazy loading
  8. ✅ Responsividade otimizada
  9. ✅ Melhorar acessibilidade
  10. ✅ Adicionar transições
==============================================================================*/ #}

<nav aria-label="{{ 'Selecionar idioma' | translate }}">
    <ul class="list-unstyled ep-lang-list{% if header %} font-small ep-lang-header{% endif %}">
        {% for language in languages %}
            <li class="ep-lang-item {% if header %}{% if not loop.last %}mb-2{% endif %}{% else %}mb-4{% endif %}{% if language.active %} font-weight-bold ep-lang-active{% endif %}">
                <a href="{{ language.url }}" class="ep-lang-link" aria-label="{{ 'Mudar idioma para' | translate }} {{ language.country_name }}" {% if language.active %}aria-current="true"{% endif %}>
                    {% if not header %}
                        <img class="lazyload mr-1 ep-lang-flag" src="{{ 'images/empty-placeholder.png' | static_url }}" data-src="{{ language.country | flag_url }}" alt="{{ 'Bandeira' | translate }} {{ language.name }}" width="20" height="15" />
                    {% endif %}
                    <span class="ep-lang-name">{{ language.country_name }}</span>
                    {% if language.active %}
                        <svg class="icon-inline icon-sm ml-1 text-accent ep-lang-check"><use xlink:href="#check"/></svg>
                    {% endif %}
                </a>
            </li>
        {% endfor %}
    </ul>
</nav>
