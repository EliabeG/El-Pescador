<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:fb="http://www.facebook.com/2008/fbml" xmlns:og="http://opengraphprotocol.org/schema/" lang="{% for language in languages %}{% if language.active %}{{ language.lang }}{% endif %}{% endfor %}">
    <head>
        <link rel="preconnect" href="{{ store_resource_hints }}" />
        <link rel="dns-prefetch" href="{{ store_resource_hints }}" />
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <title>{{ page_title }}</title>
        <meta name="description" content="{{ page_description }}" />

        {% set welcome_italic_font = settings.welcome_text and settings.welcome_italic %}
        {% set institutional_italic_font = settings.institutional_text and settings.institutional_italic %}
        {% set testimonial_italic_font = settings.testimonials_italic %}

        {% set italic_font = params.preview or (not params.preview and template == 'home' and welcome_italic_font or institutional_italic_font or testimonial_italic_font) %}
        {% set google_fonts_weights = italic_font ? '400,400italic,700' : '400,700' %}

        {# El Pescador - Force Oswald and Open Sans fonts #}
        <link rel="preload" as="style" href="https://fonts.googleapis.com/css2?family=Oswald:wght@400;500;700&family=Open+Sans:wght@400;600;700&display=swap" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Oswald:wght@400;500;700&family=Open+Sans:wght@400;600;700&display=swap" />
        <link rel="preload" href="{{ 'css/style-critical.scss' | static_url }}" as="style" />
        <link rel="preload" href="{{ 'css/style-colors.scss' | static_url }}" as="style" />

        {# Preload LCP home, category and product page elements #}
        
        {% snipplet 'preload-images.tpl' %}

        {{ component('social-meta') }}

        {#/*============================================================================
            #CSS and fonts
        ==============================================================================*/#}

        {# Critical CSS needed to show first elements of store while CSS async is loading #}

        <style>
            {# Font families - El Pescador forced fonts #}

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

            {# General CSS Tokens #}

            {% include "static/css/style-tokens.tpl" %}

        </style>

        {# Critical CSS #}

        {{ 'css/style-critical.scss' | static_url | static_inline }}

        {# Colors and fonts used from settings.txt and defined on theme customization #}

        {{ 'css/style-colors.scss' | static_url | static_inline }}

        {# Load async styling not mandatory for first meaningfull paint #}

        <link rel="stylesheet" href="{{ 'css/style-async.scss' | static_url }}" media="print" onload="this.media='all'">

        {# Loads custom CSS added from Advanced Settings on the admin´s theme customization screen #}

        <style>
            {{ settings.css_code | raw }}
        </style>

        {# El Pescador - Final Override CSS to guarantee colors and fonts #}
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Oswald:wght@400;500;700&family=Open+Sans:wght@400;600;700&display=swap');

            /* ============================================
               ETAPA 1-10: AD BAR (Barra de Anúncios)
            ============================================ */

            :root {
                --main-foreground: #1C2833 !important;
                --main-background: #FFFFFF !important;
                --accent-color: #00D4FF !important;
                --button-background: #00D4FF !important;
                --button-foreground: #000000 !important;
                --label-background: #E74C3C !important;
                --label-foreground: #FFFFFF !important;
                --adbar-background: #000000 !important;
                --adbar-foreground: #00D4FF !important;
                --header-background: #000000 !important;
                --header-foreground: #FFFFFF !important;
                --footer-background: #000000 !important;
                --footer-foreground: #FFFFFF !important;
                --newsletter-background: #1D4E4F !important;
                --newsletter-foreground: #FFFFFF !important;
                --services-background: #1D4E4F !important;
                --services-foreground: #FFFFFF !important;
                --heading-font: "Oswald", sans-serif !important;
                --body-font: "Open Sans", sans-serif !important;
            }

            /* Etapa 1: Ad bar fundo preto */
            .section-adbar {
                background-color: #000000 !important;
                padding: 12px 0 !important;
                font-size: 14px !important;
                overflow: hidden !important;
            }

            /* Etapa 2: Ad bar texto ciano */
            .section-adbar,
            .section-adbar a,
            .section-adbar span {
                color: #00D4FF !important;
                fill: #00D4FF !important;
            }

            /* Etapa 3: Ad bar animação suave */
            .section-adbar-animated {
                overflow: hidden !important;
            }

            .adbar-animated {
                animation: scrollAdbar 25s linear infinite !important;
            }

            @keyframes scrollAdbar {
                0% { transform: translateX(0); }
                100% { transform: translateX(-50%); }
            }

            /* Etapa 4: Ad bar hover pausa animação */
            .adbar-animated:hover {
                animation-play-state: paused !important;
            }

            /* Etapa 5: Ad bar espaçamento entre itens */
            .section-adbar .mr-4 {
                margin-right: 50px !important;
            }

            /* Etapa 6: Ad bar fonte */
            .section-adbar {
                font-family: "Open Sans", sans-serif !important;
                font-weight: 600 !important;
                letter-spacing: 0.5px !important;
            }

            /* Etapa 7: Ad bar links sem sublinhado */
            .section-adbar a {
                text-decoration: none !important;
            }

            /* Etapa 8: Ad bar links hover */
            .section-adbar a:hover {
                opacity: 0.8 !important;
            }

            /* Etapa 9: Ad bar ícones */
            .section-adbar .svg-icon-text {
                color: #00D4FF !important;
                fill: #00D4FF !important;
            }

            /* Etapa 10: Ad bar bordas dos botões de navegação */
            .section-adbar .swiper-button-prev,
            .section-adbar .swiper-button-next {
                color: #00D4FF !important;
            }

            /* ============================================
               ETAPA 11-20: HEADER (Cabeçalho)
            ============================================ */

            /* Etapa 11: Header fundo preto */
            .head-main {
                background-color: #000000 !important;
                color: #FFFFFF !important;
            }

            /* Etapa 12: Header sticky */
            .head-main {
                position: sticky !important;
                top: 0 !important;
                z-index: 1000 !important;
            }

            /* Etapa 13: Header padding */
            .head-logo-row {
                padding: 15px 0 !important;
            }

            /* Etapa 14: Header links brancos */
            .head-main a,
            .head-main .svg-icon-text {
                color: #FFFFFF !important;
                fill: #FFFFFF !important;
            }

            /* Etapa 15: Header logo container */
            .head-main .logo-img-container {
                max-width: 100px !important;
            }

            /* Etapa 16: Header search box */
            .head-main .form-control {
                background-color: #000000 !important;
                border: 2px solid #00D4FF !important;
                border-radius: 25px !important;
                color: #FFFFFF !important;
                padding: 10px 20px !important;
            }

            /* Etapa 17: Header search placeholder */
            .head-main .form-control::placeholder {
                color: rgba(255,255,255,0.7) !important;
            }

            /* Etapa 18: Header search button */
            .head-main .btn-search {
                background-color: #00D4FF !important;
                color: #000000 !important;
                border-radius: 0 25px 25px 0 !important;
            }

            /* Etapa 19: Header icons hover */
            .head-main a:hover,
            .head-main .svg-icon-text:hover {
                color: #00D4FF !important;
                fill: #00D4FF !important;
            }

            /* Etapa 20: Header cart badge */
            .head-main .js-cart-widget-amount {
                background-color: #00D4FF !important;
                color: #000000 !important;
            }

            /* ============================================
               ETAPA 21-30: NAVEGAÇÃO
            ============================================ */

            /* Etapa 21: Nav fundo preto */
            .desktop-nav-col,
            .nav-desktop {
                background-color: #000000 !important;
            }

            /* Etapa 22: Nav links brancos uppercase */
            .nav-desktop-list a {
                color: #FFFFFF !important;
                text-transform: uppercase !important;
                font-family: "Oswald", sans-serif !important;
                font-weight: 500 !important;
                font-size: 14px !important;
                letter-spacing: 1px !important;
                padding: 15px 20px !important;
                transition: all 0.3s ease !important;
            }

            /* Etapa 23: Nav hover efeito ciano */
            .nav-desktop-list a:hover {
                color: #00D4FF !important;
            }

            /* Etapa 24: Nav underline animado */
            .nav-desktop-list a::after {
                content: '' !important;
                display: block !important;
                width: 0 !important;
                height: 2px !important;
                background: #00D4FF !important;
                transition: width 0.3s ease !important;
            }

            .nav-desktop-list a:hover::after {
                width: 100% !important;
            }

            /* Etapa 25: Nav item ativo */
            .nav-desktop-list .nav-item.active > a {
                color: #00D4FF !important;
            }

            /* Etapa 26: Nav dropdown */
            .nav-desktop-list .dropdown-menu {
                background-color: #000000 !important;
                border: 1px solid #00D4FF !important;
                border-radius: 0 !important;
            }

            /* Etapa 27: Nav dropdown items */
            .nav-desktop-list .dropdown-item {
                color: #FFFFFF !important;
                padding: 10px 20px !important;
            }

            /* Etapa 28: Nav dropdown hover */
            .nav-desktop-list .dropdown-item:hover {
                background-color: rgba(0,212,255,0.1) !important;
                color: #00D4FF !important;
            }

            /* Etapa 29: Nav mobile menu */
            .nav-hamburger-list a {
                color: #FFFFFF !important;
                font-family: "Oswald", sans-serif !important;
                text-transform: uppercase !important;
            }

            /* Etapa 30: Nav mobile fundo */
            .js-modal-nav .modal-content {
                background-color: #000000 !important;
            }

            /* ============================================
               ETAPA 31-40: HERO SECTION
            ============================================ */

            /* Etapa 31: Hero gradiente */
            .section-slider,
            .section-slider-home {
                background: linear-gradient(135deg, #000000 0%, #1D4E4F 100%) !important;
            }

            /* Etapa 32: Hero padding */
            .section-slider .swiper-slide,
            .section-welcome {
                padding: 80px 0 !important;
                min-height: 500px !important;
            }

            /* Etapa 33: Hero texto branco */
            .section-slider,
            .section-slider h1,
            .section-slider h2,
            .section-slider p,
            .section-welcome,
            .section-welcome h1,
            .section-welcome h2,
            .section-welcome p {
                color: #FFFFFF !important;
            }

            /* Etapa 34: Hero título */
            .section-slider h1,
            .section-welcome h1 {
                font-family: "Oswald", sans-serif !important;
                font-size: 48px !important;
                font-weight: 700 !important;
                text-transform: uppercase !important;
                margin-bottom: 10px !important;
            }

            /* Etapa 35: Hero subtítulo ciano */
            .section-slider .subtitle,
            .section-welcome .h5,
            .section-welcome h5 {
                color: #00D4FF !important;
                font-family: "Oswald", sans-serif !important;
                font-size: 24px !important;
                letter-spacing: 3px !important;
                text-transform: uppercase !important;
            }

            /* Etapa 36: Hero descrição */
            .section-slider p,
            .section-welcome p {
                font-size: 18px !important;
                opacity: 0.9 !important;
                max-width: 600px !important;
                margin: 0 auto 30px !important;
            }

            /* Etapa 37: Hero botão primário */
            .section-slider .btn-primary,
            .section-welcome .btn-primary {
                background-color: #00D4FF !important;
                color: #000000 !important;
                border: none !important;
                padding: 15px 40px !important;
                font-family: "Oswald", sans-serif !important;
                font-weight: 700 !important;
                text-transform: uppercase !important;
                letter-spacing: 1px !important;
                border-radius: 0 !important;
                transition: all 0.3s ease !important;
            }

            /* Etapa 38: Hero botão hover */
            .section-slider .btn-primary:hover,
            .section-welcome .btn-primary:hover {
                background-color: #FFFFFF !important;
                color: #000000 !important;
                transform: translateY(-3px) !important;
                box-shadow: 0 10px 30px rgba(0,212,255,0.3) !important;
            }

            /* Etapa 39: Hero botão secundário */
            .section-slider .btn-secondary,
            .section-welcome .btn-secondary {
                background-color: transparent !important;
                color: #FFFFFF !important;
                border: 2px solid #FFFFFF !important;
                padding: 13px 38px !important;
            }

            /* Etapa 40: Hero botão secundário hover */
            .section-slider .btn-secondary:hover,
            .section-welcome .btn-secondary:hover {
                background-color: #FFFFFF !important;
                color: #000000 !important;
            }

            /* ============================================
               ETAPA 41-50: SEÇÃO DE SERVIÇOS
            ============================================ */

            /* Etapa 41: Serviços fundo verde escuro */
            .section-informative-banners,
            .section-informative-banners-colors {
                background-color: #1D4E4F !important;
                padding: 40px 0 !important;
            }

            /* Etapa 42: Serviços texto branco */
            .section-informative-banners,
            .section-informative-banners h3,
            .section-informative-banners h4,
            .section-informative-banners p,
            .section-informative-banners-colors,
            .section-informative-banners-colors h3,
            .section-informative-banners-colors h4,
            .section-informative-banners-colors p {
                color: #FFFFFF !important;
            }

            /* Etapa 43: Serviços ícones */
            .section-informative-banners .svg-icon-text,
            .section-informative-banners-colors .svg-icon-text {
                fill: #00D4FF !important;
                color: #00D4FF !important;
            }

            /* Etapa 44: Serviços ícones tamanho */
            .section-informative-banners .svg-icon-lg,
            .section-informative-banners-colors .svg-icon-lg {
                width: 48px !important;
                height: 48px !important;
            }

            /* Etapa 45: Serviços títulos */
            .section-informative-banners h4,
            .section-informative-banners-colors h4 {
                font-family: "Oswald", sans-serif !important;
                font-size: 16px !important;
                font-weight: 700 !important;
                text-transform: uppercase !important;
                margin: 15px 0 5px !important;
            }

            /* Etapa 46: Serviços descrição */
            .section-informative-banners p,
            .section-informative-banners-colors p {
                font-size: 14px !important;
                opacity: 0.9 !important;
            }

            /* Etapa 47: Serviços layout grid */
            .section-informative-banners .row,
            .section-informative-banners-colors .row {
                display: flex !important;
                justify-content: center !important;
                gap: 30px !important;
            }

            /* Etapa 48: Serviços item centralizado */
            .section-informative-banners .col,
            .section-informative-banners-colors .col {
                text-align: center !important;
            }

            /* Etapa 49: Serviços hover */
            .section-informative-banners .col:hover .svg-icon-text,
            .section-informative-banners-colors .col:hover .svg-icon-text {
                transform: scale(1.1) !important;
                transition: transform 0.3s ease !important;
            }

            /* Etapa 50: Serviços borda entre itens */
            .section-informative-banners .col:not(:last-child),
            .section-informative-banners-colors .col:not(:last-child) {
                border-right: 1px solid rgba(255,255,255,0.2) !important;
            }

            /* ============================================
               ETAPA 51-60: CATEGORIAS
            ============================================ */

            /* Etapa 51: Categorias seção fundo */
            .section-main-categories {
                background-color: #FFFFFF !important;
                padding: 60px 0 !important;
            }

            /* Etapa 52: Categorias título */
            .section-main-categories h2 {
                font-family: "Oswald", sans-serif !important;
                font-size: 32px !important;
                text-align: center !important;
                margin-bottom: 40px !important;
                color: #1C2833 !important;
                text-transform: uppercase !important;
            }

            /* Etapa 53: Categoria card */
            .category-card,
            .item-category {
                border-radius: 10px !important;
                overflow: hidden !important;
                position: relative !important;
                transition: all 0.3s ease !important;
            }

            /* Etapa 54: Categoria card hover */
            .category-card:hover,
            .item-category:hover {
                transform: scale(1.05) !important;
                box-shadow: 0 15px 40px rgba(0,0,0,0.2) !important;
            }

            /* Etapa 55: Categoria overlay */
            .category-card::before,
            .item-category .category-image::after {
                content: '' !important;
                position: absolute !important;
                bottom: 0 !important;
                left: 0 !important;
                right: 0 !important;
                height: 50% !important;
                background: linear-gradient(transparent, rgba(0,0,0,0.8)) !important;
                z-index: 1 !important;
            }

            /* Etapa 56: Categoria título */
            .category-card h3,
            .item-category h3 {
                font-family: "Oswald", sans-serif !important;
                font-size: 18px !important;
                color: #FFFFFF !important;
                text-transform: uppercase !important;
                position: relative !important;
                z-index: 2 !important;
            }

            /* Etapa 57: Categoria borda hover */
            .category-card:hover,
            .item-category:hover {
                border: 2px solid #00D4FF !important;
            }

            /* Etapa 58: Categoria ícone */
            .item-category .svg-icon-text {
                color: #00D4FF !important;
                fill: #00D4FF !important;
            }

            /* Etapa 59: Categoria grid */
            .section-main-categories .row {
                display: grid !important;
                grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)) !important;
                gap: 20px !important;
            }

            /* Etapa 60: Categoria imagem */
            .item-category img {
                transition: transform 0.3s ease !important;
            }

            .item-category:hover img {
                transform: scale(1.1) !important;
            }

            /* ============================================
               ETAPA 61-70: CARDS DE PRODUTOS
            ============================================ */

            /* Etapa 61: Produto card fundo */
            .item-product,
            .product-card {
                background-color: #FFFFFF !important;
                border-radius: 10px !important;
                overflow: hidden !important;
                box-shadow: 0 5px 20px rgba(0,0,0,0.1) !important;
                transition: all 0.3s ease !important;
            }

            /* Etapa 62: Produto card hover */
            .item-product:hover,
            .product-card:hover {
                transform: translateY(-10px) !important;
                box-shadow: 0 20px 40px rgba(0,0,0,0.15) !important;
            }

            /* Etapa 63: Produto imagem */
            .item-product .img-fluid,
            .product-card img {
                transition: transform 0.3s ease !important;
            }

            .item-product:hover .img-fluid,
            .product-card:hover img {
                transform: scale(1.05) !important;
            }

            /* Etapa 64: Produto badge desconto */
            .item-product .label,
            .product-card .badge {
                background-color: #E74C3C !important;
                color: #FFFFFF !important;
                font-family: "Oswald", sans-serif !important;
                font-weight: 700 !important;
                padding: 5px 15px !important;
                font-size: 14px !important;
            }

            /* Etapa 65: Produto título */
            .item-product h3,
            .item-product .item-name,
            .product-card h3 {
                font-family: "Oswald", sans-serif !important;
                font-size: 16px !important;
                color: #1C2833 !important;
                text-transform: uppercase !important;
                margin: 15px 0 10px !important;
            }

            /* Etapa 66: Produto preço antigo */
            .item-product .price-compare,
            .product-card .old-price {
                color: #999 !important;
                text-decoration: line-through !important;
                font-size: 14px !important;
            }

            /* Etapa 67: Produto preço atual */
            .item-product .item-price,
            .product-card .price {
                color: #00D4FF !important;
                font-family: "Oswald", sans-serif !important;
                font-size: 24px !important;
                font-weight: 700 !important;
            }

            /* Etapa 68: Produto botão comprar */
            .item-product .btn,
            .product-card .btn {
                background-color: #000000 !important;
                color: #FFFFFF !important;
                border: none !important;
                padding: 12px 25px !important;
                font-family: "Oswald", sans-serif !important;
                text-transform: uppercase !important;
                letter-spacing: 1px !important;
                border-radius: 0 !important;
                transition: all 0.3s ease !important;
                width: 100% !important;
            }

            /* Etapa 69: Produto botão hover */
            .item-product .btn:hover,
            .product-card .btn:hover {
                background-color: #00D4FF !important;
                color: #000000 !important;
            }

            /* Etapa 70: Produto info padding */
            .item-product .item-info,
            .product-card .product-info {
                padding: 15px !important;
                text-align: center !important;
            }

            /* ============================================
               ETAPA 71-80: FOOTER
            ============================================ */

            /* Etapa 71: Footer fundo preto */
            footer,
            .js-footer {
                background-color: #000000 !important;
                color: #FFFFFF !important;
                padding: 60px 0 20px !important;
            }

            /* Etapa 72: Footer grid layout */
            footer .container {
                display: grid !important;
                grid-template-columns: 2fr 1fr 1fr 1fr !important;
                gap: 40px !important;
            }

            /* Etapa 73: Footer títulos ciano */
            footer h4,
            footer .h4 {
                color: #00D4FF !important;
                font-family: "Oswald", sans-serif !important;
                font-size: 18px !important;
                text-transform: uppercase !important;
                margin-bottom: 20px !important;
                letter-spacing: 1px !important;
            }

            /* Etapa 74: Footer links */
            footer a {
                color: rgba(255,255,255,0.8) !important;
                text-decoration: none !important;
                transition: all 0.3s ease !important;
                display: block !important;
                margin-bottom: 10px !important;
            }

            /* Etapa 75: Footer links hover */
            footer a:hover {
                color: #00D4FF !important;
                padding-left: 5px !important;
            }

            /* Etapa 76: Footer logo */
            footer .footer-logo-img {
                max-width: 120px !important;
                margin-bottom: 20px !important;
            }

            /* Etapa 77: Footer descrição */
            footer p {
                color: rgba(255,255,255,0.7) !important;
                font-size: 14px !important;
                line-height: 1.8 !important;
            }

            /* Etapa 78: Footer redes sociais */
            footer .social-links a,
            footer .footer-social a {
                display: inline-flex !important;
                width: 40px !important;
                height: 40px !important;
                background-color: rgba(255,255,255,0.1) !important;
                border-radius: 50% !important;
                align-items: center !important;
                justify-content: center !important;
                margin-right: 10px !important;
                transition: all 0.3s ease !important;
            }

            /* Etapa 79: Footer redes sociais hover */
            footer .social-links a:hover,
            footer .footer-social a:hover {
                background-color: #00D4FF !important;
                transform: translateY(-3px) !important;
            }

            /* Etapa 80: Footer copyright */
            footer .font-smallest {
                border-top: 1px solid rgba(255,255,255,0.1) !important;
                padding-top: 20px !important;
                margin-top: 40px !important;
                text-align: center !important;
                opacity: 0.7 !important;
            }

            /* ============================================
               ETAPA 81-90: BOTÕES E TIPOGRAFIA
            ============================================ */

            /* Etapa 81: Fonte body */
            body {
                font-family: "Open Sans", sans-serif !important;
                color: #1C2833 !important;
                line-height: 1.6 !important;
            }

            /* Etapa 82: Headings */
            h1, h2, h3, h4, h5, h6,
            .h1, .h2, .h3, .h4, .h5, .h6 {
                font-family: "Oswald", sans-serif !important;
                font-weight: 700 !important;
                text-transform: uppercase !important;
                color: #1C2833 !important;
            }

            /* Etapa 83: Títulos de seção */
            .section-title,
            section h2 {
                font-size: 32px !important;
                text-align: center !important;
                margin-bottom: 40px !important;
                position: relative !important;
            }

            /* Etapa 84: Botão primário global */
            .btn-primary {
                background-color: #00D4FF !important;
                color: #000000 !important;
                border: none !important;
                padding: 12px 30px !important;
                font-family: "Oswald", sans-serif !important;
                font-weight: 700 !important;
                text-transform: uppercase !important;
                letter-spacing: 1px !important;
                border-radius: 0 !important;
                transition: all 0.3s ease !important;
            }

            /* Etapa 85: Botão primário hover */
            .btn-primary:hover {
                background-color: #1C2833 !important;
                color: #FFFFFF !important;
                transform: translateY(-2px) !important;
                box-shadow: 0 5px 20px rgba(0,212,255,0.3) !important;
            }

            /* Etapa 86: Botão secundário */
            .btn-secondary,
            .btn-outline {
                background-color: transparent !important;
                color: #1C2833 !important;
                border: 2px solid #1C2833 !important;
                padding: 10px 28px !important;
                font-family: "Oswald", sans-serif !important;
                font-weight: 700 !important;
                text-transform: uppercase !important;
            }

            /* Etapa 87: Botão secundário hover */
            .btn-secondary:hover,
            .btn-outline:hover {
                background-color: #1C2833 !important;
                color: #FFFFFF !important;
            }

            /* Etapa 88: Links gerais */
            a {
                color: #00D4FF !important;
                transition: all 0.3s ease !important;
            }

            a:hover {
                color: #1C2833 !important;
            }

            /* Etapa 89: Texto destaque */
            .text-accent,
            .text-primary {
                color: #00D4FF !important;
            }

            /* Etapa 90: Labels e badges */
            .label,
            .badge {
                font-family: "Oswald", sans-serif !important;
                font-weight: 700 !important;
                text-transform: uppercase !important;
            }

            /* ============================================
               ETAPA 91-100: AJUSTES FINAIS
            ============================================ */

            /* Etapa 91: Newsletter seção */
            .section-newsletter-home,
            .section-newsletter-home-colors {
                background-color: #1D4E4F !important;
                padding: 60px 0 !important;
            }

            .section-newsletter-home h2,
            .section-newsletter-home-colors h2 {
                color: #FFFFFF !important;
            }

            .section-newsletter-home p,
            .section-newsletter-home-colors p {
                color: rgba(255,255,255,0.9) !important;
            }

            /* Etapa 92: Newsletter input */
            .section-newsletter-home input,
            .section-newsletter-home-colors input {
                border: 2px solid #00D4FF !important;
                border-radius: 0 !important;
                padding: 15px !important;
            }

            /* Etapa 93: Testimonials */
            .section-testimonials {
                background-color: #F8F9FA !important;
                padding: 60px 0 !important;
            }

            .section-testimonials blockquote {
                font-style: italic !important;
                color: #1C2833 !important;
            }

            /* Etapa 94: Breadcrumb */
            .breadcrumb {
                background-color: transparent !important;
            }

            .breadcrumb a {
                color: #00D4FF !important;
            }

            /* Etapa 95: WhatsApp button */
            .whatsapp-btn,
            .js-whatsapp-btn {
                background-color: #25D366 !important;
                border-radius: 50% !important;
                box-shadow: 0 5px 20px rgba(37,211,102,0.4) !important;
            }

            /* Etapa 96: Scroll to top */
            .scroll-top {
                background-color: #00D4FF !important;
                color: #000000 !important;
            }

            /* Etapa 97: Loading spinner */
            .spinner,
            .loading {
                border-color: #00D4FF !important;
            }

            /* Etapa 98: Modal styling */
            .modal-content {
                border-radius: 0 !important;
            }

            .modal-header {
                background-color: #000000 !important;
                color: #FFFFFF !important;
            }

            /* Etapa 99: Alerts */
            .alert-success {
                background-color: rgba(0,212,255,0.1) !important;
                border-color: #00D4FF !important;
                color: #1C2833 !important;
            }

            /* Etapa 100: Transições globais */
            * {
                transition: color 0.3s ease, background-color 0.3s ease, transform 0.3s ease, box-shadow 0.3s ease !important;
            }

            /* Desabilitar transição para elementos que não precisam */
            .swiper-wrapper,
            .adbar-animated,
            img {
                transition: none !important;
            }

            .adbar-animated * {
                transition: color 0.3s ease !important;
            }
        </style>

        {#/*============================================================================
            #Javascript: Needed before HTML loads
        ==============================================================================*/#}

        {# Defines if async JS will be used by using script_tag(true) #}

        {% set async_js = true %}

        {# Defines the usage of jquery loaded below, if nojquery = true is deleted it will fallback to jquery 1.5 #}

        {% set nojquery = true %}

        {# Jquery async by adding script_tag(true) #}

        {% if load_jquery %}

            {{ '//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js' | script_tag(true) }}

        {% endif %}

        {# Loads private Tiendanube JS #}

        {% head_content %}

        {# Structured data to provide information for Google about the page content #}

        {{ component('structured-data') }}

    </head>
    <body class="{% if customer %}customer-logged-in{% endif %} template-{{ template | replace('.', '-') }}">

        {# Theme icons #}

        {% include "snipplets/svg/icons.tpl" %}

        {# Facebook comments on product page #}

        {% if template == 'product' %}

            {# Facebook comment box JS #}
            {% if settings.show_product_fb_comment_box %}
                {{ fb_js }}
            {% endif %}

            {# Pinterest share button JS #}
            {{ pin_js }}

        {% endif %}

        {# Back to admin bar #}

        {{back_to_admin}}

        {# Header = Advertising + Nav + Logo + Search + Ajax Cart #}

        {% snipplet "header/header.tpl" %}

        {# Page content #}

        {% template_content %}

        {# Quickshop modal #}

        {% snipplet "grid/quick-shop.tpl" %}

        {# WhatsApp chat button #}

        {% snipplet "whatsapp-chat.tpl" %}

        {# Footer #}

        {% snipplet "footer/footer.tpl" %}

        {% if cart.free_shipping.cart_has_free_shipping or cart.free_shipping.min_price_free_shipping.min_price %}

            {# Minimum used for free shipping progress messages. Located on header so it can be accesed everywhere with shipping calculator active or inactive #}

            <span class="js-ship-free-min hidden" data-pricemin="{{ cart.free_shipping.min_price_free_shipping.min_price_raw }}"></span>
            <span class="js-free-shipping-config hidden" data-config="{{ cart.free_shipping.allFreeConfigurations }}"></span>
            <span class="js-cart-subtotal hidden" data-priceraw="{{ cart.subtotal }}"></span>
            <span class="js-cart-discount hidden" data-priceraw="{{ cart.promotional_discount_amount }}"></span>
        {% endif %}

        {#/*============================================================================
            #Javascript: Needed after HTML loads
        ==============================================================================*/#}

        {# Javascript used in the store #}

        <script type="text/javascript">

            {# Libraries that do NOT depend on other libraries, e.g: Jquery #}

            {% include "static/js/external-no-dependencies.js.tpl" %}

            {# LS.ready.then function waits to Jquery and private Tiendanube JS to be loaded before executing what´s inside #}

            LS.ready.then(function(){

                {# Libraries that requires Jquery to work #}

                {% include "static/js/external.js.tpl" %}

                {# Specific store JS functions: product variants, cart, shipping, etc #}

                {% include "static/js/store.js.tpl" %}
            });
        </script>

        {# Google survey JS for Tiendanube Survey #}

        {% include "static/js/google-survey.js.tpl" %}

        {# Store external codes added from admin #}

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
