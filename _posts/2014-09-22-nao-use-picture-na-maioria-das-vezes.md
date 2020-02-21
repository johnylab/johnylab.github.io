---
title: Não use &lt;picture> (na maioria das vezes)
date: 2014-09-22 21:00:00 -03:00
categories:
- HTML
tags:
- imagens
- responsivas,
- tag,
- picture,
- img
codigoTexto: 127
excerpt: 'Você não precisa saber todos os casos, mas precisa entender a diferença
  entre os dois casos mais comuns de uso a fim de saber que parte da especificação
  picture resolverá seus problemas.

'
img: "/imagens/devices-sm.gif"
---

<em>Este post é adaptado de um artigo de <a href="http://blog.cloudfour.com/author/jason-grigsby/" title="Posts by Jason Grigsby" hreflang="en">Jason Grigsby</a> e você pode ler o texto original em <a href="http://blog.cloudfour.com/dont-use-picture-most-of-the-time/" hreflang="en">Don’t use &lt;picture> (most of the time)</a>.</em>

> O suporte dos navegadores para a especificação picture está chegando e, como diz <a href="http://marcosc.com/">Marcos Cáceres</a>, é hora de "sair picturizando tudo!"
> 
> Só que não! Você não deve colocar `<picture>` em tudo.
> 
> Mas você já pode usar `<picture>` para servir imagens responsivas. Não há porque esperar.
> 
> Confuso? Não é só você.

#### &lt;picture> vs. picture

Os padrões são desenvolvidos de um modo não linear. As ideias evoluem e se unem. E geralmente não sabemos onde vamos chegar ao final de cada processo. Neste caso, acabou nascendo uma especificação chamada "picture" que contém muito mais do que o elemento &lt;picture>.

#### O problema que você quer resolver define qual solução você precisa

Uma das primeiras partes do trabalho assumido pelo <a href="http://responsiveimages.org/" hreflang="en">Responsive Images Community Group</a> foi definir os <a href="http://usecases.responsiveimages.org/" hreflang="en">casos de uso de imagens responsivas</a>.

Você não precisa saber todos os casos, mas precisa entender a diferença entre os dois casos mais comuns de uso a fim de saber que parte da especificação picture resolverá seus problemas. Esses dois casos são:



- Mudança de resolução: precisamos selecionar um arquivo diferente para uma mesma imagem em diferentes resoluções por qualquer motivo. Os motivos para isso podem ser diferentes tamanhos de tela, densidades de pixels, ou evitar o download desnecessário de imagens grandes demais.

- Direção de arte: neste caso, por alguma razão precisamos modificar o conteúdo da imagem sob determinadas condições. Também precisemos de um corte diferente na imagem para telas pequenas. Ou no caso de uma imagem de destaque contendo texto e simplesmente mostrar uma versão menor tornaria o texto ilegível.



Basicamente, se você puder redimensionar uma imagem sem fazer nenhuma outra mudança, e tem outro arquivo com a resolução necessária, estamos falando de mudança de resolução. Se você precisa mudar qualquer coisa na imagem além da resolução, estamos falando de direção de arte.

#### Para a maioria das imagens responsivas, você não precisa do elemento &lt;picture>

Além que você tenha em vista a direção de arte, não precisa usar o elemento &lt;picture>. Na verdade, estaria fazendo um desserviço aos seus usuários.

A especificação picture suporta sintaxes que podem ser usadas sem o tal elemento. Um exemplo dado por Yoav Weiss no artigo <a href="https://dev.opera.com/articles/native-responsive-images/" hreflang="en">Native Responsive Images</a> fica mais ou menos assim:


{% highlight html %}

<img src="cat_500px.jpg"
    srcset="cat_750px.jpg 1.5x, cat_1000px.jpg 2x"
    width="500px" alt="lolcat">

{% endhighlight %}


Isso dá ao navegador opções diferentes conforme a densidade da tela. A seguir um exemplo mais complicado:


{% highlight html %}

<img sizes="(max-width: 30em) 100vw,
            (max-width: 50em) 50vw,
            calc(33vw - 100px)"
    srcset="swing-200.jpg 200w,
            swing-400.jpg 400w,
            swing-800.jpg 800w,
            swing-1600.jpg 1600w"
    src="swing-400.jpg" alt="Kettlebell Swing">

{% endhighlight %}


Eu recomendo a leitura do <a href="https://dev.opera.com/articles/native-responsive-images/" hreflang="en">artigo do Yoav</a> para entender melhor cada detalhe.

Quando você usa os atributos srcset e sizes em um elemento &lt;img>, você está provendo informações que o navegador pode usar para decidir qual imagem é mais apropriada para o uso baseado em uma série de fatores que você não tem ciência.

Como designer ou desenvolvedor, você não tem como saber qual a largura de banda do usuário, ou se ele declarou algum tipo de preferência com relação à resolução de imagens que ele deseja ver. Se damos ao navegador informações através do atributo srcset ou sizes, ele poderá tomar decisões mais inteligentes a respeito de qual arquivo carregar.

Mas nada disso é possível quando você usa &lt;picture> e seus atributos <code>media</code>:


{% highlight html %}

<picture>
    <source media="(min-width: 45em)" srcset="large.jpg">
    <source media="(min-width: 32em)" srcset="med.jpg">
    <img src="small.jpg" alt="The president giving an award.">
</picture>

{% endhighlight %}


Quando você especifica <code>media queries</code> para as fontes da imagem, está criando regras para o navegador obedecer. Ele não terá condições de tomar decisões inteligentes de download baseadas nas preferências do usuário, rede, etc.

Você deve ditar as condições de decisão de download moderadamente. Na verdade, só deve usar isso para fins de direção de arte, não para determinar a resolução.

Leia o <a href="http://blog.cloudfour.com/dont-use-picture-most-of-the-time/" hreflang="en">artigo original</a> (em inglês).

