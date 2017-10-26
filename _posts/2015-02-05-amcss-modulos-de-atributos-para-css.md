---
title: AMCSS - Módulos de Atributos para CSS
date: 2015-02-05 00:00:00 Z
categories:
- CSS
tags:
- css,
- atributos,
- seletores,
- módulos
- css
codigoTexto: 129
excerpt: 'Não se trata nem de um framework, nem de uma biblioteca. É um estilo que
  melhor descreve os componentes que você está construindo. Já existe uma especificação
  disponível em https://github.com/amcss/attribute-module-specification/

'
img: https://farm8.staticflickr.com/7399/15822048634_023342337f.jpg
---

>
  Esta página é uma tradução do artigo <a href="http://amcss.github.io/" hreflang="en">http://amcss.github.io/</a>, com pequenas adaptações.

Attribute Modules (AM) é uma técnica para usar os atributos HTML e seus valores em vez de classes para estilizar os elementos. Ao fazê-lo, cada atributo declara efetivamente um namespace separado para encapsular as informações de estilo, resultando em um HTML e CSS mais legíveis e de fácil manutenção.

Não se trata nem de um framework, nem de uma biblioteca. É um estilo que melhor descreve os componentes que você está construindo. Para uma introdução sobre como AM foi desenvolvido, veja o <a href="http://glenmaddern.com/articles/introducing-am-css" hreflang="en">post original de Glen Maddern</a>. Já tem uma <a href="https://github.com/amcss/attribute-module-specification/" hreflang="en">especificação disponível no GitHub</a>.

### Exemplo: botões do Bootstrap

Os botões são um dos melhores exemplos de aplicação de AM. Aqui temos alguns exemplos de marcação dos botões do Bootstrap.


{% highlight html %}

<!-- Botão primário Grande -->
<a class="btn btn-primary btn-lg"> Botão primário Grande </a>
<a am-Button="primary large"> Botão primário Grande </a>

<!-- Botão Padrão -->
<a class="btn btn-default"> Botão Padrão </a>
<a am-Button> Botão Padrão </a>

<!-- Botão de informação pequeno -->
<a class="btn btn-info btn-sm"> Botão de informação pequeno </a>
<a am-Button="info small"> Botão de informação pequeno </a>

<!-- Botão de perigo extra-pequeno -->
<a class="btn btn-danger btn-xs"> Botão de perigo extra-pequeno </a>
<a am-Button="danger extra-small"> Botão de perigo extra-pequeno </a>

{% endhighlight %}


A marcação Bootstrap original é fortemente baseada na convenção de que todos os botões exigem uma classe <code>btn</code> e outras classes de botão específicas prefixadas por <code>btn-</code>. Isso resulta em um markup desordenado e repetitivo.

A versão de AM, por sua vez, utiliza o atributo <code>am-Button</code> como um identificador, e permite modificadores aditivos simples e naturais (<code>large</code>, <code>small</code>, <code>pequeno</code>, <code>grande</code>, <code>primary</code>, <code>primario</code>, etc.).

As mudanças no CSS são bastante simples:


{% highlight css %}

.btn
[am-Button] {/ * estilos botão padrão * /}

.btn-primary
[am-Button~="primary"] {/ * cores básicas * /}

.btn-large
[am-Button~= "large"] {/ * definições de dimensionamento * /}

{% endhighlight %}


### Exemplo: Flexbox Grid

Já é de praxe usarmos algum sistema de grade, e <a href="http://flexboxgrid.com/" hreflang="en">Flexbox Grid</a> é uma boa opção. Aqui temos convertido um exemplo de marcação em um estilo AM.

Com class:

{% highlight html %}

<div class="row reverse">
    <div class="column-12--hand column-8--lap">
        <div class="box">Responsive</div>
    </div>
</div>

{% endhighlight %}

Com atributos personalizados:

{% highlight html %}

<div am-Grid-Row="reverse">
    <div am-Grid-Col="12 lap:8">
        <div am-Demo="box">Responsive</div>
    </div>
</div>

{% endhighlight %}


A marcação inicial tem alguns problemas comuns a todos os sistemas de grade baseados em classes. Como as classes da grade são usadas com tanta freqüência, ela usa classes css relativamente <em>nuas</em>, como <code>row</code> e <code>reverse</code>, mas como as colunas precisam ser responsivas, ela evita uma classe <code>col</code> global e define classes <code>col-breakpoint-número</code>.

A marcação AM, por outro lado, define os módulos <code>am-Grid-Row</code> e <code>am-Grid-Col</code>, e uma vez que cada um desses define um namespace, ficamos livres para usar os valores de nossa escolha. Estes valores podem usar uma gama de caracteres muito maior do que é permitido com classes, de modo que podemos utilizar a sintaxe <code>breakpoint:número</code>, o que é mais fácil de entender imediatamente. Nós também podemos adotar uma abordagem mobile-first, omitindo o breakpoint <code>hand</code>.

### Exemplo: traços reutilizáveis

Considerando AM uma evolução do estilo de nomeação BEM, você também pode considerar um módulo que defina um namespace mais geral para o agrupamento de estilos relacionados. Semelhante às classes de utilidade em Suit CSS, estes podem ser considerados como traços de estilo reutilizáveis, que podem ser aplicados sobre ou no interior de componentes.


{% highlight html %}

<div class="u-posAbsoluteCenter">
   <div class="u-textTruncate u-textCenter">
     Texto super centralizado.
   </div>
</div>

{% endhighlight %}



{% highlight html %}

<div am-position="center absolute">
   <div am-text="center truncate">
     Texto super centralizado.
   </div>
</div>

{% endhighlight %}


Aqui podemos aproveitar o fato de que os valores para <code>am-position</code> e <code>am-text</code> operam em diferentes namespaces, para que possamos utilizar o valor center em ambos os lugares, sem a preocupação com conflitos de nomes.

### Mais exemplos no Github



<a href="https://github.com/benschwarz/am-grid">am-Grid</a><br>Um sistema de grade em AM, inspirado no Flexbox Grid. <a href="https://github.com/benschwarz/am-grid/blob/master/src/grid.css">Veja o  código-fonte</a>.

<a href="https://github.com/amcss/amcss.github.io/tree/development">amcss.github.io</a><br>Um exemplo simples de componentes em AM, divididos em <a href="https://github.com/amcss/amcss.github.io/tree/development/src/styles/modules">quatro módulos simples</a>.

