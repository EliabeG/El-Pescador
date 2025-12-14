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

            .section-slider,
            .section-slider-home,
            .section-welcome {
                background-color: #1D4E4F !important;
            }

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
            .section-welcome p {
                color: #FFFFFF !important;
            }

            .section-slider .subtitle,
            .section-welcome .h5,
            .section-welcome h5 {
                color: #00D4FF !important;
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
               PRODUTOS
            ============================================ */

            .item-product .item-name,
            .item-product h3 {
                font-family: "Oswald", sans-serif !important;
                color: #1C2833 !important;
            }

            .item-product .item-price {
                color: #00D4FF !important;
                font-family: "Oswald", sans-serif !important;
                font-weight: 700 !important;
            }

            .item-product .price-compare {
                color: #999 !important;
            }

            .item-product .label {
                background-color: #E74C3C !important;
                color: #FFFFFF !important;
            }

            /* ============================================
               BOTÕES
            ============================================ */

            .btn-primary {
                background-color: #00D4FF !important;
                color: #000000 !important;
                border-color: #00D4FF !important;
            }

            .btn-primary:hover,
            .btn-primary:focus {
                background-color: #00B8E6 !important;
                border-color: #00B8E6 !important;
                color: #000000 !important;
            }

            .btn-secondary {
                border-color: #1C2833 !important;
                color: #1C2833 !important;
            }

            .btn-secondary:hover {
                background-color: #1C2833 !important;
                color: #FFFFFF !important;
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
