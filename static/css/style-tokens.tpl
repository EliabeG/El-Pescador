{# /* Style tokens - El Pescador - Loja de Artigos de Pesca */ #}

:root {

  {#/*============================================================================
    #Cores - El Pescador (CSS Direto - Sem Variáveis de Template)
  ==============================================================================*/#}

  /* Cores principais - El Pescador */
  --main-foreground: #1C2833;
  --main-background: #FFFFFF;

  --accent-color: #00D4FF;

  --button-background: #00D4FF;
  --button-foreground: #000000;

  --label-background: #E74C3C;
  --label-foreground: #FFFFFF;

  /* Cabeçalho/Rodapé/Navegação - El Pescador */
  --adbar-background: #000000;
  --adbar-foreground: #00D4FF;

  --header-background: #000000;
  --header-foreground: #FFFFFF;
  --header-transparent-foreground: #FFFFFF;

  --footer-background: #000000;
  --footer-foreground: #FFFFFF;

  --newsletter-background: #1D4E4F;
  --newsletter-foreground: #FFFFFF;

  --services-background: #1D4E4F;
  --services-foreground: #FFFFFF;

  /* Variantes de cor - Opacidades */
  --main-foreground-opacity-03: #1C283308;
  --main-foreground-opacity-05: #1C28330D;
  --main-foreground-opacity-07: #1C283312;
  --main-foreground-opacity-10: #1C28331A;
  --main-foreground-opacity-20: #1C283333;
  --main-foreground-opacity-30: #1C28334D;
  --main-foreground-opacity-40: #1C283366;
  --main-foreground-opacity-50: #1C283380;
  --main-foreground-opacity-80: #1C2833CC;

  --main-background-opacity-20: #FFFFFF33;
  --main-background-opacity-30: #FFFFFF4D;
  --main-background-opacity-50: #FFFFFF80;
  --main-background-opacity-80: #FFFFFFCC;
  --main-background-opacity-90: #FFFFFFE6;
  --main-background-opacity-95: #FFFFFFF2;

  --header-foreground-opacity-20: #FFFFFF33;
  --header-foreground-opacity-30: #FFFFFF4D;

  --news-foreground-opacity-30: #FFFFFF4D;
  --news-foreground-opacity-50: #FFFFFF80;

  --footer-foreground-opacity-10: #FFFFFF1A;
  --footer-foreground-opacity-20: #FFFFFF33;
  --footer-foreground-opacity-30: #FFFFFF4D;
  --footer-foreground-opacity-60: #FFFFFF99;
  --footer-foreground-opacity-80: #FFFFFFCC;

  /* Cores de alerta - Feedback do sistema */
  --success: #4bb98c;
  --danger: #dd7774;
  --warning: #dc8f38;
  --info: #71b5dc;

  {#/*============================================================================
    #Tipografia - El Pescador (Oswald + Open Sans)
  ==============================================================================*/#}

  --heading-font: "Oswald", sans-serif;
  --body-font: "Open Sans", sans-serif;

  /* Tamanhos de fonte */
  --h1: 32px;
  --h1-huge: 34px;
  --h1-huge-md: 48px;
  --h2: 28px;
  --h3: 24px;
  --h4: 22px;
  --h5: 20px;
  --h6: 18px;
  --h6-small: 16px;

  --font-huge: 24px;
  --font-large: 18px;
  --font-big: 16px;
  --font-base: 14px;
  --font-small: 12px;
  --font-smallest: 10px;

  --title-font-weight: 700;

  {#/*============================================================================
    #Larguras - Container e layout
  ==============================================================================*/#}

  --container-width: 1260px;
  --container-width-large: 1200px;
  --container-width-medium: 960px;

  {#/*============================================================================
    #Espaçamentos - Gutters e margens
  ==============================================================================*/#}

  --gutter: 15px;
  --guter-container: 30px;
  --guter-container-md: 40px;
  --gutter-negative: calc(var(--gutter) * -1);
  --gutter-half: calc(var(--gutter) / 2);
  --gutter-half-negative: calc(var(--gutter) * -1 / 2);
  --gutter-double: calc(var(--gutter) * 2);

  {#/*============================================================================
    #Diversos - Bordas, sombras e utilitários
  ==============================================================================*/#}

  --border-radius: 4px;
  --border-radius-half: calc(var(--border-radius) / 2);
  --border-radius-quarter: calc(var(--border-radius) / 4);
  --border-radius-circle: 100%;
  --border-solid: 1px solid;
  --border-dashed: 1px dashed;

  --shadow-distance: 0 0 5px;

}
