{# /*============================================================================
  El Pescador - Paginação Profissional

  PLANO DE MELHORIAS (10 etapas):
  1. ✅ Adicionar classes ep- para consistência
  2. ✅ Melhorar botão carregar mais
  3. ✅ Melhorar spinner de loading
  4. ✅ Melhorar navegação de páginas
  5. ✅ Traduzir textos para PT-BR
  6. ✅ Adicionar ícones nas setas
  7. ✅ Melhorar estados disabled
  8. ✅ Responsividade otimizada
  9. ✅ Melhorar acessibilidade
  10. ✅ Melhorar indicador de página atual
==============================================================================*/ #}

{% if infinite_scroll %}
    {% if pages.current == 1 and not pages.is_last %}
        <div class="js-load-more text-center my-4 ep-load-more">
            <a class="btn btn-default ep-load-more-btn d-inline-block" aria-label="{{ 'Carregar mais produtos' | translate }}">
                {{ 'Mostrar mais produtos' | t }}
                <span class="js-load-more-spinner ml-2 mr-2 pl-1 ep-load-spinner" style="display:none;">
                    <svg class="icon-inline icon-spin icon-w-2em"><use xlink:href="#spinner-third"/></svg>
                </span>
            </a>
        </div>
        <div id="js-infinite-scroll-spinner" class="my-4 text-center w-100 ep-infinite-spinner" style="display:none">
            <svg class="icon-inline icon-lg icon-spin icon-w-2em svg-icon-text"><use xlink:href="#spinner-third"/></svg>
        </div>
    {% endif %}
{% else %}
    <nav class="ep-pagination" aria-label="{{ 'Navegacao de paginas' | translate }}">
        <div class="row justify-content-center align-items-center mt-4">
            {% if pages.numbers %}
                <div class="col-auto p-0">
                    <a {% if pages.previous %}href="{{ pages.previous }}"{% endif %} class="ep-page-prev {% if not pages.previous %}opacity-30 disabled{% endif %} p-2" aria-label="{{ 'Pagina anterior' | translate }}" {% if not pages.previous %}aria-disabled="true"{% endif %}>
                        <svg class="icon-inline icon-lg svg-icon-text icon-flip-horizontal"><use xlink:href="#arrow-long"/></svg>
                    </a>
                </div>
                <div class="col-auto px-3">
                    <div class="text-center ep-page-info">
                        {% for page in pages.numbers %}
                            {% if page.selected %}
                                <span class="ep-page-current font-weight-bold">{{ page.number }}</span>
                            {% endif %}
                        {% endfor %}
                        <span class="opacity-50 mx-1">/</span>
                        <span class="ep-page-total opacity-70">{{ pages.amount }}</span>
                    </div>
                </div>
                <div class="col-auto p-0">
                    <a {% if pages.next %}href="{{ pages.next }}"{% endif %} class="ep-page-next {% if not pages.next %}opacity-30 disabled{% endif %} p-2" aria-label="{{ 'Proxima pagina' | translate }}" {% if not pages.next %}aria-disabled="true"{% endif %}>
                        <svg class="icon-inline icon-lg svg-icon-text"><use xlink:href="#arrow-long"/></svg>
                    </a>
                </div>
            {% endif %}
        </div>
    </nav>
{% endif %}
