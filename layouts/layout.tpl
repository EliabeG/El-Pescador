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

        {# El Pescador - CSS Override - Versão Conservadora (Apenas Cores e Fontes) #}
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Oswald:wght@400;500;700&family=Open+Sans:wght@400;600;700&display=swap');

            /* ============================================
               CSS VARIÁVEIS - El Pescador
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

            /* ============================================
               FONTES GLOBAIS
            ============================================ */

            body {
                font-family: "Open Sans", sans-serif !important;
                color: #1C2833 !important;
            }

            h1, h2, h3, h4, h5, h6,
            .h1, .h2, .h3, .h4, .h5, .h6 {
                font-family: "Oswald", sans-serif !important;
            }

            /* ============================================
               AD BAR - Barra de Anúncios
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

            /* ============================================
               HEADER - Cabeçalho
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
                border: 1px solid #00D4FF !important;
                color: #FFFFFF !important;
            }

            .head-main .form-control::placeholder {
                color: rgba(255,255,255,0.6) !important;
            }

            .head-main .js-cart-widget-amount {
                background-color: #00D4FF !important;
                color: #000000 !important;
            }

            /* ============================================
               NAVEGAÇÃO
            ============================================ */

            .desktop-nav-col,
            .nav-desktop {
                background-color: #000000 !important;
            }

            .nav-desktop-list a {
                color: #FFFFFF !important;
                font-family: "Oswald", sans-serif !important;
            }

            .nav-desktop-list a:hover {
                color: #00D4FF !important;
            }

            .nav-desktop-list .nav-item.active > a {
                color: #00D4FF !important;
            }

            .nav-desktop-list .dropdown-menu {
                background-color: #000000 !important;
                border-color: #00D4FF !important;
            }

            .nav-desktop-list .dropdown-item {
                color: #FFFFFF !important;
            }

            .nav-desktop-list .dropdown-item:hover {
                background-color: rgba(0,212,255,0.1) !important;
                color: #00D4FF !important;
            }

            .nav-hamburger-list a {
                color: #FFFFFF !important;
            }

            .js-modal-nav .modal-content {
                background-color: #000000 !important;
            }

            /* ============================================
               HERO / SLIDER / WELCOME
            ============================================ */

            /* Hero/Slider com gradiente e overlay para contraste */
            .section-slider,
            .section-slider-home,
            .section-welcome,
            .section-welcome-home {
                background: linear-gradient(135deg, #000000 0%, #1a1a2e 50%, #1D4E4F 100%) !important;
                position: relative !important;
                padding: 80px 0 !important;
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
                background: rgba(0,0,0,0.3) !important;
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

            /* Textos do Hero */
            .section-slider,
            .section-slider h1,
            .section-slider h2,
            .section-slider h3,
            .section-slider p,
            .section-slider a,
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

            /* Título principal grande */
            .section-welcome-home h2,
            .section-welcome h2,
            .section-slider h1 {
                font-size: 36px !important;
                font-weight: 700 !important;
                margin-bottom: 15px !important;
            }

            .section-slider .subtitle,
            .section-welcome .h5,
            .section-welcome h5,
            .section-welcome-home .js-welcome-message-title {
                color: #00D4FF !important;
                font-size: 18px !important;
                letter-spacing: 3px !important;
                text-transform: uppercase !important;
                text-shadow: none !important;
            }

            /* Botões CTA no Hero */
            .section-slider .btn-primary,
            .section-welcome .btn-primary,
            .section-welcome-home .btn-primary {
                background-color: #FF6B35 !important;
                color: #FFFFFF !important;
                border: none !important;
                padding: 15px 40px !important;
                font-size: 16px !important;
                border-radius: 30px !important;
                text-shadow: none !important;
                margin: 10px !important;
            }

            .section-slider .btn-primary:hover,
            .section-welcome .btn-primary:hover,
            .section-welcome-home .btn-primary:hover {
                background-color: #E85A2A !important;
                transform: translateY(-2px) !important;
                box-shadow: 0 5px 20px rgba(255,107,53,0.4) !important;
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
                margin: 10px !important;
            }

            .section-slider .btn-secondary:hover,
            .section-welcome .btn-secondary:hover,
            .section-welcome-home .btn-secondary:hover,
            .section-welcome-home .btn-link:hover {
                background: #00D4FF !important;
                color: #000000 !important;
            }

            /* ============================================
               SEÇÃO DE SERVIÇOS / BANNERS INFORMATIVOS
            ============================================ */

            .section-informative-banners,
            .section-informative-banners-colors {
                background-color: #1D4E4F !important;
            }

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

            .section-informative-banners .svg-icon-text,
            .section-informative-banners-colors .svg-icon-text {
                fill: #00D4FF !important;
                color: #00D4FF !important;
            }

            /* ============================================
               PRODUTOS - GRID ALINHADO (Fix "Dente de Serra")
            ============================================ */

            /* 1. FORÇAR IMAGENS QUADRADAS - Corrige alinhamento */
            .item-product {
                display: flex !important;
                flex-direction: column !important;
                height: 100% !important;
                background: #FFFFFF !important;
                border-radius: 8px !important;
                overflow: hidden !important;
                box-shadow: 0 2px 10px rgba(0,0,0,0.08) !important;
                transition: box-shadow 0.3s ease, transform 0.3s ease !important;
            }

            .item-product:hover {
                box-shadow: 0 8px 25px rgba(0,0,0,0.15) !important;
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
                background: #F8F9FA !important;
            }

            /* Imagem preenche o container quadrado */
            .item-product .item-image img,
            .item-product .img-fluid,
            .item-product picture img {
                width: 100% !important;
                height: 100% !important;
                object-fit: contain !important;
                object-position: center !important;
                background: #F8F9FA !important;
                padding: 10px !important;
            }

            /* 2. INFO DO PRODUTO - Altura flexível para alinhar botões */
            .item-product .item-info,
            .item-product .item-description {
                flex: 1 !important;
                display: flex !important;
                flex-direction: column !important;
                padding: 20px 15px !important;
                text-align: center !important;
            }

            /* Nome do produto - altura fixa para alinhar */
            .item-product .item-name,
            .item-product h3 {
                font-family: "Open Sans", sans-serif !important;
                font-weight: 600 !important;
                color: #1C2833 !important;
                font-size: 13px !important;
                text-transform: none !important;
                line-height: 1.4 !important;
                min-height: 36px !important;
                max-height: 36px !important;
                overflow: hidden !important;
                display: -webkit-box !important;
                -webkit-line-clamp: 2 !important;
                -webkit-box-orient: vertical !important;
                margin-bottom: 10px !important;
            }

            /* 3. PREÇO - Hierarquia visual (preço maior que nome) */
            .item-product .item-price,
            .item-product .js-price-display,
            .item-product .price,
            .js-product-price {
                color: #00D4FF !important;
                font-family: "Oswald", sans-serif !important;
                font-weight: 700 !important;
                font-size: 24px !important;
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

            /* Badge de desconto */
            .item-product .label,
            .item-product .js-offer-label,
            .product-label,
            .label-offer {
                position: absolute !important;
                top: 10px !important;
                left: 10px !important;
                background-color: #FF6B35 !important;
                color: #FFFFFF !important;
                font-family: "Oswald", sans-serif !important;
                font-weight: 700 !important;
                font-size: 12px !important;
                padding: 6px 14px !important;
                border-radius: 20px !important;
                text-transform: uppercase !important;
                z-index: 2 !important;
            }

            /* 4. BOTÃO COMPRAR - Cor vibrante de ação (Laranja) */
            .item-product .btn,
            .item-product .js-addtocart,
            .item-product .btn-product,
            .js-prod-submit-btn {
                background-color: #FF6B35 !important;
                color: #FFFFFF !important;
                border: none !important;
                font-family: "Oswald", sans-serif !important;
                font-weight: 600 !important;
                text-transform: uppercase !important;
                letter-spacing: 1px !important;
                font-size: 13px !important;
                padding: 12px 20px !important;
                border-radius: 25px !important;
                margin-top: 15px !important;
                transition: all 0.3s ease !important;
            }

            .item-product .btn:hover,
            .item-product .js-addtocart:hover {
                background-color: #E85A2A !important;
                color: #FFFFFF !important;
                transform: scale(1.02) !important;
            }

            /* Botão Ver Carrinho também laranja */
            .js-cart-widget .btn,
            .cart-btn,
            a[href*="cart"] .btn {
                background-color: #FF6B35 !important;
                color: #FFFFFF !important;
            }

            /* ============================================
               ESPAÇAMENTO (RESPIRO) - White Space
            ============================================ */

            /* Seções com mais padding */
            section,
            .section-featured-home,
            .section-categories,
            .section-main-categories,
            .section-banners-home {
                padding: 60px 0 !important;
            }

            /* Espaço entre título e conteúdo */
            .section-title,
            section > h2,
            .home-section-title {
                margin-bottom: 50px !important;
            }

            /* Espaçamento no grid de produtos */
            .row-grid,
            .products-grid,
            .js-products-featured-grid,
            .js-products-new-grid,
            .js-products-sale-grid {
                gap: 25px !important;
            }

            /* Container com padding lateral */
            .container {
                padding-left: 20px !important;
                padding-right: 20px !important;
            }

            /* ============================================
               TÍTULOS DE SEÇÃO - Hierarquia Visual
            ============================================ */

            .section-title,
            section > h2,
            .home-section-title {
                font-family: "Oswald", sans-serif !important;
                font-weight: 700 !important;
                text-transform: uppercase !important;
                color: #1C2833 !important;
                font-size: 28px !important;
                letter-spacing: 2px !important;
                text-align: center !important;
                position: relative !important;
                padding-bottom: 15px !important;
            }

            /* Linha decorativa abaixo do título */
            .section-title::after,
            section > h2::after {
                content: '' !important;
                display: block !important;
                width: 60px !important;
                height: 3px !important;
                background: #00D4FF !important;
                margin: 15px auto 0 !important;
            }

            /* Texto de destaque em ciano */
            .section-title strong,
            .section-title span,
            .text-accent,
            .text-primary,
            .title-accent {
                color: #00D4FF !important;
            }

            /* ============================================
               CATEGORIAS
            ============================================ */

            .section-categories,
            .section-main-categories {
                background-color: #FFFFFF !important;
            }

            .item-category,
            .category-card {
                text-align: center !important;
            }

            .item-category h3,
            .category-card h3,
            .category-name {
                font-family: "Oswald", sans-serif !important;
                font-weight: 500 !important;
                text-transform: uppercase !important;
                color: #1C2833 !important;
                font-size: 14px !important;
            }

            /* ============================================
               BOTÕES
            ============================================ */

            .btn-primary {
                background-color: #00D4FF !important;
                color: #000000 !important;
                border-color: #00D4FF !important;
                font-family: "Oswald", sans-serif !important;
                font-weight: 700 !important;
                text-transform: uppercase !important;
                border-radius: 25px !important;
                padding: 12px 30px !important;
            }

            .btn-primary:hover,
            .btn-primary:focus {
                background-color: #00B8E6 !important;
                border-color: #00B8E6 !important;
                color: #000000 !important;
            }

            .btn-secondary,
            .btn-outline-primary {
                background-color: transparent !important;
                border: 2px solid #00D4FF !important;
                color: #00D4FF !important;
                font-family: "Oswald", sans-serif !important;
                font-weight: 700 !important;
                text-transform: uppercase !important;
                border-radius: 25px !important;
                padding: 10px 28px !important;
            }

            .btn-secondary:hover,
            .btn-outline-primary:hover {
                background-color: #00D4FF !important;
                color: #000000 !important;
            }

            /* ============================================
               NEWSLETTER
            ============================================ */

            .section-newsletter-home,
            .section-newsletter-home-colors {
                background-color: #1D4E4F !important;
            }

            .section-newsletter-home h2,
            .section-newsletter-home-colors h2,
            .section-newsletter-home p,
            .section-newsletter-home-colors p {
                color: #FFFFFF !important;
            }

            /* ============================================
               FOOTER
            ============================================ */

            footer,
            .js-footer {
                background-color: #000000 !important;
            }

            footer,
            footer p,
            footer a,
            footer h4,
            footer .h4,
            footer li {
                color: #FFFFFF !important;
            }

            footer h4,
            footer .h4 {
                color: #00D4FF !important;
                font-family: "Oswald", sans-serif !important;
            }

            footer a:hover {
                color: #00D4FF !important;
            }

            /* ============================================
               ELEMENTOS GERAIS
            ============================================ */

            .text-accent,
            .text-primary {
                color: #00D4FF !important;
            }

            .breadcrumb a {
                color: #00D4FF !important;
            }

            .whatsapp-btn,
            .js-whatsapp-btn {
                background-color: #25D366 !important;
            }

            /* ============================================
               MODAL
            ============================================ */

            .modal-header {
                background-color: #000000 !important;
                color: #FFFFFF !important;
            }

            /* ============================================
               SWIPER / CARROSSEL - Não interferir
            ============================================ */

            .swiper-wrapper,
            .swiper-slide {
                /* Manter comportamento original */
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
