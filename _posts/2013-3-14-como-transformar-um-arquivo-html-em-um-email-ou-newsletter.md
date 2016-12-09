---
title: "Como transformar um arquivo HTML em um email (ou newsletter)"
excerpt: >
  Uma newsletter em HTML nada mais é do que uma página web dentro do corpo do e-mail. Então, para mandar um e-mail com o formato de uma página web (rich content, ou texto de conteúdo rico), você precisa seguir os mesmos passos para se fazer uma página de um
img: /imagens/code_snip.gif
categories: Tutoriais
tags: e-mail, newsletter, anexos
---

Pergunta feita no Yahoo Answers:

> ![Interface do KompoZer](http://johnylab.net/imagens/screenshot_homepage_KompoZer.png)
> 
> Eu montei um arquivo com o <a href="http://www.kompozer.net/" target="_blank" title="Ambiente de autoria para web">Kompozer</a> e queria saber o que eu tenho que fazer para mandar esse arquivo por email. Mas não por anexo, eu queria que a imagem que fiz aparecesse ja na hora de ABRIR O EMAIL, como uma newsletter.

#### Resposta

Uma <em>newsletter em HTML</em> nada mais é do que uma página web dentro do corpo do e-mail. Então, para mandar um e-mail com o formato de uma página web (rich content, ou texto de conteúdo rico), você precisa seguir os mesmos passos para se fazer uma página de um site.

No caso do <a href="http://www.kompozer.net/" target="_blank" title="Ambiente de autoria para web">Kompozer</a> ou qualquer outro editor, você precisa publicar a página em um servidor web primeiro. Se a mensagem existir em algum endereço web e funcionar direitinho lá, será mais fácil funcionar no e-mail. Depois, basta criar uma mensagem de e-mail com o código-fonte igual, lembrando de mudar os endereços das imagens e outros arquivos anexos para que o navegador encontre todos.

Se você usa um cliente de e-mail, como o Microsoft Outlook, Opera Mail ou Mozilla Thunderbird, pode copiar a página toda na janela do navegador e colar na janela de nova mensagem do cliente, que ele vai atualizar o código-fonte todinho pra você no ato de colar, para que a mensagem fique exatamente como a página que você publicou.

Lembre-se que existem muitos serviços de e-mail, e todos são diferentes, inclusive na maneira como eles exibirão a sua página. Para ter certeza que a newsletter vai funcionar sem erros na maioria deles, consulte o <a href="http://www.emailology.org/" target="_blank" title="Emailology - a ciência da boa exibição na caixa de entrada">Emailology</a>.

#### Antwort - Layouts responsivos para email

![Real responsive Email layouts](http://internations.github.com/antwort/images/responsive-graphic.png)

Recentemente a InterNations GmbH lançou o <a href="http://internations.github.com/antwort/" title="Antwort | Responsive Layouts for Email" target="_blank">Antwort</a>, um template responsivo para newsletters que promete funcionar em um grande número de dispositivos, principalmente os mais modernos.

Segundo a página do Antwort, o template funciona bem em versões mais recentes do Outlook (2000+). Feito com um design minimalista, levando em consideração o uso com conteúdo dinâmico, o template permite máxima customização, dedicando-se apenas a garantir a compatibilidade com diferentes dispositivos e serviços de e-mail.

Visite a página do <a href="http://internations.github.com/antwort/" title="Antwort | Responsive Layouts for Email" target="_blank">Antwort</a> ou <a href="https://github.com/internations/antwort" title="InterNations/antwort · GitHub" target="_blank">veja no GitHub</a>. O download é gratuito e o template pode ser usado sob licença MIT.