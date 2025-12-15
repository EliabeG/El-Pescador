{# /*============================================================================
  El Pescador - Footer Profissional
  Design: Preto + Ciano
==============================================================================*/ #}

{% set has_social_network = store.facebook or store.twitter or store.pinterest or store.instagram or store.tiktok or store.youtube %}
{% set has_footer_contact_info = (store.whatsapp or store.phone or store.email or store.address or store.blog) and settings.footer_contact_show %}

{% set has_footer_logo = "footer_logo.jpg" | has_custom_image %}
{% set has_footer_menu = settings.footer_menu and settings.footer_menu_show %}
{% set has_payment_logos = settings.payments %}
{% set has_shipping_logos = settings.shipping %}
{% set has_shipping_payment_logos = has_payment_logos or has_shipping_logos %}
{% set has_languages = languages | length > 1 and settings.languages_footer %}

{% set has_seal_logos = store.afip or ebit or settings.custom_seal_code or ("seal_img.jpg" | has_custom_image) %}
{% set show_help = not has_products and not has_social_network %}

{# Barra de Diferenciais - Verde Escuro #}
<section class="ep-footer-trust py-4" data-store="footer-trust" style="background: #1D4E4F;">
	<div class="container">
		<div class="row justify-content-center text-center">
			<div class="col-6 col-md-3 mb-3 mb-md-0">
				<div class="ep-trust-item">
					<svg class="icon-inline icon-2x mb-2" style="color: #00D4FF;"><use xlink:href="#security"/></svg>
					<div class="font-small font-weight-bold" style="color: #fff;">{{ "Compra Segura" | translate }}</div>
					<div class="font-smallest" style="color: rgba(255,255,255,0.7);">{{ "Site 100% protegido" | translate }}</div>
				</div>
			</div>
			<div class="col-6 col-md-3 mb-3 mb-md-0">
				<div class="ep-trust-item">
					<svg class="icon-inline icon-2x mb-2" style="color: #00D4FF;"><use xlink:href="#box-alt"/></svg>
					<div class="font-small font-weight-bold" style="color: #fff;">{{ "Envio Rapido" | translate }}</div>
					<div class="font-smallest" style="color: rgba(255,255,255,0.7);">{{ "Para todo o Brasil" | translate }}</div>
				</div>
			</div>
			<div class="col-6 col-md-3 mb-3 mb-md-0">
				<div class="ep-trust-item">
					<svg class="icon-inline icon-2x mb-2" style="color: #00D4FF;"><use xlink:href="#returns"/></svg>
					<div class="font-small font-weight-bold" style="color: #fff;">{{ "Troca Garantida" | translate }}</div>
					<div class="font-smallest" style="color: rgba(255,255,255,0.7);">{{ "Ate 7 dias" | translate }}</div>
				</div>
			</div>
			<div class="col-6 col-md-3">
				<div class="ep-trust-item">
					<svg class="icon-inline icon-2x mb-2" style="color: #00D4FF;"><use xlink:href="#whatsapp-line"/></svg>
					<div class="font-small font-weight-bold" style="color: #fff;">{{ "Atendimento" | translate }}</div>
					<div class="font-smallest" style="color: rgba(255,255,255,0.7);">{{ "Seg-Sex 9h as 18h" | translate }}</div>
				</div>
			</div>
		</div>
	</div>
</section>

<footer class="js-footer js-hide-footer-while-scrolling display-when-content-ready overflow-none ep-footer {% if settings.footer_colors %}footer-colors{% endif %}" data-store="footer" style="background: #000;">
	<div class="container py-5">
		<div class="row">
			{# Coluna 1: Logo e Sobre #}
			<div class="col-12 col-md-4 mb-4 mb-md-0 text-center text-md-left">
				{% if has_footer_logo and template != 'password' %}
					<div class="mb-3">
						<img src="{{ 'images/empty-placeholder.png' | static_url }}" data-src="{{ 'footer_logo.jpg' | static_url('large') }}" alt="{{ store.name }}" title="{{ store.name }}" class="footer-logo-img lazyload" style="max-width: 120px; border-radius: 50%; border: 2px solid #00D4FF;">
					</div>
				{% endif %}
				<p class="font-small mb-3" style="color: rgba(255,255,255,0.8);">
					{{ "Especialistas em equipamentos de pesca desde 2010. Qualidade e confianca para sua melhor experiencia." | translate }}
				</p>
				{% if has_social_network %}
					<div class="ep-social-links mb-3">
						{% include "snipplets/social/social-links.tpl" %}
					</div>
				{% endif %}
			</div>

			{# Coluna 2: Menu e Links #}
			<div class="col-6 col-md-2 mb-4 mb-md-0">
				{% if template != 'password' %}
					{% if has_footer_menu %}
						<h4 class="h6 mb-3 font-weight-bold" style="color: #00D4FF; font-family: 'Oswald', sans-serif; text-transform: uppercase;">{{ "Links Uteis" | translate }}</h4>
						<div class="ep-footer-links">
							{% include "snipplets/navigation/navigation-foot.tpl" %}
						</div>
					{% endif %}
				{% endif %}
			</div>

			{# Coluna 3: Contato #}
			<div class="col-6 col-md-3 mb-4 mb-md-0">
				{% if has_footer_contact_info %}
					<h4 class="h6 mb-3 font-weight-bold" style="color: #00D4FF; font-family: 'Oswald', sans-serif; text-transform: uppercase;">{{ "Contato" | translate }}</h4>
					<div class="ep-footer-contact">
						{% include "snipplets/contact-links.tpl" with {footer: true, with_icons: true} %}
					</div>
				{% endif %}
			</div>

			{# Coluna 4: Newsletter #}
			<div class="col-12 col-md-3">
				{% if template != 'password' %}
					{% if settings.news_show %}
						<h4 class="h6 mb-3 font-weight-bold" style="color: #00D4FF; font-family: 'Oswald', sans-serif; text-transform: uppercase;">{{ "Ofertas Exclusivas" | translate }}</h4>
						<p class="font-small mb-2" style="color: rgba(255,255,255,0.8);">{{ "Cadastre-se e receba promocoes especiais!" | translate }}</p>
						<div class="ep-newsletter">
							{% include 'snipplets/newsletter.tpl' %}
						</div>
					{% endif %}
				{% endif %}
			</div>
		</div>

		{# Separador #}
		<hr class="my-4" style="border-color: rgba(255,255,255,0.1);">

		{# Logos de Pagamento e Envio #}
		{% if template != 'password' %}
			{% if has_shipping_payment_logos %}
				<div class="row mb-4 text-center">
					{% if has_payment_logos %}
						<div class="col-12 col-md-6 mb-3 mb-md-0">
							<h5 class="font-small font-weight-bold mb-2" style="color: #fff;">{{ "Formas de Pagamento" | translate }}</h5>
							<div class="footer-payments-shipping-logos d-inline-block align-middle">
								{{ component('payment-shipping-logos', {'type' : 'payments'}) }}
							</div>
						</div>
					{% endif %}

					{% if has_shipping_logos %}
						<div class="col-12 col-md-6">
							<h5 class="font-small font-weight-bold mb-2" style="color: #fff;">{{ "Envio por" | translate }}</h5>
							<div class="footer-payments-shipping-logos d-inline-block align-middle">
								{{ component('payment-shipping-logos', {'type' : 'shipping'}) }}
							</div>
						</div>
					{% endif %}
				</div>
			{% endif %}

			{# Language selector #}
			{% if has_languages %}
				<div class="text-center mb-3">
					<a href="#" data-toggle="#languages" class="js-modal-open btn-link font-small" style="color: #00D4FF;">{{ "Idiomas y monedas" | translate }}</a>
					{% embed "snipplets/modal.tpl" with{modal_id: 'languages', modal_class: 'bottom modal-centered-small', modal_position: 'center', modal_transition: 'slide', modal_header_title: true, modal_footer: false, modal_width: 'centered', modal_zindex_top: true} %}
						{% block modal_head %}
							{{ 'Idiomas y monedas' | translate }}
						{% endblock %}
						{% block modal_body %}
							{% include "snipplets/navigation/navigation-lang.tpl" %}
						{% endblock %}
					{% endembed %}
				</div>
			{% endif %}

			{# AFIP - EBIT - Custom Seal #}
			{% if has_seal_logos %}
				<div class="row text-center justify-content-center mb-3">
					<div class="col-auto">
						{% if store.afip or ebit %}
							{% if store.afip %}
								<div class="footer-logo afip seal-afip d-inline-block mx-2">
									{{ store.afip | raw }}
								</div>
							{% endif %}
							{% if ebit %}
								<div class="footer-logo ebit seal-ebit d-inline-block mx-2">
									{{ ebit }}
								</div>
							{% endif %}
						{% endif %}
						{% if "seal_img.jpg" | has_custom_image or settings.custom_seal_code %}
							{% if "seal_img.jpg" | has_custom_image %}
								<div class="footer-logo custom-seal d-inline-block mx-2">
									{% if settings.seal_url != '' %}
										<a href="{{ settings.seal_url | setting_url }}" target="_blank">
									{% endif %}
										<img src="{{ 'images/empty-placeholder.png' | static_url }}" data-src="{{ "seal_img.jpg" | static_url }}" class="custom-seal-img lazyload" alt="{{ 'Sello de' | translate }} {{ store.name }}"/>
									{% if settings.seal_url != '' %}
										</a>
									{% endif %}
								</div>
							{% endif %}
							{% if settings.custom_seal_code %}
								<div class="custom-seal custom-seal-code d-inline-block mx-2">
									{{ settings.custom_seal_code | raw }}
								</div>
							{% endif %}
						{% endif %}
					</div>
				</div>
			{% endif %}
		{% endif %}

		{# Copyright e Creditos #}
		<div class="ep-footer-bottom text-center pt-3" style="border-top: 1px solid rgba(255,255,255,0.1);">
			<div class="mb-2">
				{{ new_powered_by_link }}
			</div>
			<div class="d-inline-block mr-md-2 font-smallest" style="color: rgba(255,255,255,0.7);">
				{{ "Copyright {1} - {2}. Todos los derechos reservados." | translate( (store.business_name ? store.business_name : store.name) ~ (store.business_id ? ' - ' ~ store.business_id : ''), "now" | date('Y') ) }}
			</div>
			{{ component('claim-info', {
					container_classes: "d-md-inline-block mt-md-0 mt-3 font-smallest",
					divider_classes: "mx-1 d-none d-md-inline-block",
					text_classes: {text_consumer_defense: 'd-inline-block mb-2'},
					link_classes: {
						link_consumer_defense: "btn-link font-smallest",
						link_order_cancellation: "btn-link font-smallest d-md-inline-block d-block mb-2 w-100 w-md-auto",
					},
				})
			}}
		</div>
	</div>
</footer>
