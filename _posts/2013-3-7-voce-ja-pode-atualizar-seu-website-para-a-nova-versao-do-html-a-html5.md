---
title: "Você já pode atualizar seu website para a nova versão do HTML: a HTML5"
excerpt: >
  A nova versão da HTML já é uma realidade, e ainda é possível manter o suporte a navegadores antigos sem deixar de aproveitar o HTML5 em seu website. Com a ajuda de javascript, é possível manter o design inclusive no Internet Explorer 6, 7, 8...
img: /imagens/HTML-5-Logotipo-Oficial.png
categories: HTML
tags: HTML5, padrões, Web Standards, Internet Explorer
---

Essa é a pergunta recorrente na área de desenvolvimento web atualmente, e muitos já responderam, mas poucos mostram de fato como fazer para começar a desenvolver de acordo com a futura especificação do HTML, sem esbarrar nas diferenças de implementação de cada navegador. Muitos já responderam essa pergunta, mas poucos mostram como é possível fazer com que o HTML funcione direito em navegadores antigos, como Internet Explorer 6, 7 e 8.

## E a pergunta que não quer calar: já é viável fazer sites em HTML5?

Sim e com certeza você já pode usar HTML5 para desenvolver websites e aplicativos web (este site já usa). Isso porque muitas funcionalidades já estão implementadas nos navegadores modernos, sem deixar de apresentar um conteúdo acessível para os mais antigos. Esse princípio inclusive faz parte da especificação, chama-se retrocompatibilidade.

<blockquote>
O WHATWG tem mantido o foco para manter a retrocompatibilidade. Nenhum site deverá ter de ser refeito totalmente para se adequar aos novos conceitos e regras. O HTML5 está sendo criado para que seja compatível com os browsers recentes, possibilitando a utilização das novas características imediatamente.
<small><a href="http://www.w3c.br/cursos/html5/conteudo/capitulo1.html" target="_blank">Visão geral do HTML5 - W3C Brasil</a></small>
</blockquote>

## html5shiv

Para o Internet Explorer existe um "calço" (<em lang="en">shim</em> em inglês) em javascript que permite ao navegador reconhecer as novas tags, de modo que o seu CSS seja executado corretamente.


{% highlight html %}

<!--[if lt IE 9]>
<script src="js/html5shiv.js"></script>
<![endif]-->

{% endhighlight %}


Aqui é utilizado um código de comentário condicional, que o IE entende como uma condição para incluir o script. No caso do exemplo, se a versão do IE for inferior a 9. Acesse <a href="http://code.google.com/p/html5shiv/" target="_blank">html5shiv no Google Code</a> para baixar o arquivo e saber mais. Ou veja como criar um código parecido <a href="http://johnylab.net/?id=103" title="Impressão do HTML5 no Internet Explorer">neste outro artigo</a>.

## Modernizr

Se você pretende fazer mais do que estilizar o site com CSS, pode precisar de uma biblioteca mais completa, chamada <a href="http://modernizr.com/" target="_blank">Modernizr</a>. O Modernizr é uma biblioteca de detectação que lhe permite verificar o suporte da maioria das características do HTML5 e CSS3. Além de incluir automaticamente classes especiais na tag &lt;html>, cria um objeto javascript Modernizr, que tem as propriedades correspondentes a cada funcionalidade para testar se o objeto desejado está disponível no navegador.


{% highlight html %}

if (Modernizr.geolocation) {
	  // Aceita a feature
	} else {
	  // Não aceita a feature testada. 
	}

{% endhighlight %}


## Fontes de consulta

Para mais informações e recursos, acesse estes links:

- <a href="http://html5boilerplate.com/" target="_blank">HTML5 &#9733; Boilerplate</a>
- <a href="http://html5please.com/" target="_blank">HTML5 PLEASE</a>
- <a href="http://simon.html5.org/html-elements" target="_blank">HTML Elements and Attributes</a>
- <a href="http://thecodeplayer.com/" target="_blank">TheCodePlayer</a>
