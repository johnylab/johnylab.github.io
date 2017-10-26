---
title: Regras de CSS que todo web designer precisa saber
date: 2012-08-03 00:00:00 Z
categories:
- CSS
tags:
- css,
- estilos,
- layout
codigoTexto: 121
excerpt: Aqui vão 10 dicas do line25.com para soluções simples no seu código CSS.
img: "/imagens/tubos.jpg"
---

*Aqui vão 10 dicas do <a href="http://line25.com/articles/10-css-rules-every-web-designer-should-know" target="_blank">line25.com</a> para soluções simples no seu código CSS.*

### @media

{% highlight css %}

@media screen and (max-width: 960px) {
    /* Seus estilos aqui */
}

{% endhighlight %}


As regras @media, conhecidas como <em lang="em">media queries</em>, estão associadas com a criação de websites responsivos. São aqueles designs que se adaptam ao  formato de tela de cada dispositivo, ou o tamanho da janela do navegador. Faça uma <em lang="em">media query</em> usando as propriedades do tipo <code>min-width</code> para que as regras se apliquem a um determinado tamanho de tela.

Todos os navegadores modernos suportam este tipo de regras. Os antigos (IE6,7,8), infelizmente não entendem as regras em <em lang="em">media queries</em>, de modo que elas não serão passadas a eles. Mas é possível suportá-los com uma solução em javascript chamada <a href="https://github.com/scottjehl/Respond" target="_blank">Respond.js</a>.

### background-size

{% highlight css %}

body {
	background: url(image.jpg) no-repeat;
	background-size: 100%;
}

{% endhighlight %}


Uma propriedade considerada extremamente útil, e que atualmente tem suporte em todos os navegadores. Antes fazer com que uma imagem se ajustasse ao seu elemento pai podia custar muito javascript e testes, mas agora basta uma linha para se obter o efeito de imagem de fundo em tela cheia.

Atenção: certifique-se de que a sua imagem de fundo permanece legível ao acessar seu site em navegadores que não suportam essa propriedade, como o IE8. Também é recomendado que, ao usar <code>background-image</code>, use-se uma cor de fundo alternativa para o caso de a imagem de fundo não ser carregada.

### @font-face

{% highlight css %}

@font-face {
	font-family: Blackout;
	src: url("assests/blackout.ttf") format("truetype");
}

{% endhighlight %}


Já existem muitas fontes novas e distribuídas gratuitamente para se usar com <code>@font-face</code>. Você pode usar esse código para incorporar fontes disponíveis gratuitamente ao seu site, ou usar um serviço como o <a href="http://www.google.com/webfonts/" target="_blank">Google Webfonts</a> ou <a href="https://typekit.com/" target="_blank">Typekit</a>.

Para atender as inconsistências de implementação nos diferentes navegadores, não são necessárias soluções de programação, bastando fornecer a mesma fonte em diferentes formatos: WOFF é preferencial, seguido de TTF e EOT (para o Internet Explorer). Use o <a href="http://www.fontsquirrel.com/fontface/generator" target="_blank">Font Squirrel Generator</a> para converter fontes que você tem licensa para usar. Veja abaixo um exemplo de regra para servir fonte incorporada ao site que vai funcionar em todos os navegadores:

{% highlight css %}

@font-face {
	font-family: 'MinhaFamiliaDeFontes';
	src: url('minhafonte.eot?#iefix') format('embedded-opentype'), 
	     url('minhafonte.woff') format('woff'), 
	     url('minhafonte.ttf')  format('truetype'),
	     url('minhafonte.svg#nomeDaFonteSVG') format('svg');
	}

{% endhighlight %}


### margin: 0 auto;

{% highlight css %}

#container {
	margin: 0 auto;
}

{% endhighlight %}


A inteligente declaração <code>margin: 0 auto;</code> é o que faz o container principal do site ficar centralizado na janela. Surpreendentemente, nunca houve nas especificações das CSS uma forma de centralizar um elemento. Mas nós acabamos descobrindo a solução na margem automática. Adicione <code>margin: 0 auto;</code> para centralizar um bloco dentro de seu elemento pai.

### overflow: hidden

{% highlight css %}

.container {
	overflow: hidden;
}

{% endhighlight %}


Existem todo tipo de soluções para limpar os floats, mas uma forma pura e simples de preservar o alinhamento do layout quanto há elementos fluídos lateralmente é declarar <code>overflow: hidden;</code> no container dos elementos que terão <code>float</code>. Nenhum peso adicional no site e funciona perfeitamente em 90% dos casos.

### .clearfix

{% highlight css %}

.clearfix:after {
	content: "";
	display: block;
	clear: both;
	visibility: hidden;
	line-height: 0;
	height: 0;
}

{% endhighlight %}


Para os casos em que <code>overflow: hidden;</code> não resolve, use a técnica do clearfix. Não precisa usar o nome clearfix para suas classes. Faça seu código com as regras acima e aplique a classe ao layout em container que tem elementos fluídos.

### color: rgba();

{% highlight css %}

.btn {
	color: rgba(0,0,0,0.5);
}

{% endhighlight %}


Imagens PNG eram a única solução para dar efeitos de transparência, até que o CSS teve o avanço de implementar o modo de cores RGBa (a de alfa). Usando RGBa em vez de valores hexadecimais, você pode selecionar os valores de vermelho, verde e azul, além de um canal alfa, declarando, por exemplo, 0.5 para 50% de opacidade.

### input[type="text"]

{% highlight css %}

input[type="text"] {
	width: 200px;
}

{% endhighlight %}


O formato de seletores como <code>input[type="text"]</code> e outros seletores avançados representam um passo para o nível avançado de CSS. Seletores de atributos são muito úteis para estilizar elementos de acordo com determinadas condições sem a necessidade de criar novas classes. Muitos seletores são suportados inclusive pelas versões antigas do Internet Explorer.

### transform: rotate(30deg);

{% highlight css %}

.title {
	transform: rotate(30deg);
}

{% endhighlight %}


Embora não tenha muita utilidade prática, certas manipulações de elementos sem a necessidade de Javascript merecem ser lembradas. Pode-se criar ótimos efeitos de animação ao combinar rotação com transições CSS.

### a {outline: none;}

{% highlight css %}

a {outline: none;}

{% endhighlight %}

Sabe aquela linha pontilhada que aparece ao redor de um link ou outro elemento de interação ao ser clicado, estragando a beleza do seu layout? Declare <code>{outline: none;}</code> para removê-la, mas por questões de acessibilidade, não se esqueça de [adicionar o estado <code>:focus</code> para os seus links]({% post_url 2012-06-19-focus-no-hover %}). Se o problema não é a linha pontilhada e sim que ela não envolva a tela toda, declare <code>{overflow: auto; }</code> na sua folha de estilos.