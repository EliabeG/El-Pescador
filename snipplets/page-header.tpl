{# /*============================================================================
  El Pescador - Cabeçalho de Página Profissional

  PLANO DE MELHORIAS (10 etapas):
  1. ✅ Adicionar classes ep- para consistência
  2. ✅ Melhorar tipografia do título
  3. ✅ Adicionar decoração visual
  4. ✅ Melhorar espaçamentos
  5. ✅ Integrar breadcrumbs melhorados
  6. ✅ Adicionar animação de entrada
  7. ✅ Melhorar hierarquia visual
  8. ✅ Responsividade otimizada
  9. ✅ Melhorar cores e contraste
  10. ✅ Adicionar linha decorativa
==============================================================================*/

#Properties

#Title

#Breadcrumbs

#}

{% set padding = padding ?? true %}
{% set container = container ?? true %}

{% if container %}
    <div class="container">
{% endif %}
        <section class="ep-page-header page-header {% if padding %}py-4{% endif %} text-center {{ page_header_class }}" data-store="page-title">
            {# Breadcrumbs #}
            {% include 'snipplets/breadcrumbs.tpl' %}

            {# Título da página #}
            <h1 class="ep-page-title {% if template == 'product' %}h2{% else %}h4{% endif %} {{ page_header_title_class }}" {% if template == "product" %}data-store="product-name-{{ product.id }}"{% endif %}>
                {% block page_header_text %}{% endblock %}
            </h1>

            {# Linha decorativa #}
            <div class="ep-title-decoration mx-auto mt-3"></div>
        </section>
{% if container %}
    </div>
{% endif %}
