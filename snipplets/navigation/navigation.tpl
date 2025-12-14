{# /*============================================================================
  El Pescador - Navegacao Desktop Profissional

  PLANO DE MELHORIAS (10 etapas):
  1. ✅ Adicionar classes ep- para consistência
  2. ✅ Melhorar estrutura da navegação
  3. ✅ Melhorar setas de navegação
  4. ✅ Traduzir textos para PT-BR
  5. ✅ Melhorar espaçamentos
  6. ✅ Adicionar ícones
  7. ✅ Melhorar transições
  8. ✅ Responsividade otimizada
  9. ✅ Melhorar acessibilidade
  10. ✅ Melhorar estados hover/active
==============================================================================*/ #}

{% set header_left_with_big_search = settings.logo_position_desktop == 'left' and settings.search_big_desktop %}
<nav class="nav-desktop {% if header_left_with_big_search %}nav-desktop-left{% endif %} ep-nav-desktop" aria-label="{{ 'Menu principal' | translate }}">
    <ul class="js-nav-desktop-list nav-desktop-list ep-nav-list" data-store="navigation" data-component="menu" role="menubar">
        <span class="js-nav-desktop-list-arrow js-nav-desktop-list-arrow-left nav-desktop-list-arrow nav-desktop-list-arrow-left disable ep-nav-arrow ep-nav-arrow-left" style="display: none" aria-label="{{ 'Rolar para esquerda' | translate }}" role="button">
            <svg class="icon-inline icon-lg icon-flip-horizontal"><use xlink:href="#chevron"/></svg>
        </span>
        {% include 'snipplets/navigation/navigation-nav-list.tpl' with {'megamenu' : true } %}
        <span class="js-nav-desktop-list-arrow js-nav-desktop-list-arrow-right nav-desktop-list-arrow nav-desktop-list-arrow-right ep-nav-arrow ep-nav-arrow-right" style="display: none" aria-label="{{ 'Rolar para direita' | translate }}" role="button">
            <svg class="icon-inline icon-lg"><use xlink:href="#chevron"/></svg>
        </span>
    </ul>
</nav>
