---
codigoTexto: 80
title: "Conteúdo pop-up com CSS e javascript"
excerpt: >
  Código que gera uma janela pop-up baseada em estilos CSS. O JavaScript altera as propriedades para que a div apareça ou desapareça. Como não se trata de uma nova janela, não pode ser bloqueada.
img: /imagens/tubos.jpg
categories: JavaScript
tags: pop-up, JavaScript, CSS
---

O código abaixo mostra como criar uma janela pop-up baseada em CSS, que torna-se visível quando uma função em JavaScript altera o atributo <code>display</code> e uma DIV é exibida por cima da página. Por não precisar abrir uma nova janela ou aba, o código na realidade não gera um pop-up, e sim uma parte do código-fonte, que estava oculta pelo estilo CSS <code>display:none;</code>.


{% highlight html %}

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

{% endhighlight %}


A propriedade CSS <code>position:fixed</code> manterá o conteúdo pop-up sempre visível, mesmo que o usuário role a página. O conteúdo é ocultado e omitido do processamento da página na linha <code>diplay:none</code>, que não serve apenas para ocultar o pop-up, mas garante que ele não afete o layout da página.

O programa javascript tem duas funções. A função <strong><em>fechar</em></strong> apenas retorna o pop-up ao seu estado original aplicando novamente o estilo CSS <code>display:none;</code>. A função <strong><em>abrir</em></strong> faz o inverso: muda a propriedade <code>display</code> para <code>block</code>, tornando o pop-up visível. Adicionalmente, coloquei um timeout na função que faz com que a função <code>fechar()</code> seja chamada após 3 segundo (3000 porque o tempo é passado em milissegundos).