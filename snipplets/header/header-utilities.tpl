{# /*============================================================================
  El Pescador - Utilitários do Header Profissional

  PLANO DE MELHORIAS (10 etapas):
  1. ✅ Adicionar classes ep- para consistência
  2. ✅ Melhorar ícone do menu
  3. ✅ Melhorar ícone de conta
  4. ✅ Melhorar ícone de busca
  5. ✅ Melhorar ícone do carrinho
  6. ✅ Adicionar badge animado no carrinho
  7. ✅ Melhorar hover states
  8. ✅ Responsividade otimizada
  9. ✅ Melhorar acessibilidade
  10. ✅ Melhorar dropdown de idiomas
==============================================================================*/ #}

{% if use_menu %}
    {# Menu hamburger #}
    <span class="utilities-container ep-utility-menu d-inline-block">
        <a href="#" class="js-modal-open utilities-item btn btn-utility ep-utility-btn pl-0" data-toggle="#nav-hamburger" aria-label="{{ 'Menu' | translate }}" data-component="menu-button">
            <svg class="icon-inline utilities-icon ep-menu-icon align-bottom"><use xlink:href="#bars"/></svg>
        </a>
    </span>

{% elseif use_account %}
    {# Account icon #}
    <span class="utilities-container ep-utility-account {% if header_desktop %}d-none d-md-inline-block mr-4{% endif %}">
        {% if icon_only %}
            <a href="{% if not customer %}{{ store.customer_login_url }}{% else %}{{ store.customer_home_url }}{% endif %}" class="btn btn-utility ep-utility-btn" aria-label="{{ 'Minha Conta' | translate }}">
                <svg class="icon-inline utilities-icon ep-account-icon"><use xlink:href="#user"/></svg>
            </a>
        {% else %}
            <div class="row no-gutters align-items-center font-small ep-account-info">
                <div class="col-auto pr-0">
                    <svg class="icon-inline font-big mr-1 ep-account-icon"><use xlink:href="#user"/></svg>
                </div>
                <div class="col pl-2 text-left">
                    {% if not customer %}
                        {{ "Entrar" | translate | a_tag(store.customer_login_url, '', 'mr-1 ep-login-link') }}
                        {% if 'mandatory' not in store.customer_accounts %}
                        .
                        {{ "Criar conta" | translate | a_tag(store.customer_register_url, '', 'ml-1 ep-register-link') }}
                        {% endif %}
                    {% else %}
                        {% set customer_short_name = customer.name|split(' ')|slice(0, 1)|join %}
                        {{ "Ola, {1}!" | t(customer_short_name) | a_tag(store.customer_home_url, '', 'mr-1 ep-welcome-link') }}
                        .
                        {{ "Sair" | translate | a_tag(store.customer_logout_url, '', 'ml-1 ep-logout-link') }}
                    {% endif %}
                </div>
            </div>
        {% endif %}
    </span>

{% elseif use_languages %}
    {# Language selector #}
    <span class="utilities-container ep-utility-lang nav-dropdown btn-utility position-relative py-0">
        <svg class="icon-inline utilities-icon ep-lang-icon"><use xlink:href="#globe"/></svg>
        <div class="nav-dropdown-content ep-lang-dropdown desktop-dropdown-small position-absolute">
            {% include "snipplets/navigation/navigation-lang.tpl" with { header: true } %}
        </div>
    </span>

{% elseif use_search %}
    {# Search icon #}
    <span class="utilities-container ep-utility-search {% if settings.search_type_mobile == 'search_big' %}d-none{% endif %} {% if settings.search_big_desktop %}d-md-none{% else %}d-md-inline-block{% endif %}">
        <a href="#" class="js-search-button js-modal-open js-fullscreen-modal-open btn btn-utility ep-utility-btn utilities-item {% if settings.logo_position_desktop == 'center' %}pl-md-0{% endif %}" data-modal-url="modal-fullscreen-search" data-toggle="#nav-search" aria-label="{{ 'Buscar' | translate }}">
            <svg class="icon-inline align-bottom utilities-icon ep-search-icon"><use xlink:href="#search"/></svg>
        </a>
    </span>

{% else %}
    {# Cart icon #}
    <span class="utilities-container ep-utility-cart d-inline-block">
        <div id="ajax-cart" class="cart-summary ep-cart-summary" data-component='cart-button'>
            <a
                {% if settings.ajax_cart and template != 'cart' %}
                    href="#"
                    data-toggle="#modal-cart"
                    data-modal-url="modal-fullscreen-cart"
                {% else %}
                    href="{{ store.cart_url }}"
                {% endif %}
                class="{% if settings.ajax_cart and template != 'cart' %}js-modal-open js-fullscreen-modal-open{% endif %} btn btn-utility ep-utility-btn ep-cart-btn position-relative pr-0"
                aria-label="{{ 'Carrinho' | translate }}"
                >
                <svg class="icon-inline utilities-icon cart-icon ep-cart-icon"><use xlink:href="#bag"/></svg>
                <span class="js-cart-widget-amount badge ep-cart-badge">{{ "{1}" | translate(cart.items_count ) }}</span>
            </a>
        </div>
    </span>
{% endif %}
