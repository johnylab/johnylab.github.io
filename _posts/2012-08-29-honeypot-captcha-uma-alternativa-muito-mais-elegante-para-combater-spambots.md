---
title: Honeypot Captcha, uma alternativa muito mais elegante para combater spambots
date: 2012-08-29 21:00:00 -03:00
categories:
  - Tutoriais
tags:
  - antispam
  - captcha
  - formulário
  - validação
excerpt: |-
  Em vez de fazer o usuário digitar aquela imagem chata, crie um campo que
  não é pra ser preenchido. Pode ter o mínimo de tamanho e depois torne-o invisível
  com {display:none;}...
img: /img/css-abbreviations.jpg
---

<blockquote>
  <div class="horizontal center" style="gap: var(--spacing); flex-wrap: wrap;">
    <div style="flex: 1 1 211px">
      <img src="{{site.baseurl}}/img/blog/captcha.png" alt="Exemplo de captcha"/>
    </div>
    <div style="flex: 1 1 400px;">
      <p>Além da grande barreira de acessibilidade, já que os CAPTCHAs tradicionais não costumam ser acessíveis, novas modalidades de CAPTCHA mais difíceis vem sendo criados para evitar que robôs consigam acessar seus formulários.</p>
      <p><small>Reinaldo Ferraz, em <a href="http://tableless.com.br/eu-nao-sou-uma-maquina/" target="_blank" title="Tableless / Acessibilidade">Eu não sou uma máquina</a></small></p>
    </div>
  </div>
</blockquote>

Honeypot Captcha é o nome dado a uma técnica para evitar o preenchimento de formulários por <em lang="en">spambots</em>, sem que o usuário tenha que fazer nenhum esforço adicional para provar que é um ser humano. Em vez de fazer o usuário digitar aquela imagem chata, crie um campo que <strong>não é pra ser preenchido</strong>. Pode ter o mínimo de tamanho e depois torne-o invisível com <code>{display:none;}</code>.
 
Quando o <em lang="en">spambot</em> tentar mandar uma mensagem, ele não terá como saber o que é aquele campo, então o preencherá e por isso será bloqueado. Sem o usuário ser incomodado.
 
<a href="http://jsfiddle.net/johnylab/qEy75/" target="_blank">Veja um exemplo de Honeypot Captcha.</a>
 
Antes do botão de Enviar Mensagem, tem um campinho de input no HTML, que só um spambot verá, pois fica oculto para o usuário através do CSS. Ao receber uma submissão do formulário, o servidor verifica se este campo está vazio. Se não, uma página de erro "Não foi possível..." é exibida, sem ser enviada nenhuma informação. Pronto, fim do CAPTCHA pra sempre.
 
Mais detalhes (em inglês):
<a href="http://haacked.com/archive/2007/09/11/honeypot-captcha.aspx" target="_blank">Honeypot Captcha - You’ve Been Haacked</a>