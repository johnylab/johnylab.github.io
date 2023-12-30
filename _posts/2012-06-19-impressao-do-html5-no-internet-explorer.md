---
title: Impressão do HTML5 no Internet Explorer
date: 2012-06-19 21:00:00 -03:00
categories:
  - HTML
tags:
  - Explorer
  - HTML5
  - Internet
  - Standards
  - Web
  - padrões
excerpt: Você já deve conhecer o hack de Internet Explorer que permite renderizar adequadamente os estilos do HTML5 na tela...
img: /img/HTML-5-Logotipo-Oficial.png
---

Você já deve conhecer o hack de Internet Explorer que permite renderizar adequadamente os estilos do HTML5 na tela...

```javascript

// Discussões e comentários, visite: http://remysharp.com/2009/01/07/html5-enabling-script/

(function(){

  if ( !/*@cc_on!@*/0 ) return;
  
  var e = "abbr,article,aside,audio,bb,canvas,datagrid,datalist,details,dialog,eventsource,figure,footer,header,hgroup,mark,menu,meter,nav,output,progress,section,time,video".split(',');
  
  for ( var i=0; i<e.length; i++ ){
    document.createElement(e[i])
  }

})();

```

... mas garantir a formatação correta da página durante a impressão é outra história. Mesmo usando o "arranjo" em javascript mostrado acima, os elementos não seriam estilizados corretamente quando enviados para impressão.

Recentemente no <a href="http://davidwalsh.name/html5-print?utm_source=feedburner&utm_medium=feed&utm_campaign=Feed%3A+Bludice+%28David+Walsh+Blog+%3A%3A+PHP%2C+CSS%2C+MooTools%2C+and+Everything+Else%29"  target="_blank">David Walsh Blog</a> foi publicada uma solução que funciona eficazmente: o <a href="https://github.com/aFarkas/html5shiv/blob/master/src/html5shiv-printshiv.js" rel="nofollow" target="_blank">Modernizr's "print-shiv" extra</a>, que envolve os elementos HTML5 com outras tags mais amigáveis para a impressão durante o evento <dfn title="Antes de imprimir">onbeforeprint</dfn>. Em seguida, limpa tudo novamente quando o evento <dfn title="Depois de imprimir">onafterprint</dfn> é disparado.

Não há nenhuma configuração especial a ser feita, bastando apenas incluir o javascript na página.

<a href="https://github.com/aFarkas/html5shiv/blob/master/src/html5shiv-printshiv.js" title="Clique para ir para o site externo" rel="nofollow" target="_blank">Baixe o arquivo no GitHub (de graça).</a>