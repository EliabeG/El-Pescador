{# /*============================================================================
  El Pescador - Menu do Footer Profissional

  PLANO DE MELHORIAS (10 etapas):
  1. ✅ Adicionar classes ep- para consistência
  2. ✅ Melhorar lista de links
  3. ✅ Melhorar hover nos links
  4. ✅ Traduzir textos para PT-BR
  5. ✅ Melhorar espaçamentos
  6. ✅ Adicionar estrutura semântica
  7. ✅ Indicar links externos
  8. ✅ Responsividade otimizada
  9. ✅ Melhorar acessibilidade
  10. ✅ Adicionar transições suaves
==============================================================================*/ #}

<nav aria-label="{{ 'Menu do rodape' | translate }}">
    <ul class="list py-2 font-small ep-footer-menu">
        {% for item in menus[settings.footer_menu] %}
            <li class="footer-menu-item ep-footer-item{% if loop.last %} mb-2{% endif %}">
                <a class="footer-menu-link ep-footer-link" href="{{ item.url }}" {% if item.url | is_external %}target="_blank" rel="noopener noreferrer" aria-label="{{ item.name }} ({{ 'abre em nova aba' | translate }})"{% endif %}>
                    {{ item.name }}
                    {% if item.url | is_external %}
                        <svg class="icon-inline icon-sm ml-1 opacity-50"><use xlink:href="#external-link"/></svg>
                    {% endif %}
                </a>
            </li>
        {% endfor %}
    </ul>
</nav>
