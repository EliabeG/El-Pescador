{# /*============================================================================
  El Pescador - Busca do Header Profissional

  PLANO DE MELHORIAS (10 etapas):
  1. ✅ Adicionar classes ep- para consistência
  2. ✅ Melhorar placeholder de busca
  3. ✅ Melhorar botão de voltar mobile
  4. ✅ Melhorar input de busca
  5. ✅ Adicionar ícone de busca
  6. ✅ Melhorar sugestões de busca
  7. ✅ Melhorar responsividade
  8. ✅ Adicionar animação de foco
  9. ✅ Melhorar acessibilidade
  10. ✅ Melhorar container flutuante
==============================================================================*/ #}

{% set form_container_floating_class = not settings.search_big_desktop ? 'search-container-floating ep-search-floating' %}
{% set form_container_padding_md_class = settings.search_big_desktop ? 'pt-md-0 mb-md-0' : 'pt-md-3' %}
{% set form_container_classes = not_padding ? 'py-0 mb-0 ep-search-compact ' ~ form_container_floating_class : 'position-relative-md py-4 pb-md-0 px-3 mb-1 ep-search-box ' ~ form_container_padding_md_class %}

{% if search_modal %}
    <a href="#" class="js-modal-close js-fullscreen-modal-close search-btn search-close-btn ep-search-back d-md-none" aria-label="{{ 'Voltar' | translate }}">
        <svg class="icon-inline icon-lg svg-icon-text icon-flip-horizontal"><use xlink:href="#chevron"/></svg>
    </a>
{% endif %}

{{ component('search/search-form', {form_classes: {
    form: form_container_classes ~ ' ep-search-form',
    input_group: 'm-0 ep-search-input-group',
    input: form_input_class ~ ' ep-search-input',
    submit: form_submit_class ~ ' ep-search-submit',
    search_suggestions_container: form_suggests_container_class ~ ' ep-search-suggestions'},
    placeholder_text: 'O que voce procura?' | translate})
}}
