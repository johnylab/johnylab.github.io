---
title: Tutorial: Como fazer triângulos com CSS (sem usar imagens)
excerpt: Já é possível criar formas geométricas apenas com propriedades CSS... dá pra aplicar diversos efeitos e filtros, mas a maioria ainda não funciona no IE (lógico). A técnica funcionou em todos os navegadores...
img: /imagens/css-triangles.jpg
categories: CSS
tags: CSS, layout, border, triângulo
---

Já é possível criar formas geométricas apenas com propriedades CSS. Além disso, dá pra aplicar diversos efeitos e filtros, mas a maioria ainda não funciona no Internet Explorer (lógico). Como a técnica de criar triângulos funcionou em todos os navegadores que eu testei (não atendo mais ao IE6, mas funciona no 7) e pode ser muito útil para criar os controles de um slider sem ter que fazer mais imagens, estou passando abaixo o conceito.

#### Ilusão da propriedade `

Devemos tudo à forma como os navegadores processam as bordas dos elementos.

<div style="border:15px solid;border-color:#ccc #777;padding:1em;">Está caixa foi criada apenas com CSS. As cores das bordas foram definidas para que você perceba bem o que acontece.</div>

Veja esta animação do Chris Coyer:

<p data-height="380" data-theme-id="1572" data-slug-hash="lotjh" data-default-tab="result" data-user="chriscoyier" class='codepen'>See the Pen <a href='http://codepen.io/chriscoyier/pen/lotjh/'>Animation to Explain CSS Triangles</a> by Chris Coyier (<a href='http://codepen.io/chriscoyier'>@chriscoyier</a>) on <a href='http://codepen.io'>CodePen</a>.</p>
<script async src="//assets.codepen.io/assets/embed/ei.js"></script>

Quando definimos as dimensões do elemento para 0 (zero), obtemos quatro triângulos que são formados pelas bordas.

<img src="/imagens/triangle-example.gif" />

E a estilização básica dos triângulos fica assim:

```
.triangulo{
   width:0;
   height:0;
   border:1em solid;
   font-size: 30px; /* Configure o tamanho do triângulo aqui. */
}
```

Agora basta ocultar as bordas que não queremos:

```
.prabaixo { border-color: #777 transparent transparent transparent; }
.esquerda { border-color: transparent #777 transparent transparent; }
.pracima  { border-color: transparent transparent #777 transparent; }
.direita  { border-color: transparent transparent transparent #777; }
```

Use as classes no seu HTML assim:

```
<div class="triangulo direita"></div>
<div class="triangulo esquerda"></div>
<div class="triangulo pracima"></div>
<div class="triangulo prabaixo"></div>
```