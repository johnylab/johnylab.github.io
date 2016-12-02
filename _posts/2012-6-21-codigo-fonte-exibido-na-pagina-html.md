---
title: Código-fonte exibido na página HTML
excerpt: Esta dúvida foi indexada pelo Google recentemente. Ele tem um campo de formulário com um código HTML dentro, daqueles que você clica, copia e cola em outro lugar. Como fica o HTML dentro do campo?
img: /imagens/div-2.png
categories: HTML
tags: código-fonte, caracteres, HTML
---

Esta dúvida foi indexada pelo Google recentemente:

<blockquote>
Queria saber qual era o HTML se antes estar escrito aquilo na inputbox *http://img560.imageshack.us/img560/6546/semttulochu.png* estivesse isto 
```
<div align="center"><div align="center"><a href="http://meu_site.com/" target="_blank"><img src="http://meu_site.com/minha-imagem.gif" width="100" height="50"></a></div>
```
</blockquote>

### O problema
Traduzindo a mensagem acima:

- Ele tem um campo de formulário com um código HTML dentro, daqueles que você clica, copia e cola em outro lugar;
- O campo contém uma URL do link para a imagem dele;
- Ele quer um código mais elaborado, para os visitantes poderem colar o HTML em seus sites e virar uma imagem com link. Porém alguns caracteres são códigos HTML, o que pode causar a quebra do campo ` onde o código deve aparecer


#### Minha mensagem
Aqui jaz parcialmente a mensagem que enviei ao autor da pergunta:
<blockquote>
Acontece que, dentro de um campo de formulário, o código HTML deve ser passado convertido para caracteres especiais em HTML. Por exemplo, em vez de um espaço em branco, você deve digitar
```
&nbsp;
```

No seu caso você queria o seguinte código dentro da caixa de texto:
```
<div align="center"><a href="http://meu_site.com/" target="_blank"><img src="http://meu_site.com/minha-imagem.gif" width="100" height="50"></a></div>
```

Mas ele deve ser passado dentro do HTML com caracteres especiais HTML...
</blockquote>

### A solução

A solução para o caso dele ficaria assim:
```
&lt;div align=&quot;center&quot;&gt;&lt;div align=&quot;center&quot;&gt;&lt;a href=&quot;http://meu_site.com/&quot; target=&quot;_blank&quot;&gt;&lt;img src=&quot;http://meu_site.com/minha-imagem.gif&quot; width=&quot;100&quot; height=&quot;50&quot;&gt;&lt;/a&gt;&lt;/div&gt;&lt;br&gt;
```

Resultando nisso:
<textarea cols=30 rows=3 style="width:100%">
&lt;div align=&quot;center&quot;&gt;&lt;div align=&quot;center&quot;&gt;&lt;a href=&quot;http://meu_site.com/&quot; target=&quot;_blank&quot;&gt;&lt;img src=&quot;http://meu_site.com/minha-imagem.gif&quot; width=&quot;100&quot; height=&quot;50&quot;&gt;&lt;/a&gt;&lt;/div&gt;&lt;br&gt;
</textarea>

Geralmente um editor de HTML simples pode fazer esta conversão, mas eu obtive o código na própria fonte da mensagem no fórum.quot;http://meu_site.com/minha-imagem.gif