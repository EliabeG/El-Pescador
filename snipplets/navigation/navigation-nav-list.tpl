{# /*============================================================================
  El Pescador - Lista de Navegacao Profissional

  PLANO DE MELHORIAS (10 etapas):
  1. ✅ Adicionar classes ep- para consistência
  2. ✅ Melhorar itens do menu
  3. ✅ Melhorar submenus
  4. ✅ Traduzir textos para PT-BR
  5. ✅ Melhorar dropdown
  6. ✅ Adicionar ícones de seta
  7. ✅ Melhorar megamenu
  8. ✅ Responsividade otimizada
  9. ✅ Melhorar acessibilidade
  10. ✅ Adicionar transições
==============================================================================*/ #}

{% set megamenu = megamenu | default(false) %}
{% set hamburger = hamburger | default(false) %}
{% set subitem = subitem | default(false) %}

{% for item in navigation %}
    {% if item.subitems %}
        <li class="{% if megamenu %}js-desktop-nav-item js-item-subitems-desktop nav-item-desktop {% if not subitem %}js-nav-main-item nav-dropdown nav-main-item{% endif %}{% endif %} nav-item item-with-subitems ep-nav-item ep-has-subitems" data-component="menu.item" role="menuitem" aria-haspopup="true">
            {% if megamenu %}
            <div class="nav-item-container ep-nav-item-container">
            {% endif %}
                <a class="{% if hamburger %}js-toggle-menu-panel align-items-center{% endif %} nav-list-link position-relative ep-nav-link {{ item.current ? 'selected ep-active' : '' }}" href="{% if megamenu and item.url %}{{ item.url }}{% else %}#{% endif %}" {% if item.subitems %}aria-expanded="false"{% endif %}>{{ item.name }}
                    {% if hamburger %}
                        <span class="nav-list-arrow ml-1 ep-nav-arrow">
                            <svg class="icon-inline icon-lg svg-icon-text"><use xlink:href="#arrow-long"/></svg>
                        </span>
                    {% endif %}
                </a>
            {% if megamenu %}
            </div>
            {% endif %}
            {% if megamenu and not subitem %}
                <div class="js-desktop-dropdown nav-dropdown-content desktop-dropdown ep-dropdown">
                    <div class="container ep-dropdown-container">
            {% endif %}
                        <ul class="{% if megamenu %}{% if not subitem %}desktop-list-subitems ep-desktop-subitems{% endif %}{% else %}js-menu-panel nav-list-panel nav-list-panel-left ep-nav-panel{% endif %} list-subitems ep-subitems" {% if hamburger %}style="display:none;"{% endif %} role="menu">
                            {% if hamburger %}
                                <div class="modal-header ep-panel-header">
                                    <a class="js-toggle-menu-back ep-back-link" href="#" aria-label="{{ 'Voltar ao menu anterior' | translate }}">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col-auto">
                                                <span class="modal-back ep-back-icon">
                                                    <svg class="icon-inline svg-icon-text icon-flip-horizontal"><use xlink:href="#chevron"/></svg>
                                                </span>
                                            </div>
                                            <div class="col pr-4 mr-2 ep-back-text">
                                                {{ item.name }}
                                            </div>
                                        </div>
                                    </a>
                                </div>
                                <div class="modal-body p-0 ep-panel-body">
                                    {% if item.isCategory %}
                                        <li class="nav-item py-1 ep-nav-item ep-view-all" role="menuitem">
                                            <a class="nav-list-link ep-nav-link {{ item.current ? 'selected ep-active' : '' }}" href="{{ item.url }}">
                                                {% if item.isRootCategory %}
                                                    {{ 'Ver todos os produtos' | translate }}
                                                {% else %}
                                                    {{ 'Ver tudo em' | translate }} {{ item.name }}
                                                {% endif %}
                                            </a>
                                        </li>
                                    {% endif %}
                            {% endif %}

                            {% set hamburger_val = false %}
                            {% if hamburger %}
                                {% set hamburger_val = true %}
                            {% endif %}
                            {% include 'snipplets/navigation/navigation-nav-list.tpl' with { 'navigation' : item.subitems, 'subitem' : true, 'hamburger' : hamburger_val  } %}

                            {% if hamburger %}
                                </div>
                            {% endif %}
                        </ul>
            {% if megamenu and not subitem %}
                    </div>
                </div>
            {% endif %}
        </li>
    {% else %}
        <li class="js-desktop-nav-item {% if megamenu %}{% if not subitem %}js-nav-main-item nav-main-item{% endif %} nav-item-desktop{% endif %} nav-item ep-nav-item" data-component="menu.item" role="menuitem">
            <a class="nav-list-link ep-nav-link {{ item.current ? 'selected ep-active' : '' }}" href="{% if item.url %}{{ item.url | setting_url }}{% else %}#{% endif %}">{{ item.name }}</a>
        </li>
    {% endif %}
{% endfor %}
