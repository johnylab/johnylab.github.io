---
codigoTexto: 74
title: "Session - coleções, eventos, método e propriedades "
excerpt: >
  ... permite preservar as informações de um mesmo usuário quando ele passa de uma página para outra...
img: /imagens/microsoft-asp.JPG
categories: ASP
tags: ASP, objeto, Session, sessão
---

O objeto Session permite preservar as informações de um mesmo usuário quando ele passa de uma página para outra da mesma aplicação.

### Coleção:
<b>Contents:</b> Pode armazenar quaisquer valores, inclusive objetos, que ficam armazenados em um cookie de sessão enquanto a sessão durar.
<em>Session.Contents.Item("nome") = Jon</em> 

### Eventos:
<b>OnStart:</b> Ocorre quando uma nova sessão é criada. Isso acontece, por exemplo, quando o usuário acessa uma página da aplicação pela primeira vez.

<b>OnEnd:</b> Ocorre quando a sessão é encerrada.

### Métodos:
<b>Remove:</b> Remove uma variável da sessão.
<em>Session.Remove("nome")</em> 

<b>RemoveAll:</b> Remove todas as variáveis da sessão.
<em>Session.RemoveAll</em> 

<b>Abandon:</b> Abandona (anula) a sessão atual.
<em>Session.Abandon</em> 

### Propriedades:
<b>CodePage:</b> configura ou retorna o código de caracteres que a página irá usar, se for chinês, japonês ou ocidental.
<em>Session.CodePage = 1252</em> 

<b>LCID:</b> configura ou retorna o código de identificação da localidade da página.
<em>Session.LCID = 1046</em> 

<b>Timeout:</b> Define o tempo em minutos que a sessão deve durar.
<em>Session.Timeout = 30</em> 

<b>SessionID:</b> Obtém o id da sessão atual, ou seja, um código único que identifica a sessão corrente.

### Mais informações sobre o objeto Session



- <b>Web Nets</b> <br>
<a href="http://www.webnets.com.br/tutoriais.asp?id=13" target="_blank" title="Abrir link externo em uma nova janela ou aba">http://www.webnets.com.br/tutoriais.asp?id=13</a>

- <b>Criar Web</b> <br>
<a href="http://www.criarweb.com/artigos/272.php" target="_blank" title="Abrir link externo em uma nova janela ou aba">http://www.criarweb.com/artigos/272.php</a>

- <b>Programação em ASP</b> <br>
<a href="http://quantodaniel.wordpress.com/2007/11/13/objeto-session-asp/" target="_blank" title="Abrir link externo em uma nova janela ou aba">http://quantodaniel.wordpress.com/2007/11/13/objeto-session-asp/</a>

