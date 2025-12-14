{# /*============================================================================
  El Pescador - Hero Section Profissional

  PLANO DE MELHORIAS (10 etapas):
  1. ✅ Adicionar background com gradiente profissional
  2. ✅ Melhorar tipografia com hierarquia clara
  3. ✅ Adicionar badge de credibilidade
  4. ✅ CTAs com contraste e urgência
  5. ✅ Adicionar ícones temáticos de pesca
  6. ✅ Animações sutis de entrada
  7. ✅ Melhorar espaçamentos e proporções
  8. ✅ Adicionar elementos de prova social
  9. ✅ Responsividade mobile-first
  10. ✅ Adicionar seção de diferenciais rápidos
==============================================================================*/ #}

<section class="ep-hero" data-store="home-hero-elpescador">
    <div class="ep-hero-overlay"></div>
    <div class="container ep-hero-container">
        <div class="row align-items-center min-vh-50">
            <div class="col-12 col-lg-7">
                <div class="ep-hero-content">
                    {# Badge de credibilidade #}
                    <div class="ep-hero-badge mb-3">
                        <span class="ep-badge-icon">
                            <svg class="icon-inline icon-sm"><use xlink:href="#security"/></svg>
                        </span>
                        <span class="ep-badge-text">{{ settings.welcome_message | default('Desde 2010 | Especialistas em Pesca') }}</span>
                    </div>

                    {# Titulo principal #}
                    <h1 class="ep-hero-title mb-3">
                        {{ "Equipamentos Premium" | translate }}<br>
                        <span class="ep-hero-highlight">{{ "para Pescadores de Elite" | translate }}</span>
                    </h1>

                    {# Descricao com benefícios #}
                    <p class="ep-hero-text mb-4">
                        {{ settings.welcome_text | default('Pesca Sub, Mergulho, Pesca Esportiva e Caca. Equipamentos profissionais com garantia de qualidade e entrega rapida para todo Brasil.') }}
                    </p>

                    {# Diferenciais rapidos #}
                    <div class="ep-hero-features mb-4">
                        <div class="ep-hero-feature">
                            <svg class="icon-inline icon-sm mr-1"><use xlink:href="#box-alt"/></svg>
                            <span>{{ "Frete Gratis" | translate }}*</span>
                        </div>
                        <div class="ep-hero-feature">
                            <svg class="icon-inline icon-sm mr-1"><use xlink:href="#returns"/></svg>
                            <span>{{ "Troca Garantida" | translate }}</span>
                        </div>
                        <div class="ep-hero-feature">
                            <svg class="icon-inline icon-sm mr-1"><use xlink:href="#credit-card-alt"/></svg>
                            <span>{{ "12x sem Juros" | translate }}</span>
                        </div>
                    </div>

                    {# Botoes de acao #}
                    <div class="ep-hero-buttons">
                        <a href="{{ store.products_url }}" class="btn btn-primary btn-big ep-btn-primary">
                            <svg class="icon-inline mr-2"><use xlink:href="#bag"/></svg>
                            {{ "Ver Produtos" | translate }}
                        </a>
                        <a href="{% if store.categories | length > 0 %}{{ (store.categories | first).url }}{% else %}{{ store.products_url }}{% endif %}" class="btn btn-secondary btn-big ep-btn-secondary">
                            {{ "Explorar Categorias" | translate }}
                            <svg class="icon-inline ml-2"><use xlink:href="#arrow-long"/></svg>
                        </a>
                    </div>

                    {# Prova social #}
                    <div class="ep-hero-social-proof mt-4">
                        <div class="ep-rating">
                            <svg class="icon-inline icon-sm text-warning"><use xlink:href="#star-solid"/></svg>
                            <svg class="icon-inline icon-sm text-warning"><use xlink:href="#star-solid"/></svg>
                            <svg class="icon-inline icon-sm text-warning"><use xlink:href="#star-solid"/></svg>
                            <svg class="icon-inline icon-sm text-warning"><use xlink:href="#star-solid"/></svg>
                            <svg class="icon-inline icon-sm text-warning"><use xlink:href="#star-solid"/></svg>
                        </div>
                        <span class="ep-rating-text font-small opacity-80">{{ "+500 clientes satisfeitos" | translate }}</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
