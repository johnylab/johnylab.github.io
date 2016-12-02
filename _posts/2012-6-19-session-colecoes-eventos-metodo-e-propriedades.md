---
title: Session - coleções, eventos, método e propriedades 
excerpt: ... permite preservar as informações de um mesmo usuário quando ele passa de uma página para outra...
img: /imagens/microsoft-asp.JPG
categories: ASP
tags: ASP, objeto, Session, sessão
---

O objeto Session permite preservar as informações de um mesmo usuário quando ele passa de uma página para outra da mesma aplicação.

### Coleção:
**Contents:** Pode armazenar quaisquer valores, inclusive objetos, que ficam armazenados em um cookie de sessão enquanto a sessão durar.
*Session.Contents.Item("nome") = Jon* 

### Eventos:
**OnStart:** Ocorre quando uma nova sessão é criada. Isso acontece, por exemplo, quando o usuário acessa uma página da aplicação pela primeira vez.

**OnEnd:** Ocorre quando a sessão é encerrada.

### Métodos:
**Remove:** Remove uma variável da sessão.
*Session.Remove("nome")* 

**RemoveAll:** Remove todas as variáveis da sessão.
*Session.RemoveAll* 

**Abandon:** Abandona (anula) a sessão atual.
*Session.Abandon* 

### Propriedades:
**CodePage:** configura ou retorna o código de caracteres que a página irá usar, se for chinês, japonês ou ocidental.
*Session.CodePage = 1252* 

**LCID:** configura ou retorna o código de identificação da localidade da página.
*Session.LCID = 1046* 

**Timeout:** Define o tempo em minutos que a sessão deve durar.
*Session.Timeout = 30* 

**SessionID:** Obtém o id da sessão atual, ou seja, um código único que identifica a sessão corrente.

### Mais informações sobre o objeto Session



- **Web Nets** <br>
<a href="http://www.webnets.com.br/tutoriais.asp?id=13" target="_blank" title="Abrir link externo em uma nova janela ou aba">http://www.webnets.com.br/tutoriais.asp?id=13</a>

- **Criar Web** <br>
<a href="http://www.criarweb.com/artigos/272.php" target="_blank" title="Abrir link externo em uma nova janela ou aba">http://www.criarweb.com/artigos/272.php</a>

- **Programação em ASP** <br>
<a href="http://quantodaniel.wordpress.com/2007/11/13/objeto-session-asp/" target="_blank" title="Abrir link externo em uma nova janela ou aba">http://quantodaniel.wordpress.com/2007/11/13/objeto-session-asp/</a>

