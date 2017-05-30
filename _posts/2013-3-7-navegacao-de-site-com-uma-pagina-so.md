---
codigoTexto: 109
title: "Navegação de site com uma página só"
excerpt: >
  A resposta curta é: sim, dá pra fazer. Se você tem um site com bastante conteúdo, é melhor usar ajax (...), mas para um site com pouco conteúdo, você pode fazer tudo em uma página só...
img: /imagens/css-abbreviations.jpg
categories: HTML
tags: css, estilos, navegação, layout
---

Dúvida do meu amigo Pedro Albani:

> Gostaria de saber como fazer um "menu fixo" para todas as páginas de um site. Por exemplo, tenho um arquivo com o menu de navegação de um site, banner-home e rodapé. Sei como fazer isso usando php, gostaria de saber se é possível fazer usando html5 e css3. Bom, acho que consegui explicar a minha dúvida.
> 
> Estou procurando uma maneira de fazer um site bem simples, gostaria de saber se existe uma maneira de criar um layout fixo para todas as páginas, e quando clicou em outra categoria do menu, apenas o conteúdo da página abaixo foi carregado. Isso faz com o que a página seja carregada mais rápido, pois o menu, rodapé, banner não são recarregados.

A resposta curta é: sim, dá pra fazer. Eu faria uma ressalva. Se você tem um site com bastante conteúdo, é melhor [usar ajax (o javascript carrega o conteúdo externo e põe o resultado onde você mandar)]({% post_url 2013-6-5-ajax-caracteres-especiais-e-o-internet-explorer %}), mas para um site com pouco conteúdo, você pode fazer tudo em uma página só e através do CSS fazer com que apareça uma seção de cada vez. É uma ótima alternativa para muitos designers fazer o site com uma página só.

A navegação se dá através de hashtag (#):

{% highlight html %}

<a href="#algumasecao">Ir para "alguma seção"</a>

{% endhighlight %}


Você já deve ter visto isso funcionando em algum site. Quando clica no link com hatchtag, ele rola a página para mostrar algum elemento (se houver) que tenha um id correspondente ao nome chamado após o caractere de hatchtag (#). No caso do exemplo acima, você precisaria ter um elemento qualquer na página com um id correspondente, assim:

{% highlight html %}

<section id="algumasecao">
    <p>A página vai rolar até aqui.</p>
</section>

{% endhighlight %}


Mas até aqui ainda não é o que você queria. O truque no final é, através do CSS, ocultar as seções e mostrar somente a que for referenciada na url:

{% highlight css %}

section {
    display: none;
}

section:target {
    display: block;
}

{% endhighlight %}

O seletor de pseudo-classe `:target` serve para estilizar o elemento que estiver sendo identificado com a hashtag na barra de endereço. Quando você então clicar num link, o elemento referenciado pelo seu atributo `id` vai atender ao chamado do hashtag, criando a impressão de um site *superultrarrápido*.

Saiba mais sobre a pseudo-classe `:target`:

1. [:target - CSS \| MDN](https://developer.mozilla.org/pt-BR/docs/Web/CSS/:target)<br>
<small>The :target pseudo-class represents the unique element, if any, with an id matching the fragment identifier of the URI of the document.</small>
2. [CSS3 :target Selector - W3Schools](http://www.w3schools.com/cssref/sel_target.asp)<br>
<small>Well organized and easy to understand Web building tutorials with lots of examples of how to use HTML, CSS, JavaScript, SQL, PHP, and XML.</small>
3. [On :target \| CSS-Tricks](https://css-tricks.com/on-target/)<br>
<small>The :target pseudo selector in CSS is both pretty cool and pretty limited in what it can do. In this article we discuss some things it can be helpful with, its limitations, and some work arounds.</small>