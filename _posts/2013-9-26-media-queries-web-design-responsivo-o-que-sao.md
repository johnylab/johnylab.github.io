---
title: "Media Queries, Web Design Responsivo. O que são?"
excerpt: >
  Faça um design de site que atende diferentes tipos de dispositivos. A folha de estilos do site indica para qual meio de acesso as regras serão aplicadas, e para quais características.
img: /imagens/css-abbreviations.jpg
categories: CSS
tags: media queries, responsive, design responsivo
---

Responsive Web Design (<abbr title="Web Design Responsivo, na sigla em inglês">RWD</abbr>) é uma abordagem de web design em que são fornecidas estilizações diferentes conforme o meio de acesso que carrega uma página web. Você deve se lembrar de que há poucos anos havia uma tendência de grandes sites terem uma versão diferente de suas páginas para celular. Algo como <em>mobile.seusite.com.br</em>. Dessa forma era servido um site mais leve (ou não) e com design ajustado para celulares, por exemplo, enquanto a versão desktop do site permanecia disponível para telas maiores.

Acho que o maior incoveniente dessa técnica era a manutenção dobrada. Para cada alteração significativa no design ou funcionalidades do site, o desenvolvedor precisaria fazer a atualização duas vezes. Outro problema é que, em muitos casos, o usuário teria que carregar a versão principal do site e esperar que um script verificasse as características do ambiente, para redirecioná-lo, gerando uma demora indesejada e uso desnecessário de banda.

<img src="/imagens/Responsive_Design_Kinetic_Knowledge.jpg" alt="Web Design Responsivo" />

Neste pé surgiu o novo conceito: Web Design Responsivo. A folha de estilos do site indica para qual meio de acesso (tela, impressão, braile, leitores de tela) as regras serão aplicadas, e para quais características (tamanho da tela, resolução, cores, orientação).

<blockquote>
<strong>História</strong>
Ethan Marcotte cunhou o termo "web design responsivo" (RWD), em um <a href="http://alistapart.com/article/responsive-web-design" target="_blank">artigo da A List Apart</a>. Ele descreveu a teoria e a prática de web design responsivo em seu breve livro de 2011 intitulado Responsive Web Design. O design responsivo foi listado como número 2 no Top Web Design Trends de 2012 pela <a href="http://www.creativebloq.com/industry-trends/15-top-web-design-and-development-trends-2012-1123018" target="_blank">revista .net</a> depois da abordagem de Melhoria progressiva.
O site Mashable chamou o ano de 2013 <a href="http://mashable.com/2012/12/11/responsive-web-design/" target="_blank">Year of Responsive Web Design</a> ("Ano do design responsivo").
A revista Forbes fez uma reportagem <a href="http://www.forbes.com/sites/work-in-progress/2013/03/26/why-you-need-to-prioritize-responsive-design-right-now/" target="_blank">Why You Need to Prioritize Responsive Design Right Now</a> (Por que você precisa priorizar o design responsivo agora mesmo).
<small><a href="http://pt.wikipedia.org/wiki/Web_Design_Responsivo" target="_blank">Web Design Responsivo – Wikipédia, a enciclopédia livre</a></small>
</blockquote>

## Media Types

Primeiro vieram os <a href="http://tableless.com.br/o-que-sao-media-types/" target="_blank">media types do CSS</a>: era definido o meio na folha de estilos, ao importar estilos de outro arquivo, ou diretamente na tag <code>&lt;link></code> do HTML. Seria possível então gerar diferentes folhas de estilos para telas, impressoras, leitores de telas, celulares, etc. Veja como:

No HTML:

{% highlight html %}

<link rel="stylesheet" href="style.css" media="screen">
<link rel="stylesheet" href="style.css" media="print, handheld">

{% endhighlight %}

Na folha de estilos:

{% highlight html %}

@media print {
  /* Código CSS */
}

{% endhighlight %}

Ao importar:

{% highlight html %}

@import url("impressao.css") print;

{% endhighlight %}


Com a evolução dos dispositivos, um número sem fim de resoluções, formatos de tela, entre outras características do ambiente, tornaram os media types insuficientes para se entregar uma formatação confortável para todos os dispositivos. Veja mais em <a href="http://tableless.com.br/introducao-ao-responsive-web-design/" target="_blank">O que é Responsive Web Design?</a> Isso nos traz a uma solução mais flexível, usada atualmente para fazer sites responsivos: as Media Queries (consultas da mídia, em inglês do Google).

## Media Queries

<blockquote>
Uma media query consiste de um media type e zero ou mais expressões que apontam para condições específicas de um determinado tipo de mídia.
<small><a href="http://www.w3.org/TR/css3-mediaqueries/#media0" target="_blank">Media Queries - W3C Recommendation 19 June 2012</a></small>
</blockquote>

Para facilitar, aqui vai um exemplo:

{% highlight html %}

/* regra aplicada em todo lugar */
body { background: blue; }
 
/* aplicada em telas a partir de 320px */
@media screen and (min-width: 320px) {
   body { font-size: 80%; }
}
 
/* aplica em telas a partir de 480px em landscape (na horizontal) */
@media screen and (min-width: 480px) and (orientation: landscape) {
   nav { float: left; }
}

{% endhighlight %}


Como mostrado acima, após os estilos CSS gerais da página, são acrescentados os blocos iniciados por media queries (<code>@media</code>), que são destinados a dispositivos com características específicas (no nosso caso, apenas a largura da tela e orientação). As medidas usadas no exemplo se referem à largura (<em>width</em>) da <i>viewport</i>. Em dispositivos móveis, é o mesmo que a largura da tela. Em <i>desktops</i>, é a largura da janela do navegador. Neste último caso, torna-se possível testar os resultados ajustando o tamanho da janela. É claro que existem diferenças de implementação, e será mais confiável usar uma ferramenta de testes, ou o próprio dispositivo que você deseja atender. Veja mais <a href="http://mediaqueri.es/" target="_blank">exemplos de media queries</a>.

## O que as Media Queries não fazem

Uma possível armadilha ao utilizar media queries é o peso adicional do código e imagens de <i>background</i>. Emboras as "consultas da mídia" almejem atender melhor dispositivos com características específicas, acrescentar mais código para ajustar o conteúdo em telas pequenas vai ter um efeito justamente oposto de deixar o site mais leve. Além disso, definir imagens de fundo diferentes para telas diferentes, fará o celular baixar todas as imagens de fundo, mesmo que ele exiba apenas a versão mais leve.

Isso porque as media queries não impedem o navegador de baixar todo o conteúdo e código, independente das características de dispositivo indicadas. O CSS inteiro vai ter que ser carregado, e o navegador vai ter que baixar as imagens para calcular o resultado, antes de aplicar os estilos específicos das media queries.

Ainda não existe uma forma perfeita de fornecer imagens responsivas, de acordo com a largura de banda ou especificações do dispositivo. Muito trabalho tem sido feito, e muito há o que se discutir. Veja mais no <a href="http://responsiveimages.org/" target="_blank">Responsiveimages.org</a>.

Além disso, media queries não funcionam em navegadores antigos, como o Internet Explorer 8 (claro, sempre ele). O mais recomendado é que o conteúdo do site não dependa de estilos dentro das media queries para estar disponível, e que elas sirvam apenas para melhorar a experiência.

<blockquote>
Versões anteriores do IE (6, 7, 8), infelizmente, não entenderão as consultas de mídia, o que significa que nenhum estilo CSS dentro delas será processado por ele. Recomendamos que você faça as pazes com isso (ou use Chrome Frame), mas se não for possível, você pode usar <a href="https://github.com/scottjehl/Respond" target="_blank">Respond.js</a>, mas lembre-se que isso aumentará o volume de download, deixando o carregamento das páginas mais lento.
<small><a href="http://html5please.com/#media queries" target="_blank">HTML5 Please - Media Queries</a></small>
</blockquote>

## Conclusão

O ideal, como em tudo na vida, é utilizar as media queries com precaução, evitando o uso desnecessário. Sempre que possível, dê preferência para medidas relativas, como porcentagem e tamanho da fonte (em) para definir larguras, dispensando a necessidade de refazer o layout para cada medida de tela. Aproveite para criar menus mais acessíveis e adaptados à falta de espaço nas telas pequenas, e preencha melhor os espaços das laterais em telas maiores. Se o site ou aplicativo vai ser impresso, faça estilos específicos para impressão (<code>@media print</code>). Mas tenha sempre em mente que o objetivo é manter a melhor experiência possível para todos os usuários que vão acessar o site, garantindo acesso ao conteúdo da forma mais agradável possível.