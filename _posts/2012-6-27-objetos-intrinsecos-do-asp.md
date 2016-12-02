---
title: Objetos intrínsecos do ASP
excerpt: Lista dos objetos que são intrínsecos, ou seja, que pertencem ao Active Server Pages independentemente da linguagem utilizada
img: /imagens/tubos.jpg
categories: ASP
tags: ASP, objetos, componentes
---

ASP permite que você crie suas aplicações através de cinco objetos básicos:



- **Application:**<br>
Representa toda uma aplicação e serve para compartilhar informações entre diferentes usuários. Aplicação aqui significa todos os arquivos .asp dentro de uma mesmo diretório virtual e seus subdiretórios.

- **Session:**<br>
Armazena informacões de uma sessão de usuário em particular. O servidor Web cria automaticamente um objeto Session quando uma página é requisitada pelo usuário que ainda não tenha uma sessão. A sessão é destruida quando for abandonada (sair da aplicação) ou quando expirar.

- **Request:**<br>
Retorna os valores de uma requisição HTTP feita pelo browser (navegador) cliente, como as informações enviadas por um formulário. Observe, na barra de endereço do seu navegador que, para cada link deste site, acrescentamos um sinal de interrogação e alguns valores, no final do endereço desta página. Isso faz com que o script receba valores que são resgatados através do objeto Request.

- **Response:**<br>
Usado para enviar informações ao cliente, como criar Cookies ou gerar a saída html. Um dos comandos mais usados no ASP é Response.Write, que permite escrever textos na página gerada.

- **Server:**<br>
O objeto Server fornece métodos e propriedades que permitem interagir com a máquina em que sua aplicação está sendo executada, ou seja, o servidor da Web.



### Mais informações sobre os objetos ASP



- **Macoratti**<br>
<a href="http://www.macoratti.net/asp3.htm" target="_blank" title="Abrir link externo em uma nova janela ou aba">http://www.macoratti.net/asp3.htm</a>

- **CriarWeb**<br>
<a href="http://www.criarweb.com/artigos/258.php" target="_blank" title="Abrir link externo em uma nova janela ou aba">http://www.criarweb.com/artigos/258.php</a>

