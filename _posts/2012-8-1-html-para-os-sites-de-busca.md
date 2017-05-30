---
codigoTexto: 120
title: "HTML para os sites de busca"
excerpt: >
  HTML é uma linguagem de marcação, e não de programação como muitos pensam, e serve para descrever a estrutura da página web para os dispositivos que a visitam. É através dela que o Google, assim como os browsers, lê as suas informações.
img: /imagens/code_snip.gif
categories: HTML
tags: HTML, padrões, SEO
---

HTML é uma linguagem de marcação, e não de programação como muitos pensam, e serve para descrever a estrutura da página web para os dispositivos que a visitam. É através dela que o Google, assim como os browsers, lê as suas informações. Por isso, a marcação HTML tem como objetivo estruturar a página, determinando o significado de cada  parte do conteúdo.

Para poder criar sites que se posicionam bem em motores de busca, é aconselhável ter ao menos algum conhecimento de HTML. Cada elemento da HTML é determinado por uma <em lang="en" title="Etiqueta">tag</em> com funções específicas, como o título à página, o corpo do texto, um subtítulo, imagens, vídeos e listas.

<blockquote>
Como sabemos, o algoritmo do Google é um software de computador que basicamente lê códigos-fonte de páginas e mais páginas, procurando interpretá-los tal como um usuário normal o faria. Por isso, considero tão importante o conhecimento do HTML, menos para desenvolver os códigos-fonte do que para saber solucionar problemas relacionados a <abbr title="Search Engine Optimization (Otimização para Sites de Busca)" lang="en">SEO</abbr>, que são comuns.
<small><a href="http://www.conversion.com.br/blog/seo-e-seus-elementos-html-mais-importantes/" target="_blank">SEO e seus Elementos HTML mais importantes</a></small>
</blockquote>

Alguns elementos HTML a considerar:

### Título da página

{% highlight html %}

<title>Título da página</title>

{% endhighlight %}

Define um título para a página e deve ser declarado apenas uma vez, dentro da seção <code>head</code> do código-fonte. O conteúdo da <em lang="en" title="Etiqueta">tag</em> é passado para a barra de título do navegador, ou a aba onde a página é visualizada. O valor passado também é usado para identificar uma página nos resultados dos sites de busca.

![Exibição do html na SERP do Google](http://www.leverinteractive.com/wp-content/uploads/2015/04/xTitle-Tag-SERP.png.pagespeed.ic.FlZhGsJw8Q.png)

### Meta Description

{% highlight html %}

<meta
   name="description"
   content="Esta página trata de como melhorar
      o código HTML para ser lido corretamente
      por mecanismos de busca.">

{% endhighlight %}

As informações deste elemento são armazenadas pelos sites de busca para exibirem nas páginas de resultados. O conteúdo da descrição passada não afeta diretamente o posicionamento na <abbr title="Search Engine Results Page" lang="en">SERP</abbr>, mas serve para despertar o interesse do internauta em clicar no link para ver mais conteúdo de seu site. Use esta <em lang="en" title="Etiqueta">tag</em> para informar o que ele encontrará na sua página.

### Header: H1, H2, H3, H4, H5, H6


{% highlight html %}

<h1>Título 1</h1>
<h2>Título 2</h2>
<h3>Título 3</h3>

{% endhighlight %}


Títulos e subtítulos no conteúdo da página devem conter as principais palavras-chave da página. Palavras contidas nestes títulos são consideradas relevantes para determinar o assunto principal da página e marcar as subdivisões do texto. Marque adequadamente os seus títulos sabendo que a numeração deles vai de h1 a h6 e o nível hierárquico deles vai do mais alto para o mais baixo. O título principal da página é h1, e h2 é um subtítulo imediato dele, e assim por diante.

### Parágrafo

{% highlight html %}

<p>Texto marcado como um parágrafo.</p>

{% endhighlight %}

A marcação de parágrafo representa um trecho de texto relevante. Basicamente, o parágrafo é um conjunto de sentenças que discorrem sobre um determinado tópico. Marque todo o corpo do texto com parágrafos.

### Listagens

{% highlight html %}

<!-- Lista não numerada -->
<ul>
   <li>Item de lista</li>
   <li>Item de lista</li>
   <li>Item de lista</li>
</ul>

<!-- Lista numerada -->
<ol>
   <li>Item 1</li>
   <li>Item 2</li>
   <li>Item 3</li>
</ol>

{% endhighlight %}

Isso é uma lista:

- uma sequência de itens relacionados entre si;
- uma lista de assuntos;
- um grupo de links ou opções;
- uma galeria de imagens;
- etc.


### Alt e nome das imagens

{% highlight html %}

<img
   src="nomeDaMinhaImagem"
   alt="Texto descrição alternativa.">

{% endhighlight %}

Tanto o nome da imagem como o atributo alt presente na <em lang="en" title="Etiqueta">tag</em> são levados em consideração quando os mecanismos de busca indexam os elementos gráficos. Certifique-se de nomear adequadamente os arquivos de imagens, vídeos, áudios e outras mídias, e informe o conteúdo de cada imagem no atributo alt (como no exemplo acima) para que dispositivos com recursos especiais de leitura de tela, usuários com imagens desabilitadas e sistemas de busca tenham uma informação alternativa para identificar o conteúdo da imagem.

### Links internos e externos
- Breadcrumbs
- Informação em forma de palavra-chave

### Blocos de conteúdo

{% highlight html %}

<header>Cabeçalho da página em HTML5</header>
<nav>Área reservada para os elementos na navegação principal do site</nav>

<section>
  Uma seção ou subdivisão da página
  <article>Um bloco de conteúdo indepente que faz parte da página</article>
</section>

<footer>Um conteúdo complementar da página, de uma section ou article</footer>

{% endhighlight %}

## Conclusão

Faça o código-fonte da página o mais limpo e simples possível, para que o tempo de carregamento seja o menor. Use cada elemento HTML conforme seu significado semântico. Use corretamente o código HTML para que seu site seja compreendido pelos motores de busca.

Para mais informações, recomendo as seguintes referências online:
<a href="http://simon.html5.org/html-elements" target="_blank" hreflang="en">HTML Elements and Attributes</a>
<a href="http://html5please.com/" target="_blank" hreflang="en">HTML5 PLEASE</a>