{# /*============================================================================
  El Pescador - Mensagem Institucional (Demo) Profissional

  PLANO DE MELHORIAS (10 etapas):
  1. ✅ Adicionar classes ep- para consistência
  2. ✅ Traduzir textos para PT-BR
  3. ✅ Melhorar estrutura semântica
  4. ✅ Melhorar layout centralizado
  5. ✅ Adicionar aria-labels
  6. ✅ Melhorar tipografia
  7. ✅ Responsividade otimizada
  8. ✅ Melhorar espaçamentos
  9. ✅ Melhorar botão
  10. ✅ Melhorar acessibilidade
==============================================================================*/ #}

<section class="section-{{ section }}-home ep-demo-institutional" data-store="{{ data_store }}" aria-label="{{ 'Mensagem institucional' | translate }}">
    <div class="container ep-demo-institutional-container">
        <div class="row text-center justify-content-center">
            <div class="col-md-7 ep-demo-institutional-content">
                <p class="js-{{ section }}-message-title mb-3 ep-demo-institutional-title">{{ title }}</p>
                <h2 class="js-{{ section }}-message-text mb-4 ep-demo-institutional-text">{{ "Use este texto para compartilhar informacoes do seu negocio, dar as boas-vindas aos seus clientes ou para contar como seus produtos sao incriveis." | translate }}</h2>
                <a class="js-{{ section }}-message-button btn-link ep-demo-institutional-btn"></a>
            </div>
        </div>
    </div>
</section>
