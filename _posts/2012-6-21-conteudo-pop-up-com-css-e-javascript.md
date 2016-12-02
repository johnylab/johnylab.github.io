---
title: Conteúdo pop-up com CSS e javascript
excerpt: Código que gera uma janela pop-up baseada em estilos CSS. O JavaScript altera as propriedades para que a div apareça ou desapareça. Como não se trata de uma nova janela, não pode ser bloqueada.
img: /imagens/tubos.jpg
categories: JavaScript
tags: pop-up, JavaScript, CSS
---

O código abaixo mostra como criar uma janela pop-up baseada em CSS, que torna-se visível quando uma função em JavaScript altera o atributo `.

```
<!DOCTYPE html>
<html lang="pt-br">

<head>
  <title>Exibindo pop-up na página HTML</title>

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
     setTimeout ("fechar()", 3000);
   }

  </script>

</head>

<body>

   <DIV id="popup" class="popup"> 
     <p>Conteúdo do pop-up aqui.</p>
     <p><small class="fechar"><a href="javascript: fechar();">Fechar pop-up</a></small></p>
   </DIV>

   <p><a href="javascript: abrir();">Abrir POPUP</a>
      <a href="javascript: fechar();">Fechar POPUP</a></p>

</body>

</html>
```

A propriedade CSS `, que não serve apenas para ocultar o pop-up, mas garante que ele não afete o layout da página.

O programa javascript tem duas funções. A função ***fechar*** apenas retorna o pop-up ao seu estado original aplicando novamente o estilo CSS ` seja chamada após 3 segundo (3000 porque o tempo é passado em milissegundos).