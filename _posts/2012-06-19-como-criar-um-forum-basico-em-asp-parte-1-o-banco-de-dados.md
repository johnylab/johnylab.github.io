---
title: 'Como criar um fórum básico em ASP - parte 1: o banco de dados'
date: 2012-06-19 00:00:00 Z
categories:
- ASP
tags:
- fórum,
- ASP,
- banco
- de
- dados,
- mensagens
codigoTexto: 83
excerpt: 'Antes de mais nada, o fórum vai precisar de uma base de dados. Eu uso mysql,
  mas isso não importa muito pois o exemplo é bastante simples, podendo ser feito
  em Access...

'
img: "/imagens/article-using-asp.jpg"
---

Vi isso num tutorial na internet há algum tempo, mas não lembro mais onde. Este tutorial pretende mostrar os passos para criar os recursos básicos de um fórum com asp.

## Primeiro passo: o banco de dados

Antes de mais nada, o fórum vai precisar de uma base de dados. Eu uso mysql, mas isso não importa muito pois o exemplo é bastante simples, podendo ser feito em Access ou qualquer outro banco disponível. 

A base terá 2 tabelas:



### foruns

A tabela que conterá os dados sobre os <em>sub-fóruns</em> que serão criados. Terá os seguintes campos:


-   forumID: campo chave-primária do tipo Inteiro, com numeração automática. Terá o valor único que identifica cada fórum.
-   topico: campo tipo texto com 255 de tamanho. Conterá o título, que será exibido como um link na página inicial e como título na página do fórum.
-   descricao: campo tipo texto longo. Terá uma descrição opcional a ser exibida no fórum.
-   ultimaMensagem: campo tipo data/hora, que terá a data da última mensagem que foi salva no fórum
-   postagens: campo tipo inteiro que conterá a quantidade de mensagem que o fórum recebeu


### mensagens

Guardará as mensagens deixadas em cada fórum. As mensagens serão relacionadas cada uma ao seu fórum específico através de uma <em>chave estrangeira</em>. Terá os campos a seguir:


-   msgID: campo chave-primária do tipo Inteiro, com numeração automática. Terá o valor único que identifica cada mensagem.
-   mensagem: campo tipo texto longo que conterá a mensagem em questão.
-   dataDaMensagem: campo tipo data/hora, que terá a data em que a mensagem foi salva.
-   forum: campo chave estrangeira tipo inteiro que identificará a qual fórum a mensagem pertence. Chave estrangeira significa que os valores serão obtidos de uma chave de outra tabela, no nosso caso a tabela <em>foruns</em>.


