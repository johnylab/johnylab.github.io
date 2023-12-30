---
title: "Tutorial: Criando Triângulos com CSS (Sem Usar Imagens)"
date: 2013-12-29 23:20:00 -03:00
categories:
  - CSS
tags:
  - CSS
  - border
  - layout
excerpt: |-
  Descubra como adicionar formas geométricas ao seu design utilizando apenas propriedades CSS. Esta técnica de criar triângulos é compatível com todos os navegadores modernos, proporcionando uma solução eficaz sem a necessidade de imagens.
img: /img/css-triangles.jpg
---

<div class="wrapper horizontal" style="align-items: center; flex-wrap: wrap; gap: var(--spacing);">
  <div style="flex: 1 1 555px;">
    <p>
      <img src="https://i.stack.imgur.com/cojBG.gif" alt="Triângulos feitos com CSS">
    </p>
  </div>

  <div style="flex: 1 1 200px;">
    <p>
      Agora, é possível incorporar formas geométricas aos seus projetos com facilidade. Além disso, essa técnica oferece a flexibilidade de aplicar diversos efeitos e filtros. Como funciona em todos os navegadores modernos, é uma opção ideal para criar controles de slider sem recorrer a imagens adicionais. Vamos explorar os fundamentos.
    </p>
    <p>
      Devemos tudo à forma como os navegadores processam as bordas dos elementos.
    </p>
  </div>
</div>

```css
.triangulo{
   width: 0;
   height: 0;
   border: 1em solid;
   font-size: 30px; /* Configure o tamanho do triângulo aqui. */
}

.prabaixo { border-color: #777 transparent transparent transparent; }
.esquerda { border-color: transparent #777 transparent transparent; }
.pracima  { border-color: transparent transparent #777 transparent; }
.direita  { border-color: transparent transparent transparent #777; }
```

Ao definir as dimensões do elemento como 0 (zero), obtemos quatro triângulos formados pelas bordas. A estilização básica dos triângulos é apresentada acima, e para ocultar as bordas indesejadas, utilize as classes correspondentes no seu HTML.

Para uma demonstração animada, confira o exemplo abaixo produzido pelo Chris Coyer:

<div class="wrapper page-content">
  <iframe height="400" style="width: 100%; height: 400px;" scrolling="no" title="Animation to Explain CSS Triangles" src="https://codepen.io/chriscoyier/embed/DELgOJ?default-tab=result" frameborder="no" loading="lazy" allowtransparency="true" allowfullscreen="true">
    See the Pen <a href="https://codepen.io/chriscoyier/pen/DELgOJ">
    Animation to Explain CSS Triangles</a> by Chris Coyier  (<a href="https://codepen.io/chriscoyier">@chriscoyier</a>)
    on <a href="https://codepen.io">CodePen</a>.
  </iframe>
</div>
  
<div class="page-content">
  <div class="wrapper horizontal center">
    <p>Uma aplicação prática interessante é criar balões de diálogo utilizando triângulos feitos em CSS para indicar a ponta do balão.</p>
    <img src="/img/blog/speech-bubble-example.png" alt="Exemplo de um balão de diálogo feito com CSS"/>
  </div>
</div>

```css
blockquote {
  margin-bottom: 60px;
  padding: var(--spacing-s);
  font-size: 1.15em;
  font-style: italic;
  font-weight: 400;
  color: var(--grey-color-500);
  background-color: var(--grey-color-100);
  position: relative;
}

blockquote::before {
  content: "";
  position: absolute;
  top: 100%;
  left: 100px;
  width: 0;
  height: 0;
  border: 20px solid transparent;
  border-top-color: var(--grey-color-100);
  border-left-color: var(--grey-color-100);
}
```

A flexibilidade dessa técnica oferece oportunidades criativas para aprimorar a estética do seu design. Experimente e descubra como essa abordagem pode ser valiosa em diversos contextos.