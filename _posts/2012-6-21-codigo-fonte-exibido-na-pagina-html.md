---
title: "Código-fonte exibido na página HTML"
excerpt: >
  Esta dúvida foi indexada pelo Google recentemente. Ele tem um campo de formulário com um código HTML dentro, daqueles que você clica, copia e cola em outro lugar. Como fica o HTML dentro do campo?
img: /imagens/div-2.png
categories: HTML
tags: código-fonte, caracteres, HTML
---

Esta dúvida foi indexada pelo Google recentemente:

> Queria saber qual era o HTML se antes estar escrito aquilo na inputbox <em>http://img560.imageshack.us/img560/6546/semttulochu.png</em> estivesse isto 

{% highlight html %}

<div align="center"><div align="center"><a href="http://meu_site.com/" target="_blank"><img src="http://meu_site.com/minha-imagem.gif" width="100" height="50"></a></div>

{% endhighlight %}

### O problema
Traduzindo a mensagem acima:

- Ele tem um campo de formulário com um código HTML dentro, daqueles que você clica, copia e cola em outro lugar;
- O campo contém uma URL do link para a imagem dele;
- Ele quer um código mais elaborado, para os visitantes poderem colar o HTML em seus sites e virar uma imagem com link. Porém alguns caracteres são códigos HTML, o que pode causar a quebra do campo <code>input</code> onde o código deve aparecer


#### Minha mensagem

Aqui jaz parcialmente a mensagem que enviei ao autor da pergunta:

<blockquote>

<p>Acontece que, dentro de um campo de formulário, o código HTML deve ser passado convertido para caracteres especiais em HTML. Por exemplo, em vez de um espaço em branco, você deve digitar <code>&amp;nbsp;</code>.</p>

<p>No seu caso você queria o seguinte código dentro da caixa de texto:</p>

{% highlight html %}

<div align="center"><a href="http://meu_site.com/" target="_blank"><img src="http://meu_site.com/minha-imagem.gif" width="100" height="50"></a></div>

{% endhighlight %}

<p>Mas ele deve ser passado dentro do HTML com caracteres especiais HTML...</p>

</blockquote>

### A solução

A solução para o caso dele ficaria assim:

{% highlight html %}

&lt;div align=&quot;center&quot;&gt;&lt;div align=&quot;center&quot;&gt;&lt;a href=&quot;http://meu_site.com/&quot; target=&quot;_blank&quot;&gt;&lt;img src=&quot;http://meu_site.com/minha-imagem.gif&quot; width=&quot;100&quot; height=&quot;50&quot;&gt;&lt;/a&gt;&lt;/div&gt;&lt;br&gt;

{% endhighlight %}

Resultando nisso:

&lt;div align=&quot;center&quot;&gt;&lt;div align=&quot;center&quot;&gt;&lt;a href=&quot;http://meu_site.com/&quot; target=&quot;_blank&quot;&gt;&lt;img src=&quot;http://meu_site.com/minha-imagem.gif&quot; width=&quot;100&quot; height=&quot;50&quot;&gt;&lt;/a&gt;&lt;/div&gt;&lt;br&gt;