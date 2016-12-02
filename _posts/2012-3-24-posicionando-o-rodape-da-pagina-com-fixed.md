---
title: Posicionando o rodapé da página com fixed
excerpt: Solução: {position:fixed;bottom:0;} Fixed posiciona sempre em relação à janela e não ao conteúdo da página.
img: /imagens/site.png
categories: CSS
tags: css, posicionamento, layout
---

Pergunta do meu amigo Celso Garcia:

<blockquote>
"Tenho uma página com uma altura de 200 px ou uma pagina com uma altura de 2000px.
Preciso deixar o rodapé sempre lá embaixo.
Já usei ` e funciona pra um ou para outro."
</blockquote>

```
* {  
   padding: 0px;  
    margin: 0px;  
}  
  
html, body 
{  
    height: 100%;  
}  
 
#page 
{  
    min-height: 100%;  
    position: relative;  
}  
  
#footer 
{  
    width: 100%;  
    bottom: 0;  
    position: absolute;  
}  
```

Solução:

```
{position:fixed;bottom:0;}
```

Fixed posiciona sempre em relação à janela e não ao conteúdo da página.

Também serve pra esconder uma parte do elemento ou ele todo pois nunca gera barra de rolagem.