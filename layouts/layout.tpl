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

        {# El Pescador - CSS Override - Nova Identidade Visual (Natureza/Pesca) #}
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Oswald:wght@400;500;700&family=Open+Sans:wght@400;600;700&display=swap');

            /* ============================================
               CSS VARIÁVEIS - El Pescador
               Nova Paleta: Branco + Navy Blue + Laranja
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

                /* Cores El Pescador */
                --ep-navy: #1B3A57;
                --ep-navy-dark: #152D45;
                --ep-orange: #E67E22;
                --ep-orange-dark: #D35400;
                --ep-gray-light: #F5F7FA;
                --ep-gray: #95A5A6;
                --ep-text: #2C3E50;
                --ep-white: #FFFFFF;
            }

            /* ============================================
               FONTES GLOBAIS
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
               AD BAR - Barra de Anúncios (Navy Blue)
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
               HEADER - Cabeçalho (Navy Blue)
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
               NAVEGAÇÃO (Navy Blue)
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
               HERO / SLIDER / WELCOME - Design Limpo
            ============================================ */

            /* Hero com gradiente suave navy */
            .section-slider,
            .section-slider-home,
            .section-welcome,
            .section-welcome-home {
                background: linear-gradient(135deg, #1B3A57 0%, #2C5282 50%, #1B3A57 100%) !important;
                position: relative !important;
                padding: 60px 0 !important;
            }

            /* Overlay suave */
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

            /* Conteúdo acima do overlay */
            .section-slider .container,
            .section-slider-home .container,
            .section-welcome .container,
            .section-welcome-home .container {
                position: relative !important;
                z-index: 2 !important;
            }

            /* Textos do Hero - SEM logo grande */
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

            /* Título principal - Frase impactante */
            .section-welcome-home h2,
            .section-welcome h2,
            .section-slider h1 {
                font-size: 42px !important;
                font-weight: 700 !important;
                margin-bottom: 15px !important;
                line-height: 1.2 !important;
            }

            /* Subtítulo */
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

            /* Botões CTA no Hero - LARANJA */
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
               SEÇÃO DE SERVIÇOS - FUNDO BRANCO
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

            /* Ícones com círculo navy */
            .section-informative-banners .service-icon-container,
            .section-informative-banners .banner-service-icon {
                background-color: #F5F7FA !important;
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
                padding: 15px !important;
                text-align: left !important;
            }

            /* Nome do produto - SEM MAIÚSCULAS */
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

            /* PREÇO - Navy Blue */
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

            .item-product .price-compare,
            .item-product .js-compare-price-display {
                color: #95A5A6 !important;
                text-decoration: line-through !important;
                font-size: 13px !important;
                margin-bottom: 3px !important;
            }

            /* Badge de desconto - Laranja */
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

            /* BOTÃO COMPRAR - LARANJA */
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

            /* Botão Ver Carrinho */
            .js-cart-widget .btn,
            .cart-btn,
            a[href*="cart"] .btn {
                background-color: #E67E22 !important;
                color: #FFFFFF !important;
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
                color: #2C3E50 !important;
                font-size: 26px !important;
                letter-spacing: 1px !important;
                text-align: center !important;
                position: relative !important;
                padding-bottom: 15px !important;
            }

            /* Linha decorativa - Laranja */
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
               CATEGORIAS
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
               BOTÕES GERAIS
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
               DEPOIMENTOS - Com Estrelas
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

            /* Estrelas de avaliação */
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

            /* Avatar */
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
               NEWSLETTER - Navy Blue, Compacto
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
               FOOTER - Navy Blue
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

            /* Rodapé inferior - mais escuro */
            .footer-bottom,
            footer .copyright {
                background-color: #152D45 !important;
                border-top: 1px solid rgba(255,255,255,0.1) !important;
            }

            /* ============================================
               ELEMENTOS GERAIS
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

            /* ============================================
               MODAL
            ============================================ */

            .modal-header {
                background-color: #1B3A57 !important;
                color: #FFFFFF !important;
            }

            /* ============================================
               LINKS E INTERAÇÕES
            ============================================ */

            a {
                color: #1B3A57 !important;
            }

            a:hover {
                color: #E67E22 !important;
            }

            /* ============================================
               SWIPER / CARROSSEL
            ============================================ */

            .swiper-button-prev,
            .swiper-button-next {
                color: #1B3A57 !important;
            }

            .swiper-pagination-bullet-active {
                background-color: #E67E22 !important;
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
