{# /*============================================================================
  El Pescador - Painel de Navegacao Profissional

  PLANO DE MELHORIAS (10 etapas):
  1. ✅ Adicionar classes ep- para consistência
  2. ✅ Melhorar navegação primária
  3. ✅ Melhorar navegação secundária
  4. ✅ Traduzir textos para PT-BR
  5. ✅ Melhorar espaçamentos
  6. ✅ Adicionar estrutura semântica
  7. ✅ Melhorar links da conta
  8. ✅ Responsividade otimizada
  9. ✅ Melhorar acessibilidade
  10. ✅ Adicionar transições suaves
==============================================================================*/ #}

{% if primary_links %}
    <nav class="nav-primary ep-nav-primary" aria-label="{{ 'Menu de navegacao' | translate }}">
        <ul class="nav-list ep-nav-list" data-store="navigation" data-component="menu" role="menu">
            {% include 'snipplets/navigation/navigation-nav-list.tpl' with { 'hamburger' : true  } %}
        </ul>
    </nav>
{% else %}
    <div class="nav-secondary text-left ep-nav-secondary" data-store="account-links">
        <div class="p-3 ep-nav-account">
            {% include "snipplets/header/header-utilities.tpl" with {use_account: true} %}
        </div>
    </div>
{% endif %}
