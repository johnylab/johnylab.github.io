---
title: Conteúdo pop-up com CSS e Javascript
date: 2012-06-21 00:00:00 Z
categories:
- JavaScript
tags:
- pop-up,
- JavaScript,
- CSS
codigoTexto: 80
excerpt: 'Gere uma janela pop-up utilizando css e Javascript.
  Com este código simples é possível fazer modais para aplicativos ou adaptá-lo
  para várias necessidades de UI.
'
img: "/imagens/tubos.jpg"
---

> O pop-up é um tipo de janela que se abre no navegador ao visitar uma página web ou acessar uma hiperligação específica. O pop-up é utilizado por criadores de sites para abrir alguma informação extra ou como meio de propaganda.
>
> --- [Pop-up – Wikipédia, a enciclopédia livre](https://pt.wikipedia.org/wiki/Pop-up)

O código abaixo, adaptado de um exemplo da Wikipédia, mostra como criar uma janela pop-up baseada em CSS, que torna-se visível quando uma função em JavaScript altera o atributo <code>display</code> e uma DIV é exibida por cima da página:

{% highlight html %}

<style type="text/css">
  .popup{
     position: fixed;
     top: 0; bottom: 0;
     left: 0; right: 0;
     margin: auto;
     width: 300px;
     height: 150px;
     padding: 20px;
     border: solid 1px #331;
     background: #ffffd0;
     display: none;
  }
</style>

<script type="text/javascript">

   function fechar(){
     document.getElementById('popup').style.display = 'none';
   }

   function abrir(){
     document.getElementById('popup').style.display = 'block';
   }

</script>

<body>...

<div id="popup" class="popup"> 
  <p>Conteúdo do pop-up aqui.</p>
  <p><small class="fechar"><a href="javascript: fechar();">Fechar pop-up</a></small></p>
</div>

<p>
  <a href="javascript: abrir();">Abrir POPUP</a>
  <a href="javascript: fechar();">Fechar POPUP</a>
</p>

{% endhighlight %}

1. A propriedade <code>position: fixed</code> manterá o conteúdo pop-up sempre visível, mesmo que o usuário role a página.
1. O conteúdo é ocultado com <code>diplay: none</code>.
1. A função <code>abrir</code> muda a propriedade <code>display</code> para <code>block</code>, tornando o pop-up visível.
1. A função <code>fechar</code> apenas retorna o pop-up ao seu estado original aplicando novamente o estilo <code>display: none</code>.

## Revisitando os pop-ups

Basicamente, o modal ou pop-up funciona muito bem, mas faltam algumas melhorias. Quando o conteúdo é exibido, ele surge de repente na tela, sem nenhuma animação. Vamos fazer um pop-up mais estiloso, e talvez dispensar a necessidade de Javascript:

{% highlight css %}

.pop {
  position: fixed;
  top: 120%;
  left: 120%;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.3);
  opacity: 0;
  -webkit-transition: opacity 0.3s ease-in-out;
  transition: opacity 0.3s ease-in-out;
  display: -webkit-flex;
  display: flex;
  -webkit-align-items: center;
  align-items: center;
}

.pop:target, .pop.up {
  top: 0;
  left: 0;
  opacity: 1;
}

.pop-content {
  position: relative;
  overflow: auto;
  max-width: 800px;
  margin: auto;
  background-color: #fdfdfd;
  border-radius: 4px;
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.3);
}

.pop .close {
  position: absolute;
  top: 0;
  right: 0;
  margin: 0;
  padding: 0 15px;
  line-height: 50px;
}

{% endhighlight %}

O pop-up agora tem várias melhorias:

- Um fundo semitransparente escuro (também conhecido como *overlay*);
- Uma transição suave ao exibir;
- Um mecanismo para exibi-lo apenas com css: colocando o `id` do pop-up na url, ativamos o seletor CSS `:target`, que estiliza um elemento que estiver sendo apontado pelo *hashtag* na barra de endereço do navegador;
- Um botão para fechar o modal, com a classe `close`, que se posiciona no canto superior direito;
- Alguns ajustes de design, como cantos arredondados e sombra.

Outro problema do exemplo anterior é que os scripts não podem ser reaproveitados. Como as funções estão sempre chamando o mesmo elemento, baseando-se no atributo `id`, não podemos usar as mesmas funções aqui. Vamos fazer uma função que resolva isso, e de quebra permita reutilizarmos o componente com mais flexibilidade:

{% highlight javascript %}

function modal(modal) {

  if (typeof modal === 'string') modal = document.querySelector(modal);

  return {
      abrir: function() {
        modal.classList.add('up');
      },
      fechar: function() {
        modal.classList.remove('up');
      }
  };

};

{% endhighlight %}

A função recebe um parâmetro para especificar qual elemento representa o nosso componente. Podemos passar o próprio elemento ou uma string que busca o elemento na página, no estilo da jQuery:

{% highlight javascript %}

var popupElement = document.querySelector('#pop-up-1');

var primeiroPopUp = modal(popupElement);

var segundoPopUp = modal('#pop-up-2');

{% endhighlight %}

A função retorna um objeto com os métodos `abrir` e `fechar`, que permitem realizar as ações que eles sugerem. Agora podemos usar o componente assim:

{% highlight html %}

<div id="pop-up-1" class="pop">
  <section class="pop-content">
    <a href="#" class="close">&times;</a>
    <header>
      <h4>Título do modal</h4>
    </header>
    <p>
      Lorem ipsum dolor, sit amet consectetur 
      adipisicing elit. Voluptas at, dolores 
      accusamus autem perspiciatis dolorem adipisci! 
      Inventore officiis porro dolores quod 
      provident, ipsa maiores similique voluptas 
      molestias corrupti eaque error.
    </p>
  </section>
</div>

{% endhighlight %}

E podemos disparar a exibição do modal com o método do CSS ou com a função do javascript:

{% highlight html %}

<a href="#pop-up-1">Abrir sem Javascript</a>

<a href="javascript: modal('#pop-up-1').abrir();">Abrir com Javascript</a>

{% endhighlight %}

Experimente um [exemplo de pop-up funcionando](https://johnylab.net/amcss-modal/exemplo.html) ou baixe o [projeto AMCSS Modal no Github](https://github.com/Johnylab/amcss-modal/). Fique a vontade para baixar e usar os códigos como quiser. O projeto vem com alguns bônus:

- Componente estilizado como módulo de atributo. [Saiba mais sobre módulos de atributos]({{ site.baseurl }}{% post_url 2015-02-05-amcss-modulos-de-atributos-para-css %}).
- Estilos adicionais para o `<header>`, `<footer>` e botões de ação.
