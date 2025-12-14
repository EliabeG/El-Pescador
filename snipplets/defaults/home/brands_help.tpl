{# /*============================================================================
  El Pescador - Marcas (Demo) Profissional

  PLANO DE MELHORIAS (10 etapas):
  1. ✅ Adicionar classes ep- para consistência
  2. ✅ Traduzir textos para PT-BR
  3. ✅ Melhorar estrutura semântica
  4. ✅ Melhorar grid de marcas
  5. ✅ Adicionar aria-labels
  6. ✅ Melhorar overlay
  7. ✅ Responsividade otimizada
  8. ✅ Melhorar espaçamentos
  9. ✅ Melhorar ícones
  10. ✅ Melhorar acessibilidade
==============================================================================*/ #}

{% set brand_logo_view_box = '0 0 576 512' %}

<section class="section-brands-home overflow-none position-relative ep-demo-brands" data-store="home-brands" aria-label="{{ 'Nossas marcas' | translate }}">
    <div class="container ep-demo-brands-container">
        <h2 class="h3 mt-3 mb-4 text-center ep-demo-brands-title">{{ 'Marcas' | translate }}</h2>
        <div class="row mb-2 align-items-center ep-demo-brands-grid">
            <div class="col-md-2 col-4 mb-4 text-center ep-demo-brand-item">
                <svg class="icon-inline icon-4x brand-image svg-icon-text opacity-50 ep-demo-brand-logo" viewBox="{{ brand_logo_view_box }}" aria-hidden="true"><use xlink:href="#help-logo"/></svg>
            </div>
            <div class="col-md-2 col-4 mb-4 text-center ep-demo-brand-item">
                <svg class="icon-inline icon-4x brand-image svg-icon-text opacity-50 ep-demo-brand-logo" viewBox="{{ brand_logo_view_box }}" aria-hidden="true"><use xlink:href="#help-logo"/></svg>
            </div>
            <div class="col-md-2 col-4 mb-4 text-center ep-demo-brand-item">
                <svg class="icon-inline icon-4x brand-image svg-icon-text opacity-50 ep-demo-brand-logo" viewBox="{{ brand_logo_view_box }}" aria-hidden="true"><use xlink:href="#help-logo"/></svg>
            </div>
            <div class="col-md-2 col-4 mb-4 text-center ep-demo-brand-item">
                <svg class="icon-inline icon-4x brand-image svg-icon-text opacity-50 ep-demo-brand-logo" viewBox="{{ brand_logo_view_box }}" aria-hidden="true"><use xlink:href="#help-logo"/></svg>
            </div>
            <div class="col-md-2 col-4 mb-4 text-center ep-demo-brand-item">
                <svg class="icon-inline icon-4x brand-image svg-icon-text opacity-50 ep-demo-brand-logo" viewBox="{{ brand_logo_view_box }}" aria-hidden="true"><use xlink:href="#help-logo"/></svg>
            </div>
            <div class="col-md-2 col-4 mb-4 text-center ep-demo-brand-item">
                <svg class="icon-inline icon-4x brand-image svg-icon-text opacity-50 ep-demo-brand-logo" viewBox="{{ brand_logo_view_box }}" aria-hidden="true"><use xlink:href="#help-logo"/></svg>
            </div>
        </div>
        <div class="placeholder-overlay placeholder-slider transition-soft ep-demo-overlay">
            <div class="placeholder-info p-2 ep-demo-info">
                <svg class="icon-inline icon-2x" aria-hidden="true"><use xlink:href="#edit"/></svg>
                <div class="placeholder-description font-small-xs ep-demo-description">
                    {{ "Voce pode subir logos das suas marcas em" | translate }} <br><strong>"{{ "Marcas" | translate }}"</strong>
                </div>
                {% if not params.preview %}
                    <a href="{{ admin_link }}#instatheme=pagina-de-inicio" class="btn-primary btn btn-small placeholder-button ep-demo-edit-btn">{{ "Editar" | translate }}</a>
                {% endif %}
            </div>
        </div>
    </div>
</section>
