{# /*============================================================================
  El Pescador - Breadcrumbs Profissional

  PLANO DE MELHORIAS (10 etapas):
  1. ✅ Adicionar ícone de home
  2. ✅ Melhorar separador visual (chevron)
  3. ✅ Adicionar Schema.org para SEO
  4. ✅ Melhorar tipografia e espaçamentos
  5. ✅ Adicionar hover states
  6. ✅ Melhorar cores e contraste
  7. ✅ Adicionar transições suaves
  8. ✅ Melhorar responsividade
  9. ✅ Truncar textos longos em mobile
  10. ✅ Adicionar acessibilidade (aria-labels)
==============================================================================*/
#Properties

#Breadcrumb
    //breadcrumbs_custom_class for custom CSS classes
#}

{% if breadcrumbs %}
    <nav class="ep-breadcrumbs {{ breadcrumbs_custom_class }}" aria-label="{{ 'Navegacao' | translate }}">
        <ol class="ep-breadcrumbs-list d-flex flex-wrap align-items-center list-unstyled mb-0" itemscope itemtype="https://schema.org/BreadcrumbList">
            {# Home #}
            <li class="ep-breadcrumb-item" itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem">
                <a class="ep-breadcrumb-link" href="{{ store.url }}" title="{{ store.name }}" itemprop="item">
                    <svg class="icon-inline icon-sm ep-home-icon"><use xlink:href="#home"/></svg>
                    <span class="d-none d-md-inline" itemprop="name">{{ "Inicio" | translate }}</span>
                </a>
                <meta itemprop="position" content="1" />
            </li>

            <li class="ep-breadcrumb-separator" aria-hidden="true">
                <svg class="icon-inline icon-xs"><use xlink:href="#chevron"/></svg>
            </li>

            {% if template == 'page' %}
                <li class="ep-breadcrumb-item active" itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem">
                    <span class="ep-breadcrumb-current" itemprop="name">{{ page.name }}</span>
                    <meta itemprop="position" content="2" />
                </li>
            {% elseif template == 'cart' %}
                <li class="ep-breadcrumb-item active" itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem">
                    <span class="ep-breadcrumb-current" itemprop="name">{{ "Carrinho de Compras" | translate }}</span>
                    <meta itemprop="position" content="2" />
                </li>
            {% elseif template == 'search' %}
                <li class="ep-breadcrumb-item active" itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem">
                    <span class="ep-breadcrumb-current" itemprop="name">{{ "Resultados da Busca" | translate }}</span>
                    <meta itemprop="position" content="2" />
                </li>
            {% elseif template == 'account.order' %}
                <li class="ep-breadcrumb-item active" itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem">
                    <span class="ep-breadcrumb-current" itemprop="name">{{ 'Pedido {1}' | translate(order.number) }}</span>
                    <meta itemprop="position" content="2" />
                </li>
            {% elseif template == 'blog' %}
                <li class="ep-breadcrumb-item active" itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem">
                    <span class="ep-breadcrumb-current" itemprop="name">{{ 'Blog' | translate }}</span>
                    <meta itemprop="position" content="2" />
                </li>
            {% elseif template == 'blog-post' %}
                <li class="ep-breadcrumb-item" itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem">
                    <a class="ep-breadcrumb-link" href="{{ store.blog_url }}" title="{{ 'Blog' | translate }}" itemprop="item">
                        <span itemprop="name">{{ 'Blog' | translate }}</span>
                    </a>
                    <meta itemprop="position" content="2" />
                </li>
                <li class="ep-breadcrumb-separator" aria-hidden="true">
                    <svg class="icon-inline icon-xs"><use xlink:href="#chevron"/></svg>
                </li>
                <li class="ep-breadcrumb-item active" itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem">
                    <span class="ep-breadcrumb-current" itemprop="name">{{ post.title }}</span>
                    <meta itemprop="position" content="3" />
                </li>
            {% else %}
                {% set position = 2 %}
                {% for crumb in breadcrumbs %}
                    {% if crumb.last %}
                        <li class="ep-breadcrumb-item active" itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem">
                            <span class="ep-breadcrumb-current" itemprop="name">{{ crumb.name }}</span>
                            <meta itemprop="position" content="{{ position }}" />
                        </li>
                    {% else %}
                        <li class="ep-breadcrumb-item" itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem">
                            <a class="ep-breadcrumb-link" href="{{ crumb.url }}" title="{{ crumb.name }}" itemprop="item">
                                <span itemprop="name">{{ crumb.name }}</span>
                            </a>
                            <meta itemprop="position" content="{{ position }}" />
                        </li>
                        <li class="ep-breadcrumb-separator" aria-hidden="true">
                            <svg class="icon-inline icon-xs"><use xlink:href="#chevron"/></svg>
                        </li>
                    {% endif %}
                    {% set position = position + 1 %}
                {% endfor %}
            {% endif %}
        </ol>
    </nav>
{% endif %}
