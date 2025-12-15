{#/*============================================================================
    El Pescador - Loja de Pesca
    Arquivo: layout.tpl
    Descrição: Template principal que define a estrutura HTML base da loja

    ÍNDICE:
    ============================================================================
    1. DOCTYPE e Cabeçalho HTML
       - Atributos de namespaces (XHTML, Facebook, OpenGraph)
       - Detecção de idioma ativo

    2. Meta Tags e SEO
       - Charset e compatibilidade
       - Viewport responsivo
       - Título e descrição da página

    3. Resource Hints (Otimização de Performance)
       - Preconnect para recursos externos
       - DNS-prefetch para domínios críticos

    4. Carregamento de Fontes (Google Fonts)
       - Oswald: Títulos e destaques
       - Open Sans: Corpo de texto

    5. CSS Crítico (Above-the-fold)
       - Tokens de design
       - Estilos críticos inline
       - Cores do tema

    6. CSS Assíncrono (Below-the-fold)
       - Estilos carregados de forma não-bloqueante

    7. CSS Customizado El Pescador
       - Paleta: Navy Blue (#1B3A57) + Laranja (#E67E22) + Cinza (#F5F7FA)
       - Estilos específicos da marca

    8. JavaScript Pré-HTML
       - jQuery condicional
       - Scripts da plataforma

    9. Corpo da Página (Body)
       - Ícones SVG
       - Header (cabeçalho)
       - Conteúdo do template
       - Footer (rodapé)

    10. JavaScript Pós-HTML
        - Bibliotecas externas
        - Scripts da loja
        - Códigos de rastreamento
    ============================================================================
*/#}
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:fb="http://www.facebook.com/2008/fbml" xmlns:og="http://opengraphprotocol.org/schema/" lang="{% for language in languages %}{% if language.active %}{{ language.lang }}{% endif %}{% endfor %}">
    <head>
        {#/*============================================================================
            Seção 3: Resource Hints - Otimização de Performance
            - Preconnect: Estabelece conexão antecipada com domínios externos
            - DNS-prefetch: Resolve DNS antecipadamente para carregamento mais rápido
        ==============================================================================*/#}

        <link rel="preconnect" href="{{ store_resource_hints }}" />
        <link rel="dns-prefetch" href="{{ store_resource_hints }}" />
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />

        {#/*============================================================================
            Seção 2: Meta Tags e SEO
            - Charset UTF-8 para suporte a caracteres especiais (acentos PT-BR)
            - Compatibilidade com navegadores IE/Edge
            - Viewport para design responsivo
            - Título e descrição para SEO
        ==============================================================================*/#}

        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <meta name="theme-color" content="#1B3A57" />
        <title>{{ page_title }}</title>
        <meta name="description" content="{{ page_description }}" />

        {#/*============================================================================
            Configuração de Fontes Itálicas
            - Detecta se alguma seção da home usa texto em itálico
            - Carrega peso adicional de fonte conforme necessário
        ==============================================================================*/#}

        {% set welcome_italic_font = settings.welcome_text and settings.welcome_italic %}
        {% set institutional_italic_font = settings.institutional_text and settings.institutional_italic %}
        {% set testimonial_italic_font = settings.testimonials_italic %}

        {% set italic_font = params.preview or (not params.preview and template == 'home' and welcome_italic_font or institutional_italic_font or testimonial_italic_font) %}
        {% set google_fonts_weights = italic_font ? '400,400italic,700' : '400,700' %}

        {#/*============================================================================
            Seção 4: Carregamento de Fontes - Google Fonts
            - Oswald: Fonte para títulos (pesos 400, 500, 700)
            - Open Sans: Fonte para corpo de texto (pesos 400, 600, 700)
            - font-display: swap para evitar FOIT (Flash of Invisible Text)
        ==============================================================================*/#}

        <link rel="preload" as="style" href="https://fonts.googleapis.com/css2?family=Oswald:wght@400;500;700&family=Open+Sans:wght@400;600;700&display=swap" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Oswald:wght@400;500;700&family=Open+Sans:wght@400;600;700&display=swap" />
        <link rel="preload" href="{{ 'css/style-critical.scss' | static_url }}" as="style" />
        <link rel="preload" href="{{ 'css/style-colors.scss' | static_url }}" as="style" />

        {#/*============================================================================
            Preload de Imagens LCP (Largest Contentful Paint)
            - Pré-carrega imagens principais das páginas home, categoria e produto
            - Melhora a métrica LCP do Core Web Vitals
        ==============================================================================*/#}

        {% snipplet 'preload-images.tpl' %}

        {#/*============================================================================
            Componente de Meta Tags Sociais
            - Open Graph (Facebook, LinkedIn)
            - Twitter Cards
            - Compartilhamento em redes sociais
        ==============================================================================*/#}

        {{ component('social-meta') }}

        {#/*============================================================================
            Seção 5: CSS Crítico e Fontes
            - Estilos necessários para renderizar elementos acima da dobra
            - Carregados inline para evitar bloqueio de renderização
        ==============================================================================*/#}

        <style>
            {#/*----------------------------------------------------------------
                Definição de Font-Faces - El Pescador
                - Oswald: Fonte display para títulos
                - Open Sans: Fonte sans-serif para texto
                - font-display: swap garante texto visível durante carregamento
            ----------------------------------------------------------------*/#}

            @font-face {
                font-family: 'Oswald';
                font-style: normal;
                font-weight: 400;
                font-display: swap;
            }
            @font-face {
                font-family: 'Open Sans';
                font-style: normal;
                font-weight: 400;
                font-display: swap;
            }

            {#/*----------------------------------------------------------------
                Tokens de Design CSS
                - Variáveis CSS globais (cores, espaçamentos, tipografia)
                - Importados do arquivo style-tokens.tpl
            ----------------------------------------------------------------*/#}

            {% include "static/css/style-tokens.tpl" %}

        </style>

        {#/*============================================================================
            CSS Crítico Inline
            - Estilos essenciais para o primeiro carregamento (above-the-fold)
            - Minimiza o tempo até First Contentful Paint (FCP)
        ==============================================================================*/#}

        {{ 'css/style-critical.scss' | static_url | static_inline }}

        {#/*============================================================================
            Cores e Fontes do Tema
            - Variáveis definidas no settings.txt
            - Personalizadas pelo admin na customização do tema
        ==============================================================================*/#}

        {{ 'css/style-colors.scss' | static_url | static_inline }}

        {#/*============================================================================
            Seção 6: CSS Assíncrono (Below-the-fold)
            - Carregado de forma não-bloqueante usando técnica de preload
            - media="print" + onload converte para media="all" após carregamento
            - Melhora performance percebida
        ==============================================================================*/#}

        <link rel="stylesheet" href="{{ 'css/style-async.scss' | static_url }}" media="print" onload="this.media='all'">

        {#/*============================================================================
            CSS Customizado El Pescador - Arquivo Externo
            - Estilos específicos da marca em arquivo separado
            - Mantém organização e facilita manutenção
        ==============================================================================*/#}

        {{ 'css/elpescador-custom.css' | static_url | css_tag }}

        {#/*============================================================================
            CSS Personalizado do Administrador
            - Código CSS adicionado via Configurações Avançadas no painel admin
            - Permite customizações sem editar arquivos do tema
        ==============================================================================*/#}

        <style>
            {{ settings.css_code | raw }}
        </style>

        {#/*============================================================================
            Seção 7: CSS Override El Pescador
            Nova Identidade Visual - Tema Natureza/Pesca

            ÍNDICE DE SEÇÕES CSS:
            ============================================================================
            1. VARIÁVEIS CSS (:root)
               - Cores da plataforma (--main-*, --button-*, etc.)
               - Cores El Pescador (--ep-navy, --ep-orange, etc.)

            2. FONTES GLOBAIS
               - Body: Open Sans
               - Headings: Oswald

            3. BARRA DE ANÚNCIOS (AdBar)
               - Fundo Navy Blue
               - Texto branco

            4. CABEÇALHO (Header)
               - Fundo Navy Blue
               - Campo de busca translúcido
               - Contador do carrinho

            5. NAVEGAÇÃO
               - Desktop: Menu horizontal
               - Mobile: Menu hamburger modal

            6. HERO / SLIDER / WELCOME
               - Gradiente Navy Blue
               - Overlay suave
               - CTAs em laranja

            7. SEÇÃO DE SERVIÇOS
               - Fundo branco
               - Ícones Navy Blue

            8. CARDS DE PRODUTOS
               - Layout flexbox
               - Imagem quadrada (aspect-ratio 1:1)
               - Preço em Navy Blue
               - Botão comprar em laranja

            9. ESPAÇAMENTO
               - Padding de seções
               - Gap do grid

            10. TÍTULOS DE SEÇÃO
                - Fonte Oswald
                - Linha decorativa laranja

            11. CATEGORIAS
                - Cards com borda

            12. BOTÕES GERAIS
                - Primário: Laranja
                - Secundário: Outline Navy

            13. DEPOIMENTOS
                - Estrelas douradas
                - Avatar circular

            14. NEWSLETTER
                - Fundo Navy Blue
                - Input + botão inline

            15. RODAPÉ (Footer)
                - Fundo Navy Blue
                - Rodapé inferior mais escuro

            16. ELEMENTOS GERAIS
                - Links, breadcrumb
                - WhatsApp, modal

            17. SWIPER / CARROSSEL
                - Navegação e paginação

            18. OVERRIDES AGRESSIVOS
                - Remoção de cores conflitantes
                - Forçar paleta El Pescador

            19. GRID RESPONSIVO
                - Desktop: 3 colunas
                - Tablet: 2 colunas
                - Mobile: 1 coluna

            20. ACESSIBILIDADE
                - Focus visible
                - Reduced motion
            ============================================================================
        */#}

        <style>
            @import url('https://fonts.googleapis.com/css2?family=Oswald:wght@400;500;700&family=Open+Sans:wght@400;600;700&display=swap');

            /* ============================================
               1. VARIÁVEIS CSS - El Pescador
               Paleta: Branco + Navy Blue (#1B3A57) + Laranja (#E67E22)
               Atualiza variáveis da plataforma Nuvemshop
            ============================================ */

            :root {
                --main-foreground: #2C3E50 !important;
                --main-background: #F5F7FA !important;
                --accent-color: #E67E22 !important;
                --button-background: #E67E22 !important;
                --button-foreground: #FFFFFF !important;
                --label-background: #E74C3C !important;
                --label-foreground: #FFFFFF !important;
                --adbar-background: #1B3A57 !important;
                --adbar-foreground: #FFFFFF !important;
                --header-background: #1B3A57 !important;
                --header-foreground: #FFFFFF !important;
                --footer-background: #1B3A57 !important;
                --footer-foreground: #FFFFFF !important;
                --newsletter-background: #1B3A57 !important;
                --newsletter-foreground: #FFFFFF !important;
                --services-background: #FFFFFF !important;
                --services-foreground: #2C3E50 !important;
                --heading-font: "Oswald", sans-serif !important;
                --body-font: "Open Sans", sans-serif !important;

                /* Variáveis Customizadas El Pescador */
                --ep-navy: #1B3A57;          /* Azul marinho principal */
                --ep-navy-dark: #152D45;     /* Azul marinho escuro (footer bottom) */
                --ep-orange: #E67E22;        /* Laranja principal (CTAs) */
                --ep-orange-dark: #D35400;   /* Laranja escuro (hover) */
                --ep-gray-light: #F5F7FA;    /* Cinza claro (fundo) */
                --ep-gray: #95A5A6;          /* Cinza médio (textos secundários) */
                --ep-text: #2C3E50;          /* Cor do texto principal */
                --ep-white: #FFFFFF;         /* Branco */

                /* Transições e animações */
                --ep-transition: 0.3s ease;
            }

            /* ============================================
               2. FONTES GLOBAIS
               Oswald para títulos, Open Sans para corpo
            ============================================ */

            body {
                font-family: "Open Sans", sans-serif !important;
                color: #2C3E50 !important;
                background-color: #F5F7FA !important;
            }

            h1, h2, h3, h4, h5, h6,
            .h1, .h2, .h3, .h4, .h5, .h6 {
                font-family: "Oswald", sans-serif !important;
                color: #2C3E50 !important;
            }

            /* ============================================
               3. BARRA DE ANÚNCIOS (AdBar)
               Fundo Navy Blue com texto branco
               Hover em laranja para links
            ============================================ */

            .section-adbar {
                background-color: #1B3A57 !important;
            }

            .section-adbar,
            .section-adbar a,
            .section-adbar span,
            .section-adbar .svg-icon-text,
            .section-adbar .swiper-button-prev,
            .section-adbar .swiper-button-next {
                color: #FFFFFF !important;
                fill: #FFFFFF !important;
            }

            .section-adbar a:hover {
                color: #E67E22 !important;
            }

            /* ============================================
               4. CABEÇALHO (Header)
               Fundo Navy Blue com elementos brancos
               Campo de busca translúcido
               Contador do carrinho em laranja
            ============================================ */

            .head-main {
                background-color: #1B3A57 !important;
            }

            .head-main,
            .head-main a,
            .head-main .svg-icon-text {
                color: #FFFFFF !important;
                fill: #FFFFFF !important;
            }

            .head-main a:hover,
            .head-main .svg-icon-text:hover {
                color: #E67E22 !important;
                fill: #E67E22 !important;
            }

            .head-main .form-control {
                background-color: rgba(255,255,255,0.1) !important;
                border: 1px solid rgba(255,255,255,0.3) !important;
                color: #FFFFFF !important;
            }

            .head-main .form-control::placeholder {
                color: rgba(255,255,255,0.6) !important;
            }

            .head-main .js-cart-widget-amount {
                background-color: #E67E22 !important;
                color: #FFFFFF !important;
            }

            /* ============================================
               5. NAVEGAÇÃO
               Desktop: Menu horizontal Navy Blue
               Mobile: Modal hamburger
               Dropdown com hover laranja
            ============================================ */

            .desktop-nav-col,
            .nav-desktop {
                background-color: #1B3A57 !important;
            }

            .nav-desktop-list a {
                color: #FFFFFF !important;
                font-family: "Oswald", sans-serif !important;
            }

            .nav-desktop-list a:hover {
                color: #E67E22 !important;
            }

            .nav-desktop-list .nav-item.active > a {
                color: #E67E22 !important;
            }

            .nav-desktop-list .dropdown-menu {
                background-color: #1B3A57 !important;
                border-color: rgba(255,255,255,0.2) !important;
            }

            .nav-desktop-list .dropdown-item {
                color: #FFFFFF !important;
            }

            .nav-desktop-list .dropdown-item:hover {
                background-color: rgba(230,126,34,0.2) !important;
                color: #E67E22 !important;
            }

            .nav-hamburger-list a {
                color: #FFFFFF !important;
            }

            .js-modal-nav .modal-content {
                background-color: #1B3A57 !important;
            }

            /* ============================================
               6. HERO / SLIDER / WELCOME
               Gradiente Navy Blue (#1B3A57 → #2C5282)
               Overlay suave para legibilidade
               Botões CTA em laranja
            ============================================ */

            /* Gradiente de fundo Navy Blue */
            .section-slider,
            .section-slider-home,
            .section-welcome,
            .section-welcome-home {
                background: linear-gradient(135deg, #1B3A57 0%, #2C5282 50%, #1B3A57 100%) !important;
                position: relative !important;
                padding: 60px 0 !important;
            }

            /* Overlay escuro para melhor contraste do texto */
            .section-slider::before,
            .section-slider-home::before,
            .section-welcome::before,
            .section-welcome-home::before {
                content: '' !important;
                position: absolute !important;
                top: 0 !important;
                left: 0 !important;
                right: 0 !important;
                bottom: 0 !important;
                background: rgba(27,58,87,0.4) !important;
                z-index: 1 !important;
            }

            /* Z-index elevado para conteúdo acima do overlay */
            .section-slider .container,
            .section-slider-home .container,
            .section-welcome .container,
            .section-welcome-home .container {
                position: relative !important;
                z-index: 2 !important;
            }

            /* Tipografia do Hero - Texto branco com sombra sutil */
            .section-slider,
            .section-slider h1,
            .section-slider h2,
            .section-slider h3,
            .section-slider p,
            .section-welcome,
            .section-welcome h1,
            .section-welcome h2,
            .section-welcome h3,
            .section-welcome p,
            .section-welcome-home,
            .section-welcome-home h1,
            .section-welcome-home h2,
            .section-welcome-home h3,
            .section-welcome-home p,
            .section-welcome-home .js-welcome-message-text,
            .section-welcome-home .js-welcome-message-button {
                color: #FFFFFF !important;
                text-shadow: 0 1px 3px rgba(0,0,0,0.2) !important;
            }

            /* Título principal do Hero - Grande e impactante */
            .section-welcome-home h2,
            .section-welcome h2,
            .section-slider h1 {
                font-size: 42px !important;
                font-weight: 700 !important;
                margin-bottom: 15px !important;
                line-height: 1.2 !important;
            }

            /* Subtítulo em laranja com tracking espaçado */
            .section-slider .subtitle,
            .section-welcome .h5,
            .section-welcome h5,
            .section-welcome-home .js-welcome-message-title {
                color: #E67E22 !important;
                font-size: 16px !important;
                letter-spacing: 2px !important;
                text-transform: uppercase !important;
                text-shadow: none !important;
                font-weight: 600 !important;
            }

            /* Botões CTA primários do Hero - Laranja sólido */
            .section-slider .btn-primary,
            .section-welcome .btn-primary,
            .section-welcome-home .btn-primary {
                background-color: #E67E22 !important;
                color: #FFFFFF !important;
                border: none !important;
                padding: 14px 35px !important;
                font-size: 15px !important;
                border-radius: 5px !important;
                text-shadow: none !important;
                margin: 8px !important;
                font-weight: 600 !important;
            }

            .section-slider .btn-primary:hover,
            .section-welcome .btn-primary:hover,
            .section-welcome-home .btn-primary:hover {
                background-color: #D35400 !important;
                transform: translateY(-2px) !important;
                box-shadow: 0 4px 15px rgba(230,126,34,0.4) !important;
            }

            .section-slider .btn-secondary,
            .section-welcome .btn-secondary,
            .section-welcome-home .btn-secondary,
            .section-welcome-home .btn-link {
                background: transparent !important;
                color: #FFFFFF !important;
                border: 2px solid #FFFFFF !important;
                padding: 12px 33px !important;
                border-radius: 5px !important;
                text-shadow: none !important;
                margin: 8px !important;
            }

            .section-slider .btn-secondary:hover,
            .section-welcome .btn-secondary:hover,
            .section-welcome-home .btn-secondary:hover,
            .section-welcome-home .btn-link:hover {
                background: #FFFFFF !important;
                color: #1B3A57 !important;
            }

            /* ============================================
               7. SEÇÃO DE SERVIÇOS / BANNERS INFORMATIVOS
               Fundo branco com bordas sutis
               Ícones Navy Blue em círculo cinza
            ============================================ */

            .section-informative-banners,
            .section-informative-banners-colors {
                background-color: #FFFFFF !important;
                border-top: 1px solid #E8E8E8 !important;
                border-bottom: 1px solid #E8E8E8 !important;
            }

            .section-informative-banners h3,
            .section-informative-banners h4,
            .section-informative-banners p,
            .section-informative-banners-colors h3,
            .section-informative-banners-colors h4,
            .section-informative-banners-colors p {
                color: #2C3E50 !important;
            }

            .section-informative-banners .svg-icon-text,
            .section-informative-banners-colors .svg-icon-text {
                fill: #1B3A57 !important;
                color: #1B3A57 !important;
            }

            /* Container de ícones - Círculo cinza claro */
            .section-informative-banners .service-icon-container,
            .section-informative-banners .banner-service-icon {
                background-color: #F5F7FA !important;
                border-radius: 50% !important;
                padding: 15px !important;
            }

            /* ============================================
               8. CARDS DE PRODUTOS
               Layout flexbox para alinhamento vertical
               Imagem quadrada (aspect-ratio 1:1)
               Preço Navy Blue, botão laranja
            ============================================ */

            /* Card de produto - Container flexbox */
            .item-product {
                display: flex !important;
                flex-direction: column !important;
                height: 100% !important;
                background: #FFFFFF !important;
                border-radius: 8px !important;
                overflow: hidden !important;
                box-shadow: 0 2px 8px rgba(0,0,0,0.06) !important;
                transition: box-shadow 0.3s ease, transform 0.3s ease !important;
                border: 1px solid #E8E8E8 !important;
            }

            .item-product:hover {
                box-shadow: 0 8px 25px rgba(0,0,0,0.1) !important;
                transform: translateY(-3px) !important;
            }

            /* Container da imagem - Proporção 1:1 (quadrado) */
            .item-product .item-image,
            .item-product .product-image-container,
            .item-product > a:first-child {
                aspect-ratio: 1 / 1 !important;
                width: 100% !important;
                overflow: hidden !important;
                position: relative !important;
                background: #FFFFFF !important;
            }

            /* Imagem centralizada com object-fit: contain */
            .item-product .item-image img,
            .item-product .img-fluid,
            .item-product picture img {
                width: 100% !important;
                height: 100% !important;
                object-fit: contain !important;
                object-position: center !important;
                background: #FFFFFF !important;
                padding: 10px !important;
            }

            /* Área de informações do produto - Flexbox vertical */
            .item-product .item-info,
            .item-product .item-description {
                flex: 1 !important;
                display: flex !important;
                flex-direction: column !important;
                padding: 15px !important;
                text-align: left !important;
            }

            /* Nome do produto - Truncado em 2 linhas (line-clamp) */
            .item-product .item-name,
            .item-product .item-name a,
            .item-product h3,
            .item-product h3 a {
                font-family: "Open Sans", sans-serif !important;
                font-weight: 600 !important;
                color: #2C3E50 !important;
                font-size: 14px !important;
                text-transform: none !important;
                line-height: 1.4 !important;
                min-height: 40px !important;
                max-height: 40px !important;
                overflow: hidden !important;
                display: -webkit-box !important;
                -webkit-line-clamp: 2 !important;
                -webkit-box-orient: vertical !important;
                margin-bottom: 8px !important;
            }

            /* Preço atual - Navy Blue, fonte Oswald bold */
            .item-product .item-price,
            .item-product .js-price-display,
            .item-product .price,
            .js-product-price {
                color: #1B3A57 !important;
                font-family: "Oswald", sans-serif !important;
                font-weight: 700 !important;
                font-size: 22px !important;
                margin-top: auto !important;
                margin-bottom: 5px !important;
            }

            /* Preço comparativo (riscado) - Cinza */
            .item-product .price-compare,
            .item-product .js-compare-price-display {
                color: #95A5A6 !important;
                text-decoration: line-through !important;
                font-size: 13px !important;
                margin-bottom: 3px !important;
            }

            /* Badge de desconto - Laranja posicionado no canto superior */
            .item-product .label,
            .item-product .js-offer-label,
            .product-label,
            .label-offer {
                position: absolute !important;
                top: 10px !important;
                left: 10px !important;
                background-color: #E67E22 !important;
                color: #FFFFFF !important;
                font-family: "Oswald", sans-serif !important;
                font-weight: 700 !important;
                font-size: 12px !important;
                padding: 5px 12px !important;
                border-radius: 3px !important;
                text-transform: uppercase !important;
                z-index: 2 !important;
            }

            /* Botão Comprar/Adicionar ao carrinho - Laranja */
            .item-product .btn,
            .item-product .js-addtocart,
            .item-product .btn-product,
            .js-prod-submit-btn {
                background-color: #E67E22 !important;
                color: #FFFFFF !important;
                border: none !important;
                font-family: "Open Sans", sans-serif !important;
                font-weight: 600 !important;
                text-transform: none !important;
                font-size: 13px !important;
                padding: 10px 18px !important;
                border-radius: 5px !important;
                margin-top: 12px !important;
                transition: all 0.3s ease !important;
            }

            .item-product .btn:hover,
            .item-product .js-addtocart:hover {
                background-color: #D35400 !important;
                color: #FFFFFF !important;
            }

            /* Botão Ver Carrinho - Mantém laranja */
            .js-cart-widget .btn,
            .cart-btn,
            a[href*="cart"] .btn {
                background-color: #E67E22 !important;
                color: #FFFFFF !important;
            }

            /* ============================================
               9. ESPAÇAMENTO E LAYOUT
               Padding de seções e gap do grid
               Garante respiração visual adequada
            ============================================ */

            section,
            .section-featured-home,
            .section-categories,
            .section-main-categories,
            .section-banners-home {
                padding: 50px 0 !important;
                background-color: #F5F7FA !important;
            }

            .section-title,
            section > h2,
            .home-section-title {
                margin-bottom: 40px !important;
            }

            .row-grid,
            .products-grid,
            .js-products-featured-grid,
            .js-products-new-grid,
            .js-products-sale-grid {
                gap: 20px !important;
            }

            .container {
                padding-left: 15px !important;
                padding-right: 15px !important;
            }

            /* ============================================
               10. TÍTULOS DE SEÇÃO
               Fonte Oswald com linha decorativa laranja
               Centralizado com pseudo-elemento ::after
            ============================================ */

            .section-title,
            section > h2,
            .home-section-title {
                font-family: "Oswald", sans-serif !important;
                font-weight: 700 !important;
                text-transform: uppercase !important;
                color: #2C3E50 !important;
                font-size: 26px !important;
                letter-spacing: 1px !important;
                text-align: center !important;
                position: relative !important;
                padding-bottom: 15px !important;
            }

            /* Linha decorativa via ::after - Laranja 50px */
            .section-title::after,
            section > h2::after {
                content: '' !important;
                display: block !important;
                width: 50px !important;
                height: 3px !important;
                background: #E67E22 !important;
                margin: 12px auto 0 !important;
            }

            .section-title strong,
            .section-title span,
            .text-accent,
            .text-primary,
            .title-accent {
                color: #E67E22 !important;
            }

            /* ============================================
               11. CATEGORIAS
               Cards brancos com borda sutil
               Título em Oswald uppercase
            ============================================ */

            .section-categories,
            .section-main-categories {
                background-color: #F5F7FA !important;
            }

            .item-category,
            .category-card {
                text-align: center !important;
                background: #FFFFFF !important;
                border-radius: 8px !important;
                padding: 20px !important;
                border: 1px solid #E8E8E8 !important;
            }

            .item-category h3,
            .category-card h3,
            .category-name {
                font-family: "Oswald", sans-serif !important;
                font-weight: 500 !important;
                text-transform: uppercase !important;
                color: #2C3E50 !important;
                font-size: 14px !important;
            }

            /* ============================================
               12. BOTÕES GERAIS
               Primário: Fundo laranja, texto branco
               Secundário: Outline Navy Blue
            ============================================ */

            .btn-primary {
                background-color: #E67E22 !important;
                color: #FFFFFF !important;
                border-color: #E67E22 !important;
                font-family: "Open Sans", sans-serif !important;
                font-weight: 600 !important;
                text-transform: none !important;
                border-radius: 5px !important;
                padding: 12px 28px !important;
            }

            .btn-primary:hover,
            .btn-primary:focus {
                background-color: #D35400 !important;
                border-color: #D35400 !important;
                color: #FFFFFF !important;
            }

            .btn-secondary,
            .btn-outline-primary {
                background-color: transparent !important;
                border: 2px solid #1B3A57 !important;
                color: #1B3A57 !important;
                font-family: "Open Sans", sans-serif !important;
                font-weight: 600 !important;
                text-transform: none !important;
                border-radius: 5px !important;
                padding: 10px 26px !important;
            }

            .btn-secondary:hover,
            .btn-outline-primary:hover {
                background-color: #1B3A57 !important;
                color: #FFFFFF !important;
            }

            /* ============================================
               13. DEPOIMENTOS / TESTEMUNHOS
               Estrelas douradas via pseudo-elemento
               Avatar circular Navy Blue
            ============================================ */

            .section-testimonials-home {
                background-color: #FFFFFF !important;
            }

            .section-testimonials-home .testimonial-item,
            .testimonial-card {
                background: #F5F7FA !important;
                border-radius: 8px !important;
                padding: 25px !important;
                text-align: center !important;
            }

            /* Estrelas 5/5 via ::before - Dourado #F39C12 */
            .section-testimonials-home .testimonial-item::before,
            .testimonial-card::before {
                content: '★★★★★' !important;
                display: block !important;
                color: #F39C12 !important;
                font-size: 20px !important;
                margin-bottom: 15px !important;
                letter-spacing: 3px !important;
            }

            .section-testimonials-home .testimonial-text,
            .testimonial-card p {
                font-size: 16px !important;
                line-height: 1.6 !important;
                color: #2C3E50 !important;
                font-style: italic !important;
            }

            .section-testimonials-home .testimonial-author,
            .testimonial-card .author {
                font-weight: 700 !important;
                color: #1B3A57 !important;
                margin-top: 15px !important;
            }

            /* Avatar circular - Fundo Navy com inicial branca */
            .section-testimonials-home .testimonial-avatar,
            .testimonial-card .avatar {
                width: 60px !important;
                height: 60px !important;
                border-radius: 50% !important;
                margin: 0 auto 15px !important;
                background: #1B3A57 !important;
                display: flex !important;
                align-items: center !important;
                justify-content: center !important;
                color: #FFFFFF !important;
                font-size: 24px !important;
            }

            /* ============================================
               14. NEWSLETTER
               Fundo Navy Blue com formulário inline
               Input branco + botão laranja
            ============================================ */

            .section-newsletter-home,
            .section-newsletter-home-colors {
                background-color: #1B3A57 !important;
                padding: 40px 0 !important;
            }

            .section-newsletter-home h2,
            .section-newsletter-home-colors h2 {
                color: #FFFFFF !important;
                font-size: 22px !important;
                margin-bottom: 10px !important;
            }

            .section-newsletter-home p,
            .section-newsletter-home-colors p {
                color: rgba(255,255,255,0.8) !important;
                font-size: 14px !important;
            }

            .section-newsletter-home .form-control {
                border-radius: 5px 0 0 5px !important;
                border: none !important;
            }

            .section-newsletter-home .btn {
                background-color: #E67E22 !important;
                border-radius: 0 5px 5px 0 !important;
                border: none !important;
            }

            /* ============================================
               15. RODAPÉ (Footer)
               Fundo Navy Blue (#1B3A57)
               Rodapé inferior mais escuro (#152D45)
            ============================================ */

            footer,
            .js-footer {
                background-color: #1B3A57 !important;
            }

            footer,
            footer p,
            footer a,
            footer li {
                color: rgba(255,255,255,0.8) !important;
            }

            footer h4,
            footer .h4 {
                color: #FFFFFF !important;
                font-family: "Oswald", sans-serif !important;
                font-size: 16px !important;
                margin-bottom: 15px !important;
            }

            footer a:hover {
                color: #E67E22 !important;
            }

            /* Rodapé inferior (copyright) - Navy escuro */
            .footer-bottom,
            footer .copyright {
                background-color: #152D45 !important;
                border-top: 1px solid rgba(255,255,255,0.1) !important;
            }

            /* ============================================
               16. ELEMENTOS GERAIS
               Links, breadcrumb, WhatsApp
               Cores consistentes com a paleta
            ============================================ */

            .text-accent,
            .text-primary {
                color: #E67E22 !important;
            }

            .breadcrumb a {
                color: #1B3A57 !important;
            }

            .breadcrumb a:hover {
                color: #E67E22 !important;
            }

            .whatsapp-btn,
            .js-whatsapp-btn {
                background-color: #25D366 !important;
            }

            /* Modal - Header Navy Blue */

            .modal-header {
                background-color: #1B3A57 !important;
                color: #FFFFFF !important;
            }

            /* Links globais - Navy Blue com hover laranja */

            a {
                color: #1B3A57 !important;
            }

            a:hover {
                color: #E67E22 !important;
            }

            /* ============================================
               17. SWIPER / CARROSSEL
               Navegação Navy Blue
               Paginação bullet laranja quando ativo
            ============================================ */

            .swiper-button-prev,
            .swiper-button-next {
                color: #1B3A57 !important;
            }

            .swiper-pagination-bullet-active {
                background-color: #E67E22 !important;
            }

            /* ============================================
               18. OVERRIDES AGRESSIVOS
               Remove cores conflitantes do tema base
               Força paleta El Pescador em todos elementos
            ============================================ */

            /* Borda laranja em todos os botões */
            .btn,
            button,
            [class*="btn-"],
            .btn-link,
            .btn-primary,
            .btn-secondary,
            .btn-outline,
            .js-addtocart,
            .js-prod-submit-btn,
            a.btn {
                border-color: #E67E22 !important;
            }

            .btn-primary,
            .btn-primary:visited,
            .btn-primary:active,
            .btn-primary:focus,
            button[type="submit"],
            input[type="submit"],
            .js-addtocart,
            .js-prod-submit-btn {
                background-color: #E67E22 !important;
                border-color: #E67E22 !important;
                color: #FFFFFF !important;
            }

            .btn-primary:hover {
                background-color: #D35400 !important;
                border-color: #D35400 !important;
            }

            /* Botões secundários - Outline branco (usado em áreas Navy) */
            .btn-secondary,
            .btn-outline-primary,
            .btn-link,
            .section-welcome-home .btn-link,
            .section-welcome-home .btn-secondary {
                background-color: transparent !important;
                border: 2px solid #FFFFFF !important;
                color: #FFFFFF !important;
            }

            .btn-secondary:hover,
            .btn-outline-primary:hover,
            .btn-link:hover {
                background-color: #FFFFFF !important;
                color: #1B3A57 !important;
                border-color: #FFFFFF !important;
            }

            /* Títulos de seção - Destaque span em laranja */
            .section-title span,
            .home-section-title span,
            h2 span,
            .h2 span {
                color: #E67E22 !important;
            }

            /* Remove qualquer cor ciano/cyan conflitante */
            [style*="#00D4FF"],
            [style*="#00d4ff"],
            [style*="cyan"] {
                color: #E67E22 !important;
                border-color: #E67E22 !important;
                background-color: transparent !important;
            }

            /* ============================================
               19. GRID RESPONSIVO DE PRODUTOS
               Desktop: 3 colunas (33.333%)
               Tablet: 2 colunas (50%)
               Mobile: 1 coluna (100%)
            ============================================ */

            /* Grid container - Flexbox 3 colunas */
            .section-featured-home .row,
            .section-products-home .row,
            .js-products-featured-grid,
            .products-grid .row,
            [class*="section-"] .row:has(.item-product) {
                display: flex !important;
                flex-wrap: wrap !important;
                margin-left: -8px !important;
                margin-right: -8px !important;
            }

            .section-featured-home .row > div,
            .section-featured-home .row > [class*="col"],
            .section-products-home .row > div,
            .section-products-home .row > [class*="col"],
            .js-products-featured-grid > div,
            .js-products-featured-grid > [class*="col"],
            .products-grid .row > div,
            .products-grid .row > [class*="col"],
            [class*="section-"] .row:has(.item-product) > div,
            [class*="section-"] .row:has(.item-product) > [class*="col"] {
                padding-left: 8px !important;
                padding-right: 8px !important;
                margin-bottom: 16px !important;
                flex: 0 0 33.333% !important;
                max-width: 33.333% !important;
                width: 33.333% !important;
            }

            /* Ajustes de tamanho para cards no grid */
            .item-product .item-image,
            .item-product .product-image-container,
            .item-product > a:first-child {
                aspect-ratio: 1 / 1 !important;
                max-height: 200px !important;
            }

            .item-product .item-info,
            .item-product .item-description {
                padding: 12px !important;
            }

            .item-product .item-name,
            .item-product .item-name a,
            .item-product h3,
            .item-product h3 a {
                font-size: 13px !important;
                min-height: 36px !important;
                max-height: 36px !important;
            }

            .item-product .item-price,
            .item-product .js-price-display,
            .item-product .price {
                font-size: 18px !important;
            }

            .item-product .btn {
                padding: 8px 14px !important;
                font-size: 12px !important;
            }

            /* Breakpoint Tablet (≤768px) - 2 colunas */
            @media (max-width: 768px) {
                .section-featured-home .row > div,
                .section-featured-home .row > [class*="col"],
                .section-products-home .row > div,
                .section-products-home .row > [class*="col"],
                .js-products-featured-grid > div,
                .js-products-featured-grid > [class*="col"],
                [class*="section-"] .row:has(.item-product) > div,
                [class*="section-"] .row:has(.item-product) > [class*="col"] {
                    flex: 0 0 50% !important;
                    max-width: 50% !important;
                    width: 50% !important;
                }
            }

            /* Breakpoint Mobile (≤480px) - 1 coluna */
            @media (max-width: 480px) {
                .section-featured-home .row > div,
                .section-featured-home .row > [class*="col"],
                .section-products-home .row > div,
                .section-products-home .row > [class*="col"],
                .js-products-featured-grid > div,
                .js-products-featured-grid > [class*="col"],
                [class*="section-"] .row:has(.item-product) > div,
                [class*="section-"] .row:has(.item-product) > [class*="col"] {
                    flex: 0 0 100% !important;
                    max-width: 100% !important;
                    width: 100% !important;
                }
            }

            /* ============================================
               20. ACESSIBILIDADE
               Focus visible para navegação via teclado
               Respeita preferência de movimento reduzido
            ============================================ */

            /* Estado de foco visível - Outline laranja */
            *:focus-visible {
                outline: 2px solid var(--ep-orange, #E67E22) !important;
                outline-offset: 2px !important;
            }

            /* Skip link para navegação via teclado */
            .skip-link {
                position: absolute;
                top: -40px;
                left: 0;
                background: var(--ep-navy, #1B3A57);
                color: #FFFFFF;
                padding: 8px 16px;
                z-index: 9999;
                transition: top 0.3s;
            }

            .skip-link:focus {
                top: 0;
            }

            /* Respeita preferência de movimento reduzido */
            @media (prefers-reduced-motion: reduce) {
                *,
                *::before,
                *::after {
                    animation-duration: 0.01ms !important;
                    animation-iteration-count: 1 !important;
                    transition-duration: 0.01ms !important;
                    scroll-behavior: auto !important;
                }
            }

            /* Alto contraste para melhor legibilidade */
            @media (prefers-contrast: high) {
                .item-product {
                    border: 2px solid #2C3E50 !important;
                }

                .btn-primary {
                    border: 2px solid #000000 !important;
                }
            }
        </style>

        {#/*============================================================================
            Seção 8: JavaScript Pré-HTML (Carregado no Head)
            - Configurações de carregamento assíncrono
            - jQuery condicional
            - Scripts privados da plataforma Nuvemshop
            - Dados estruturados (Schema.org)
        ==============================================================================*/#}

        {#/*----------------------------------------------------------------
            Configuração de JavaScript Assíncrono
            - async_js = true: Usa script_tag(true) para carregamento não-bloqueante
            - nojquery = true: Usa jQuery moderno (1.11.1), não 1.5 legacy
        ----------------------------------------------------------------*/#}

        {% set async_js = true %}
        {% set nojquery = true %}

        {#/*----------------------------------------------------------------
            Carregamento Condicional do jQuery
            - Carrega jQuery 1.11.1 do CDN Google se necessário
            - Usa script_tag(true) para carregamento assíncrono
        ----------------------------------------------------------------*/#}

        {% if load_jquery %}
            {{ '//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js' | script_tag(true) }}
        {% endif %}

        {#/*----------------------------------------------------------------
            Scripts Privados da Plataforma Nuvemshop
            - API de carrinho, checkout, analytics, etc.
            - Injetados via head_content
        ----------------------------------------------------------------*/#}

        {% head_content %}

        {#/*----------------------------------------------------------------
            Dados Estruturados (Schema.org / JSON-LD)
            - Informações da loja para Google
            - Produtos, organização, breadcrumb
            - Melhora SEO e Rich Snippets
        ----------------------------------------------------------------*/#}

        {{ component('structured-data') }}

    </head>
    {#/*============================================================================
        Seção 9: Corpo da Página (Body)
        - Ícones SVG do tema
        - Scripts de redes sociais (Facebook, Pinterest)
        - Header, conteúdo principal, Footer
        - Elementos auxiliares (quickshop, WhatsApp)
    ==============================================================================*/#}

    <body class="{% if customer %}customer-logged-in{% endif %} template-{{ template | replace('.', '-') }}">

        {#/*----------------------------------------------------------------
            Ícones SVG do Tema
            - Sprite SVG com todos os ícones usados no tema
            - Carregado inline para acesso imediato via <use>
        ----------------------------------------------------------------*/#}

        {% include "snipplets/svg/icons.tpl" %}

        {#/*----------------------------------------------------------------
            Scripts de Redes Sociais (Página de Produto)
            - Facebook: SDK para caixa de comentários
            - Pinterest: Botão de compartilhamento/pin
        ----------------------------------------------------------------*/#}

        {% if template == 'product' %}
            {% if settings.show_product_fb_comment_box %}
                {{ fb_js }}
            {% endif %}
            {{ pin_js }}
        {% endif %}

        {#/*----------------------------------------------------------------
            Barra de Administração
            - Link "Voltar ao Admin" para lojistas logados
            - Visível apenas quando acessando loja pelo painel admin
        ----------------------------------------------------------------*/#}

        {{back_to_admin}}

        {#/*----------------------------------------------------------------
            Cabeçalho (Header)
            - Barra de anúncios (AdBar)
            - Navegação principal
            - Logo, busca e carrinho
        ----------------------------------------------------------------*/#}

        {% snipplet "header/header.tpl" %}

        {#/*----------------------------------------------------------------
            Conteúdo Principal da Página
            - Renderiza o template específico (home, product, category, etc.)
            - Conteúdo dinâmico baseado na rota atual
        ----------------------------------------------------------------*/#}

        {% template_content %}

        {#/*----------------------------------------------------------------
            Modal de Visualização Rápida (Quickshop)
            - Modal para ver detalhes do produto sem sair da página
            - Inclui variantes, preço e botão de compra
        ----------------------------------------------------------------*/#}

        {% snipplet "grid/quick-shop.tpl" %}

        {#/*----------------------------------------------------------------
            Botão Flutuante do WhatsApp
            - Botão fixo no canto da tela
            - Abre chat direto com a loja
        ----------------------------------------------------------------*/#}

        {% snipplet "whatsapp-chat.tpl" %}

        {#/*----------------------------------------------------------------
            Rodapé (Footer)
            - Links institucionais
            - Redes sociais
            - Newsletter
            - Informações de contato
        ----------------------------------------------------------------*/#}

        {% snipplet "footer/footer.tpl" %}

        {#/*----------------------------------------------------------------
            Dados de Frete Grátis (Hidden)
            - Elementos ocultos com dados para cálculo de frete grátis
            - Usados pelo JavaScript para exibir mensagens de progresso
        ----------------------------------------------------------------*/#}

        {% if cart.free_shipping.cart_has_free_shipping or cart.free_shipping.min_price_free_shipping.min_price %}
            <span class="js-ship-free-min hidden" data-pricemin="{{ cart.free_shipping.min_price_free_shipping.min_price_raw }}"></span>
            <span class="js-free-shipping-config hidden" data-config="{{ cart.free_shipping.allFreeConfigurations }}"></span>
            <span class="js-cart-subtotal hidden" data-priceraw="{{ cart.subtotal }}"></span>
            <span class="js-cart-discount hidden" data-priceraw="{{ cart.promotional_discount_amount }}"></span>
        {% endif %}

        {#/*============================================================================
            Seção 10: JavaScript Pós-HTML
            - Bibliotecas externas (sem dependências e com jQuery)
            - Funções específicas da loja
            - Google Survey e códigos de rastreamento
        ==============================================================================*/#}

        <script type="text/javascript">
            {#/*----------------------------------------------------------------
                Bibliotecas Sem Dependências
                - Carregadas primeiro, não dependem de jQuery
                - Ex: polyfills, utilitários puros
            ----------------------------------------------------------------*/#}

            {% include "static/js/external-no-dependencies.js.tpl" %}

            {#/*----------------------------------------------------------------
                Execução Após Carregamento do jQuery
                - LS.ready.then aguarda jQuery e scripts da Nuvemshop
                - Garante que dependências estão disponíveis
            ----------------------------------------------------------------*/#}

            LS.ready.then(function(){
                {#/*------------------------------------------------------------
                    Bibliotecas que Requerem jQuery
                    - Bootstrap, Swiper, plugins diversos
                ------------------------------------------------------------*/#}

                {% include "static/js/external.js.tpl" %}

                {#/*------------------------------------------------------------
                    Funções JavaScript da Loja
                    - Variantes de produto
                    - Carrinho de compras (AJAX)
                    - Calculadora de frete
                    - Interações de UI
                ------------------------------------------------------------*/#}

                {% include "static/js/store.js.tpl" %}
            });
        </script>

        {#/*----------------------------------------------------------------
            Google Merchant Center Survey
            - Pesquisa de satisfação do Google
            - Exibida para clientes após compra
        ----------------------------------------------------------------*/#}

        {% include "static/js/google-survey.js.tpl" %}

        {#/*----------------------------------------------------------------
            Códigos de Rastreamento Externos
            - Scripts adicionados pelo admin via painel
            - Google Analytics, Facebook Pixel, etc.
            - Injetados no body após carregamento
        ----------------------------------------------------------------*/#}

        {% if store.assorted_js %}
            <script>
                LS.ready.then(function() {
                    var trackingCode = jQueryNuvem.parseHTML('{{ store.assorted_js| escape("js") }}', document, true);
                    jQueryNuvem('body').append(trackingCode);
                });
            </script>
        {% endif %}

    </body>
</html>
