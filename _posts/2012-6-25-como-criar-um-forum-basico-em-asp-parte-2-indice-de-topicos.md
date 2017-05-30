---
codigoTexto: 86
title: "Como criar um fórum básico em ASP - parte 2: índice de tópicos"
excerpt: >
  Agora que já criamos o banco de dados (veja aqui), vamos fazer o script que acessa os fóruns. Você pode acessar o fórum de exemplo aqui.
img: /imagens/article-using-asp.jpg
categories: ASP
tags: fórum, web, ASP, VBScript, SQL, RecordSet
---

Agora que já criamos o banco de dados (<a href="http://johnylab.net/index.asp?id=83">veja aqui</a>), vamos fazer o script que acessa os tópicos.

Esse script terá os links de cada tópico apontando para um segundo script que exibirá os textos do tópico selecionado.

Vamos acessar o banco de dados para começar:


{% highlight vb %}


<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>

<% 
' Conexão aberta
Set conn = Server.CreateObject("ADODB.Connection")
Set rs = Server.CreateObject("ADODB.RecordSet") 

' Altere a linha abaixo com os dados do seu banco de dados
conn.Open "Driver=MySQL ODBC 5.1 Driver; DATABASE=nomeDoBancoDeDados; SERVER=seuServidor; UID=seuID; PASSWORD=∗∗∗∗∗∗;" 

%>


{% endhighlight %}


Em seguida eu já vou verificar se o usuário está tentando salvar um novo tópico. Caso tenha sido enviado o título do novo tópico, ele será salvo no banco. Assim o novo título salvo já constará quando eu listar todos os tópicos, em seguida.


{% highlight vb %}


<%

If Request("topico") <> "" Then
sqlTopico = "INSERT INTO foruns (topico, descricao, ultimaMensagem, postagens) VALUES ('" & Request("topico") & "', '" & Request("descricao") & "', '', '')"
conn.Execute(sqlTopico)
End If

%>


{% endhighlight %}


Agora vamos começar a produzir o HTML para a página. Este exemplo foi atualizado para HTML5:


{% highlight html %}


<!DOCTYPE html>
<html lang="pt-BR">

<head>
  <meta  charset="iso-8859-1">
  <title>Fórum básico em ASP</title>
</head>

<body>

  <div class="conteudo">

  </div>

</body>

</html>


{% endhighlight %}


Já temos uma página vazia e uma <code>div</code> com a classe "conteudo", que poderá ser estilizada mais tarde através de um arquivo CSS. Dentro desta <code>div</code> vai o nosso conteúdo, que consistirá da lista de tópicos e do formulário para salvar um novo tópico.


{% highlight vb %}


<%

' Consulta que abre a tabela foruns
sqlForuns = "SELECT * FROM foruns"

' Armazena a consulta no objeto rs
Set rs = conn.Execute(sqlForuns) 

' Inicia a lista de fóruns (tópicos)
	Response.Write ""

' Loop que percorre os registros da tabela foruns enquanto não chegar ao final da consulta
While Not rs.EOF
	Response.Write "- "
	Response.Write "<a href=""mensagens.asp?id=" & rs("forumID") & """>"
	Response.Write rs("topico") & "</a>"
	Response.Write rs("descricao")
	Response.Write "<span>Última Mensagem: " & rs("ultimaMensagem") & "</span> (" & rs("postagens") & " postagens)"
	Response.Write ""
rs.MoveNext
Wend

' Fim da lista
	Response.Write ""

%>

<form action="foruns.asp" method="post" name="addForum">

  <fieldset><legend>Adicionar um tópico</legend>
  <p><label for="topico"> Título </label>
    <input name="topico" type="text" size="70" maxlength="255" />
  </p>
  <p>
    <label for="descricao"> Descrição </label>
    <textarea name="descricao" cols="60" rows="5"> </textarea>
    <input name="submit" type="submit" value="Criar" />
  </p>
  </fieldset>

</form>


{% endhighlight %}


Para mostrar os tópicos disponíveis, utilizamos uma nova consulta sql. Porém desta vez, armazenamos o resultado da consulta no objeto RecordSet que eu chamei de <strong>rs</strong>. Como resultado teremos todos os registros que o banco retornou, ou seja, os tópicos existentes no nosso sistema.

Inicia-se um loop `While` que se repetirá até percorrermos todos os registros do nosso objeto `rs`. Tudo o que está dentro do loop `While` será executado e repetido até que a expressão `Not rs.EOF` retorne *True*, indicando que chegamos ao final da consulta.

Atenção para um erro comum: sem o comando `MoveNext` do objeto `RecordSet`, o cursor do objeto continuará apontando para o mesmo registro, e o loop nunca chegará ao seu fim, gerando um erro no script.

Em seguida, temos o formulário HTML que aponta de volta para a mesma página com os dados para adicionar um novo fórum. Se preferir, retire-o da página para que somente pessoas autorizadas possam moderar o seu fórum.