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

        {# El Pescador - CSS Customizado (carregado como arquivo externo) #}
        {{ 'css/elpescador-custom.css' | static_url | css_tag }}

        {# Loads custom CSS added from Advanced Settings on the admin´s theme customization screen #}

        <style>
            {{ settings.css_code | raw }}
        </style>

        {# El Pescador - CSS Override - Nova Identidade Visual (Preto + Ciano) #}
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Oswald:wght@400;500;700&family=Open+Sans:wght@400;600;700&display=swap');

            /* ============================================
               CSS VARIÁVEIS - El Pescador
               Nova Paleta: Preto + Ciano + Laranja
            ============================================ */

            :root {
                --main-foreground: #1C2833 !important;
                --main-background: #F8F9FA !important;
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

                /* Cores El Pescador - Nova Paleta */
                --ep-primary-blue: #0D3B66;
                --ep-accent-cyan: #00D4FF;
                --ep-accent-orange: #F4A836;
                --ep-dark-green: #1D4E4F;
                --ep-dark-gray: #1C2833;
                --ep-black: #000000;
                --ep-white: #FFFFFF;
                --ep-light-gray: #F8F9FA;
                --ep-danger-red: #E74C3C;
            }

            /* ============================================
               FONTES GLOBAIS
            ============================================ */

            body {
                font-family: "Open Sans", sans-serif !important;
                color: #1C2833 !important;
                background-color: #F8F9FA !important;
            }

            h1, h2, h3, h4, h5, h6,
            .h1, .h2, .h3, .h4, .h5, .h6 {
                font-family: "Oswald", sans-serif !important;
                color: #1C2833 !important;
            }

            /* ============================================
               AD BAR - Barra de Anúncios (Preto)
            ============================================ */

            .section-adbar {
                background-color: #000000 !important;
            }

            .section-adbar,
            .section-adbar a,
            .section-adbar span,
            .section-adbar .svg-icon-text,
            .section-adbar .swiper-button-prev,
            .section-adbar .swiper-button-next {
                color: #00D4FF !important;
                fill: #00D4FF !important;
            }

            .section-adbar a:hover {
                color: #F4A836 !important;
            }

            /* ============================================
               HEADER - Cabeçalho (Preto)
            ============================================ */

            .head-main {
                background-color: #000000 !important;
            }

            .head-main,
            .head-main a,
            .head-main .svg-icon-text {
                color: #FFFFFF !important;
                fill: #FFFFFF !important;
            }

            .head-main a:hover,
            .head-main .svg-icon-text:hover {
                color: #00D4FF !important;
                fill: #00D4FF !important;
            }

            .head-main .form-control {
                background-color: rgba(255,255,255,0.1) !important;
                border: 2px solid #00D4FF !important;
                border-radius: 25px !important;
                color: #FFFFFF !important;
            }

            .head-main .form-control::placeholder {
                color: rgba(255,255,255,0.7) !important;
            }

            .head-main .js-cart-widget-amount {
                background-color: #00D4FF !important;
                color: #000000 !important;
            }

            /* ============================================
               NAVEGAÇÃO (Preto com Ciano)
            ============================================ */

            .desktop-nav-col,
            .nav-desktop {
                background-color: #000000 !important;
                border-top: 1px solid rgba(0,212,255,0.2) !important;
            }

            .nav-desktop-list a {
                color: #FFFFFF !important;
                font-family: "Oswald", sans-serif !important;
                position: relative !important;
            }

            .nav-desktop-list a:hover {
                color: #00D4FF !important;
            }

            .nav-desktop-list a::after {
                content: '' !important;
                position: absolute !important;
                bottom: -5px !important;
                left: 0 !important;
                width: 0 !important;
                height: 2px !important;
                background: #00D4FF !important;
                transition: width 0.3s !important;
            }

            .nav-desktop-list a:hover::after {
                width: 100% !important;
            }

            .nav-desktop-list .nav-item.active > a {
                color: #00D4FF !important;
            }

            .nav-desktop-list .dropdown-menu {
                background-color: #000000 !important;
                border-color: rgba(0,212,255,0.3) !important;
            }

            .nav-desktop-list .dropdown-item {
                color: #FFFFFF !important;
            }

            .nav-desktop-list .dropdown-item:hover {
                background-color: rgba(0,212,255,0.2) !important;
                color: #00D4FF !important;
            }

            .nav-hamburger-list a {
                color: #FFFFFF !important;
            }

            .js-modal-nav .modal-content {
                background-color: #000000 !important;
            }

            /* ============================================
               HERO / SLIDER / WELCOME - Preto + Ciano
            ============================================ */

            /* Hero com gradiente Preto + Verde Escuro */
            .section-slider,
            .section-slider-home,
            .section-welcome,
            .section-welcome-home {
                background: linear-gradient(135deg, #000000 0%, #1a1a2e 50%, #1D4E4F 100%) !important;
                position: relative !important;
                padding: 100px 0 !important;
                overflow: hidden !important;
            }

            /* Pattern de peixe animado */
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
                background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><text y=".9em" font-size="90" opacity="0.03">🐟</text></svg>') repeat !important;
                background-size: 150px !important;
                animation: ep-float 30s linear infinite !important;
                z-index: 1 !important;
            }

            @keyframes ep-float {
                0% { background-position: 0 0; }
                100% { background-position: 150px 150px; }
            }

            /* Conteúdo acima do overlay */
            .section-slider .container,
            .section-slider-home .container,
            .section-welcome .container,
            .section-welcome-home .container {
                position: relative !important;
                z-index: 2 !important;
            }

            /* Textos do Hero */
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
                text-shadow: 0 2px 4px rgba(0,0,0,0.3) !important;
            }

            /* Título principal */
            .section-welcome-home h2,
            .section-welcome h2,
            .section-slider h1 {
                font-size: 48px !important;
                font-weight: 700 !important;
                margin-bottom: 20px !important;
                line-height: 1.2 !important;
            }

            /* Subtítulo - CIANO */
            .section-slider .subtitle,
            .section-welcome .h5,
            .section-welcome h5,
            .section-welcome-home .js-welcome-message-title {
                color: #00D4FF !important;
                font-size: 24px !important;
                letter-spacing: 3px !important;
                text-transform: uppercase !important;
                text-shadow: none !important;
                font-weight: 500 !important;
            }

            /* Botões CTA no Hero - CIANO */
            .section-slider .btn-primary,
            .section-welcome .btn-primary,
            .section-welcome-home .btn-primary {
                background-color: #00D4FF !important;
                color: #000000 !important;
                border: none !important;
                padding: 15px 40px !important;
                font-size: 16px !important;
                border-radius: 30px !important;
                text-shadow: none !important;
                margin: 8px !important;
                font-weight: 700 !important;
                text-transform: uppercase !important;
                letter-spacing: 1px !important;
            }

            .section-slider .btn-primary:hover,
            .section-welcome .btn-primary:hover,
            .section-welcome-home .btn-primary:hover {
                background-color: #00b8e6 !important;
                transform: translateY(-2px) !important;
                box-shadow: 0 5px 20px rgba(0,212,255,0.4) !important;
            }

            .section-slider .btn-secondary,
            .section-welcome .btn-secondary,
            .section-welcome-home .btn-secondary,
            .section-welcome-home .btn-link {
                background: transparent !important;
                color: #FFFFFF !important;
                border: 2px solid #00D4FF !important;
                padding: 13px 38px !important;
                border-radius: 30px !important;
                text-shadow: none !important;
                margin: 8px !important;
                text-transform: uppercase !important;
                letter-spacing: 1px !important;
            }

            .section-slider .btn-secondary:hover,
            .section-welcome .btn-secondary:hover,
            .section-welcome-home .btn-secondary:hover,
            .section-welcome-home .btn-link:hover {
                background: #00D4FF !important;
                color: #000000 !important;
            }

            /* ============================================
               SEÇÃO DE SERVIÇOS - FUNDO VERDE ESCURO
            ============================================ */

            .section-informative-banners,
            .section-informative-banners-colors {
                background-color: #1D4E4F !important;
                border: none !important;
                padding: 40px 0 !important;
            }

            .section-informative-banners h3,
            .section-informative-banners h4,
            .section-informative-banners p,
            .section-informative-banners-colors h3,
            .section-informative-banners-colors h4,
            .section-informative-banners-colors p {
                color: #FFFFFF !important;
            }

            .section-informative-banners .svg-icon-text,
            .section-informative-banners-colors .svg-icon-text {
                fill: #FFFFFF !important;
                color: #FFFFFF !important;
            }

            /* Ícones */
            .section-informative-banners .service-icon-container,
            .section-informative-banners .banner-service-icon {
                background-color: transparent !important;
                border-radius: 50% !important;
                padding: 15px !important;
            }

            /* ============================================
               PRODUTOS - GRID ALINHADO
            ============================================ */

            /* Card de produto - fundo branco */
            .item-product {
                display: flex !important;
                flex-direction: column !important;
                height: 100% !important;
                background: #FFFFFF !important;
                border-radius: 12px !important;
                overflow: hidden !important;
                box-shadow: 0 2px 8px rgba(0,0,0,0.06) !important;
                transition: box-shadow 0.3s ease, transform 0.3s ease !important;
                border: 1px solid #eee !important;
            }

            .item-product:hover {
                box-shadow: 0 10px 30px rgba(0,0,0,0.15) !important;
                transform: translateY(-5px) !important;
            }

            /* Container da imagem - SEMPRE QUADRADO */
            .item-product .item-image,
            .item-product .product-image-container,
            .item-product > a:first-child {
                aspect-ratio: 1 / 1 !important;
                width: 100% !important;
                overflow: hidden !important;
                position: relative !important;
                background: #FFFFFF !important;
            }

            /* Imagem preenche o container quadrado */
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

            /* INFO DO PRODUTO */
            .item-product .item-info,
            .item-product .item-description {
                flex: 1 !important;
                display: flex !important;
                flex-direction: column !important;
                padding: 20px !important;
                text-align: left !important;
            }

            /* Categoria do produto - CIANO */
            .item-product .product-category,
            .item-product .item-category {
                font-size: 11px !important;
                color: #00D4FF !important;
                text-transform: uppercase !important;
                letter-spacing: 1px !important;
                margin-bottom: 5px !important;
            }

            /* Nome do produto - SEM MAIÚSCULAS */
            .item-product .item-name,
            .item-product .item-name a,
            .item-product h3,
            .item-product h3 a {
                font-family: "Open Sans", sans-serif !important;
                font-weight: 600 !important;
                color: #1C2833 !important;
                font-size: 14px !important;
                text-transform: none !important;
                line-height: 1.4 !important;
                min-height: 40px !important;
                max-height: 40px !important;
                overflow: hidden !important;
                display: -webkit-box !important;
                -webkit-line-clamp: 2 !important;
                -webkit-box-orient: vertical !important;
                margin-bottom: 10px !important;
            }

            .item-product .item-name a:hover,
            .item-product h3 a:hover {
                color: #00D4FF !important;
            }

            /* PREÇO - Dark Gray */
            .item-product .item-price,
            .item-product .js-price-display,
            .item-product .price,
            .js-product-price {
                color: #1C2833 !important;
                font-family: "Oswald", sans-serif !important;
                font-weight: 700 !important;
                font-size: 22px !important;
                margin-top: auto !important;
                margin-bottom: 5px !important;
            }

            .item-product .price-compare,
            .item-product .js-compare-price-display {
                color: #999 !important;
                text-decoration: line-through !important;
                font-size: 14px !important;
                margin-bottom: 3px !important;
            }

            /* Badge de desconto - VERMELHO */
            .item-product .label,
            .item-product .js-offer-label,
            .product-label,
            .label-offer {
                position: absolute !important;
                top: 10px !important;
                left: 10px !important;
                background-color: #E74C3C !important;
                color: #FFFFFF !important;
                font-family: "Oswald", sans-serif !important;
                font-weight: 700 !important;
                font-size: 12px !important;
                padding: 5px 12px !important;
                border-radius: 20px !important;
                text-transform: uppercase !important;
                z-index: 2 !important;
            }

            /* BOTÃO COMPRAR - PRETO com hover CIANO */
            .item-product .btn,
            .item-product .js-addtocart,
            .item-product .btn-product,
            .js-prod-submit-btn {
                background-color: #000000 !important;
                color: #FFFFFF !important;
                border: none !important;
                font-family: "Oswald", sans-serif !important;
                font-weight: 500 !important;
                text-transform: uppercase !important;
                font-size: 14px !important;
                padding: 12px 18px !important;
                border-radius: 6px !important;
                margin-top: 12px !important;
                transition: all 0.3s ease !important;
                letter-spacing: 1px !important;
            }

            .item-product .btn:hover,
            .item-product .js-addtocart:hover {
                background-color: #00D4FF !important;
                color: #000000 !important;
            }

            /* Botão Ver Carrinho */
            .js-cart-widget .btn,
            .cart-btn,
            a[href*="cart"] .btn {
                background-color: #00D4FF !important;
                color: #000000 !important;
            }

            /* ============================================
               ESPAÇAMENTO - White Space
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
               TÍTULOS DE SEÇÃO
            ============================================ */

            .section-title,
            section > h2,
            .home-section-title {
                font-family: "Oswald", sans-serif !important;
                font-weight: 700 !important;
                text-transform: uppercase !important;
                color: #1C2833 !important;
                font-size: 32px !important;
                letter-spacing: 1px !important;
                text-align: center !important;
                position: relative !important;
                padding-bottom: 15px !important;
            }

            /* Linha decorativa removida para visual mais limpo */
            .section-title::after,
            section > h2::after {
                display: none !important;
            }

            .section-title strong,
            .section-title span,
            .text-accent,
            .text-primary,
            .title-accent {
                color: #00D4FF !important;
            }

            /* ============================================
               CATEGORIAS - Grid com Cards Escuros
            ============================================ */

            .section-categories,
            .section-main-categories {
                background-color: #FFFFFF !important;
                padding: 60px 0 !important;
            }

            .item-category,
            .category-card {
                text-align: center !important;
                background: linear-gradient(135deg, #000000, #1D4E4F) !important;
                border-radius: 12px !important;
                padding: 0 !important;
                border: 2px solid transparent !important;
                position: relative !important;
                overflow: hidden !important;
                aspect-ratio: 1 !important;
                transition: transform 0.3s, box-shadow 0.3s, border-color 0.3s !important;
            }

            .item-category:hover,
            .category-card:hover {
                transform: scale(1.05) !important;
                border-color: #00D4FF !important;
                box-shadow: 0 10px 30px rgba(0,212,255,0.3) !important;
            }

            .item-category h3,
            .category-card h3,
            .category-name {
                font-family: "Oswald", sans-serif !important;
                font-weight: 500 !important;
                text-transform: uppercase !important;
                color: #FFFFFF !important;
                font-size: 14px !important;
                letter-spacing: 1px !important;
            }

            /* ============================================
               BOTÕES GERAIS - CIANO
            ============================================ */

            .btn-primary {
                background-color: #00D4FF !important;
                color: #000000 !important;
                border-color: #00D4FF !important;
                font-family: "Oswald", sans-serif !important;
                font-weight: 500 !important;
                text-transform: uppercase !important;
                border-radius: 30px !important;
                padding: 15px 40px !important;
                letter-spacing: 1px !important;
            }

            .btn-primary:hover,
            .btn-primary:focus {
                background-color: #00b8e6 !important;
                border-color: #00b8e6 !important;
                color: #000000 !important;
                transform: translateY(-2px) !important;
                box-shadow: 0 5px 20px rgba(0,212,255,0.4) !important;
            }

            .btn-secondary,
            .btn-outline-primary {
                background-color: transparent !important;
                border: 2px solid #00D4FF !important;
                color: #00D4FF !important;
                font-family: "Oswald", sans-serif !important;
                font-weight: 500 !important;
                text-transform: uppercase !important;
                border-radius: 30px !important;
                padding: 13px 38px !important;
                letter-spacing: 1px !important;
            }

            .btn-secondary:hover,
            .btn-outline-primary:hover {
                background-color: #00D4FF !important;
                color: #000000 !important;
            }

            /* ============================================
               DEPOIMENTOS - Com Estrelas
            ============================================ */

            .section-testimonials-home {
                background-color: #FFFFFF !important;
            }

            .section-testimonials-home .testimonial-item,
            .testimonial-card {
                background: #F8F9FA !important;
                border-radius: 12px !important;
                padding: 25px !important;
                text-align: center !important;
            }

            /* Estrelas de avaliação */
            .section-testimonials-home .testimonial-item::before,
            .testimonial-card::before {
                content: '★★★★★' !important;
                display: block !important;
                color: #f1c40f !important;
                font-size: 20px !important;
                margin-bottom: 15px !important;
                letter-spacing: 3px !important;
            }

            .section-testimonials-home .testimonial-text,
            .testimonial-card p {
                font-size: 16px !important;
                line-height: 1.6 !important;
                color: #1C2833 !important;
                font-style: italic !important;
            }

            .section-testimonials-home .testimonial-author,
            .testimonial-card .author {
                font-weight: 700 !important;
                color: #000000 !important;
                margin-top: 15px !important;
            }

            /* Avatar */
            .section-testimonials-home .testimonial-avatar,
            .testimonial-card .avatar {
                width: 60px !important;
                height: 60px !important;
                border-radius: 50% !important;
                margin: 0 auto 15px !important;
                background: #000000 !important;
                display: flex !important;
                align-items: center !important;
                justify-content: center !important;
                color: #FFFFFF !important;
                font-size: 24px !important;
            }

            /* ============================================
               NEWSLETTER - Gradiente Verde/Preto
            ============================================ */

            .section-newsletter-home,
            .section-newsletter-home-colors {
                background: linear-gradient(135deg, #1D4E4F 0%, #000000 100%) !important;
                padding: 60px 0 !important;
            }

            .section-newsletter-home h2,
            .section-newsletter-home-colors h2 {
                color: #FFFFFF !important;
                font-size: 32px !important;
                margin-bottom: 10px !important;
            }

            .section-newsletter-home h2 span,
            .section-newsletter-home-colors h2 span {
                color: #00D4FF !important;
            }

            .section-newsletter-home p,
            .section-newsletter-home-colors p {
                color: rgba(255,255,255,0.9) !important;
                font-size: 16px !important;
            }

            .section-newsletter-home .form-control {
                border-radius: 30px !important;
                border: 2px solid #00D4FF !important;
                background: rgba(255,255,255,0.1) !important;
                color: #FFFFFF !important;
                padding: 15px 20px !important;
            }

            .section-newsletter-home .form-control::placeholder {
                color: rgba(255,255,255,0.7) !important;
            }

            .section-newsletter-home .btn {
                background-color: #00D4FF !important;
                color: #000000 !important;
                border-radius: 30px !important;
                border: none !important;
                padding: 15px 30px !important;
            }

            .section-newsletter-home .btn:hover {
                background-color: #00b8e6 !important;
            }

            /* ============================================
               FOOTER - Preto
            ============================================ */

            footer,
            .js-footer {
                background-color: #000000 !important;
            }

            footer,
            footer p,
            footer a,
            footer li {
                color: rgba(255,255,255,0.8) !important;
            }

            footer h4,
            footer .h4 {
                color: #00D4FF !important;
                font-family: "Oswald", sans-serif !important;
                font-size: 16px !important;
                margin-bottom: 20px !important;
                text-transform: uppercase !important;
            }

            footer a:hover {
                color: #00D4FF !important;
            }

            /* Barra de trust - Verde escuro */
            .ep-footer-trust {
                background-color: #1D4E4F !important;
            }

            .ep-footer-trust .ep-trust-icon {
                color: #00D4FF !important;
                fill: #00D4FF !important;
            }

            /* Rodapé inferior */
            .footer-bottom,
            footer .copyright,
            .ep-footer-bottom {
                background-color: transparent !important;
                border-top: 1px solid rgba(255,255,255,0.1) !important;
            }

            /* Links de redes sociais */
            .ep-social-links a,
            footer .social-links a {
                background: rgba(255,255,255,0.1) !important;
                border: 1px solid transparent !important;
            }

            .ep-social-links a:hover,
            footer .social-links a:hover {
                background: #00D4FF !important;
                color: #000000 !important;
            }

            /* ============================================
               ELEMENTOS GERAIS
            ============================================ */

            .text-accent,
            .text-primary {
                color: #00D4FF !important;
            }

            .breadcrumb a {
                color: #1C2833 !important;
            }

            .breadcrumb a:hover {
                color: #00D4FF !important;
            }

            .whatsapp-btn,
            .js-whatsapp-btn {
                background-color: #25D366 !important;
                position: fixed !important;
                bottom: 30px !important;
                right: 30px !important;
                width: 60px !important;
                height: 60px !important;
                border-radius: 50% !important;
                display: flex !important;
                align-items: center !important;
                justify-content: center !important;
                box-shadow: 0 5px 20px rgba(37,211,102,0.4) !important;
                z-index: 999 !important;
            }

            .whatsapp-btn:hover,
            .js-whatsapp-btn:hover {
                transform: scale(1.1) !important;
                box-shadow: 0 8px 25px rgba(37,211,102,0.5) !important;
            }

            /* ============================================
               MODAL
            ============================================ */

            .modal-header {
                background-color: #000000 !important;
                color: #FFFFFF !important;
            }

            /* ============================================
               LINKS E INTERAÇÕES
            ============================================ */

            a {
                color: #1C2833 !important;
            }

            a:hover {
                color: #00D4FF !important;
            }

            /* ============================================
               SWIPER / CARROSSEL
            ============================================ */

            .swiper-button-prev,
            .swiper-button-next {
                color: #1C2833 !important;
            }

            .swiper-pagination-bullet-active {
                background-color: #00D4FF !important;
            }

            /* ============================================
               OVERRIDE FINAL - APLICAR PALETA CIANO
            ============================================ */

            /* Todos os botões primários - CIANO */
            .btn-primary,
            .btn-primary:visited,
            .btn-primary:active,
            .btn-primary:focus,
            button[type="submit"],
            input[type="submit"] {
                background-color: #00D4FF !important;
                border-color: #00D4FF !important;
                color: #000000 !important;
            }

            .btn-primary:hover {
                background-color: #00b8e6 !important;
                border-color: #00b8e6 !important;
            }

            /* Botões de produto - PRETO com hover CIANO */
            .item-product .btn,
            .item-product .js-addtocart,
            .js-addtocart,
            .js-prod-submit-btn {
                background-color: #000000 !important;
                border-color: #000000 !important;
                color: #FFFFFF !important;
            }

            .item-product .btn:hover,
            .item-product .js-addtocart:hover,
            .js-addtocart:hover,
            .js-prod-submit-btn:hover {
                background-color: #00D4FF !important;
                border-color: #00D4FF !important;
                color: #000000 !important;
            }

            /* Botões outline/secondary */
            .btn-secondary,
            .btn-outline-primary,
            .btn-link,
            .section-welcome-home .btn-link,
            .section-welcome-home .btn-secondary {
                background-color: transparent !important;
                border: 2px solid #00D4FF !important;
                color: #FFFFFF !important;
            }

            .btn-secondary:hover,
            .btn-outline-primary:hover,
            .btn-link:hover {
                background-color: #00D4FF !important;
                color: #000000 !important;
                border-color: #00D4FF !important;
            }

            /* Títulos de seção - span em CIANO */
            .section-title span,
            .home-section-title span,
            h2 span,
            .h2 span {
                color: #00D4FF !important;
            }

            /* Grid de produtos - 4 COLUNAS */
            .section-featured-home .row,
            .section-products-home .row,
            .js-products-featured-grid,
            .products-grid .row,
            [class*="section-"] .row:has(.item-product) {
                display: flex !important;
                flex-wrap: wrap !important;
                margin-left: -12px !important;
                margin-right: -12px !important;
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
                padding-left: 12px !important;
                padding-right: 12px !important;
                margin-bottom: 25px !important;
                flex: 0 0 25% !important;
                max-width: 25% !important;
                width: 25% !important;
            }

            /* Grid de categorias - 5 COLUNAS */
            .section-categories .row,
            .section-main-categories .row {
                display: flex !important;
                flex-wrap: wrap !important;
            }

            .section-categories .row > div,
            .section-main-categories .row > div {
                flex: 0 0 20% !important;
                max-width: 20% !important;
            }

            @media (max-width: 1024px) {
                .section-categories .row > div,
                .section-main-categories .row > div {
                    flex: 0 0 33.333% !important;
                    max-width: 33.333% !important;
                }
            }

            @media (max-width: 992px) {
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

            @media (max-width: 768px) {
                .section-categories .row > div,
                .section-main-categories .row > div {
                    flex: 0 0 50% !important;
                    max-width: 50% !important;
                }
            }

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
