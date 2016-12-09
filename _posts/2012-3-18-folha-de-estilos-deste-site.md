---
title: "Folha de estilos deste site"
excerpt: >
  Estilos do arquivo css usado neste site, comentado para estudo da linguagem de folhas de estilos. O novo layout está usando o HTML5 &#9733; Boilerplate, que foi omitido aqui para economizar espaço...
img: /imagens/css-abbreviations.jpg
categories: CSS
tags: css, estilos, posicionamento
---

O novo layout está usando o <a href="http://html5boilerplate.com/" hreflang="en" target="_blank">HTML5 &#9733; Boilerplate</a> para facilitar a padronização. Estou tentando aproveitar as <a href="http://simon.html5.org/html-elements" hreflang="en" target="_blank">novas tags do HTML5</a> que proporcionam maior significação para os elementos do layout. Os estilos que já vêm prontos no boilerplate serão omitidos aqui pois você pode consultá-los no próprio site ou baixar o pacote com comentários (em inglês) para estudar.

Vale lembrar que o arquivo usado no site foi minimizado para diminuir o tempo de processamento e para mostrar aqui eu formatei o código usando o <a href="http://dirtymarkup.com/" hreflang="en" target="_blank">Dirty Markup</a>, que faz as quebras de linhas e a indentação rapidamente pra facilitar estudos de códigos.


{% highlight css %}

/* ===== Primary Styles ====================================
   Author: João Batista Ferreira
   ====================================================== */

.wraper {
    width: 960px;
    margin: 0 auto;
}

.top {
    margin: 20px 0;
}

{% endhighlight %}


Pra começar defini a largura de todo o conteúdo do site e centralizei o layout. Uma margem no header do site foi usada para que as imagens não fiquem muito espremidas. Nas próximas linhas vamos definir uma divisão em três partes, que serão duas tags <code>article</code> e um <code>menu</code>. Note o uso da tag <code>figure</code>, que ao contrário do que parece, não serve apenas para conter imagens com legendas.


{% highlight css %}

.top article {
    width: 360px;
    float: left;
}

.top .titulo {
    padding-left: 10px;
}

.top .sobre {
    font-size: .8em;
}

.top .sobre p {
    margin: 5px;
}

.top figure {
    width: 100px;
    height: 100px;
    float: left;
    overflow: hidden;
}

.top menu {
    display: block;
    width: 120px;
    float: right;
    margin-right:5px;
    list-style: none;
    position: relative;
}

.top menu li {
    display: block;
    width: 30px;
    height: 30px;
    float: left;
}

{% endhighlight %}


As tags de links para redes sociais recebem no html uma classe <code>ir</code> (Image Replacement), do boilerplate, que já tem os estilos necessários para substituir todo o conteúdo do link pela imagem de fundo. Assim, mesmo que eu escreva alguma coisas para os leitores de tela poderem retornar informação aos usuários que não podem ver as imagens, a maioria dos navegadores vai exibir apenas os ícones.


{% highlight css %}

.top menu a {
    width: 100%;
    height: 100%;
}

.top menu a.face {
    background-image: url(/img/social/facebook.png);
}

.top menu a.twit {
    background-image: url(/img/social/twitter.png);
}

.top menu a.in {
    background-image: url(/img/social/linkedin.png);
}

.top menu a.rss {
    background-image: url(/img/social/rss.png);
}

{% endhighlight %}


O formulário de pesquisa pode ser posicionado em termos absolutos e mesmo assim permanece dentro do layout. Isso é possível porque o elemento pai (<code>.top menu</code>) tem uma propriedade <code>position:relative</code>.


{% highlight css %}

.top menu form {
    position: absolute;
    right: 5px;
    top: 40px;
}

.top menu input#busca {
    border-color: #fc3;
    padding: 5px;
    width: 220px;
    color: #999;
}

{% endhighlight %}


Em seguida criei uma classe <code>painel</code> para conter as listas de posts da página inicial. A tag que usa esta classe é um <code>menu</code> com diversos itens de lista (<code>li</code>), cada um representando um post do site.


{% highlight css %}

.painel {
    display: block;
    margin: 20px auto;
    padding: 0;
    list-style: none;
    float: left;
}

.painel li {
    display: block;
    width: 207px;
    height: 90px;
    position: relative;
    margin: 10px 0 0 10px;
    padding: 10px;
    float: left;
    color: #ddd;
    background-color: #E25C1C;
}

.painel li a {
    color: #ff9;
    text-decoration: none;
}

.painel li a.titulo {
    display: block;
    height: 65px;
    overflow: hidden;
}

.painel li figure {
    display: block;
    width: 80px;
    height: 50px;
    overflow: hidden;
    float: left;
}

.painel li strong {
    display: block;
}

.painel li footer {
    display: block;
    clear: both;
    font-size: .7em;
    position: absolute;
    bottom: 3px;
    right: 10px;
}

.painel li.cat20 {
    background-color: #743399;
}

.painel li.cat21 {
    background-color: #a19f11;
}

.painel li.cat23 {
    background-color: #009CC7;
}

.painel li.cat25 {
    background-color: #33af41;
}

.painel li.cat26 {
    background-color: #335861;
}

.painel li.cat32 {
    background-color: #004B91;
}

.painel li.cat34 {
    background-color: #E25C1C;
}

{% endhighlight %}


Uma <code>div</code> com a classe <code>paginacao</code> posicionará os links para navegar entre as páginas da lista de posts. Aqui o posicionamento é feito com <code>fixed</code>. Uma <a href="/?id=106" title="Triângulos com CSS sem usar imagens">técnica usando as bordas dos links foi usada para produzir a imagem de um triângulo</a> apontando para a direita e outro para a esquerda.


{% highlight css %}

.paginacao a {
    display: block;
    width: 0;
    height: 0;
    overflow: hidden;
    position: fixed;
    top: 50%;
    border: 25px solid #727170;
    border-top: 25px solid transparent;
    border-bottom: 25px solid transparent;
}

.paginacao a.prev {
    border-left: 25px solid transparent;
    left: 5px;
}

.paginacao a.next {
    border-right: 25px solid transparent;
    right: 5px;
}

{% endhighlight %}


Agora vamos definir os estilos da página de resultados de pesquisa. Note mais uma vez o uso da tag figure.


{% highlight css %}

.pesquisa {
    padding: 0;
    margin: 0;
    list-style: none;
}

.pesquisa li {
    display: block;
    width: 420px;
    height: 140px;
    float: left;
    position: relative;
    margin: 10px 20px;
    padding: 10px;
    background-color: #faf0e9;
}

.pesquisa figure {
    display: block;
    width: 120px;
    height: 140px;
    margin-right: 10px;
    float: left;
    overflow: hidden;
}

.pesquisa a {
    display: block;
    font-weight: 700;
}

.pesquisa span {
    display: block;
    color: #444;
    margin: 10px auto;
    font-size: .8em;
}

.pesquisa .url {
    color: #903;
    position: absolute;
    bottom: 0;
    right: 10px;
}

{% endhighlight %}


A classe <code>arredondado</code> pode ser acrescentada em qualquer elemento para ficar com os cantos arredondados.


{% highlight css %}

.arredondado {
    -webkit-border-radius: 4px;
    -moz-border-radius: 4px;
    border-radius: 4px;
    -moz-background-clip: padding;
    -webkit-background-clip: padding-box;
    background-clip: padding-box;
}

{% endhighlight %}


Por fim os estilos da página do post.


{% highlight css %}

.leitura {
    width: 900px;
    margin: 0 auto 20px;
    padding: 20px;
    background-color: #fff;
    border: solid 1px #eec;
}

.leitura pre {
    padding: 10px;
    background: url() #f0ede9;
}

{% endhighlight %}
