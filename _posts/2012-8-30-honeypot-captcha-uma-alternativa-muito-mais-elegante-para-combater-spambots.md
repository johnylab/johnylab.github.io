---
title: Honeypot Captcha, uma alternativa muito mais elegante para combater spambots
excerpt: Em vez de fazer o usuário digitar aquela imagem chata, crie um campo que não é pra ser preenchido. Pode ter o mínimo de tamanho e depois torne-o invisível com {display:none;}...
img: /imagens/css-abbreviations.jpg
categories: Tutoriais
tags: captcha, antispam, validação, formulário
---

<blockquote>
<img src="/imagens/captcha-300x193.jpg" alt="CAPTCHA" class="esquerda" />Além da grande barreira de acessibilidade, já que os CAPTCHAs tradicionais não costumam ser acessíveis, novas modalidades de CAPTCHA mais difíceis vem sendo criados para evitar que robôs consigam acessar seus formulários.
<small>Reinaldo Ferraz, <a href="http://tableless.com.br/eu-nao-sou-uma-maquina/" target="_blank" title="Tableless / Acessibilidade">Eu não sou uma máquina</a></small>
</blockquote>

Honeypot Captcha é o nome dado a uma técnica para evitar o preenchimento de formulários por <em lang="en">spambots*, sem que o usuário tenha que fazer nenhum esforço adicional para provar que é um ser humano. Em vez de fazer o usuário digitar aquela imagem chata, crie um campo que **não é pra ser preenchido**. Pode ter o mínimo de tamanho e depois torne-o invisível com `.
 
Quando o <em lang="en">spambot* tentar mandar uma mensagem, ele não terá como saber o que é aquele campo, então o preencherá e por isso será bloqueado. Sem o usuário ser incomodado.
 
<a href="http://jsfiddle.net/johnylab/qEy75/" target="_blank">Veja um exemplo de Honeypot Captcha.</a>
 
Antes do botão de Enviar Mensagem, tem um campinho de input no HTML, que só um spambot verá, pois fica oculto para o usuário através do CSS. Ao receber uma submissão do formulário, o servidor verifica se este campo está vazio. Se não, uma página de erro "Não foi possível..." é exibida, sem ser enviada nenhuma informação. Pronto, fim do CAPTCHA pra sempre.
 
Veja um artigo com muito mais detalhes (em inglês): <a href="http://haacked.com/archive/2007/09/11/honeypot-captcha.aspx" target="_blank">http://haacked.com/archive/2007/09/11/honeypot-captcha.aspx</a>