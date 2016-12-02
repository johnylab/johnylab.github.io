---
title: Navegação de site com uma página só
excerpt: A resposta curta é: sim, dá pra fazer. Se você tem um site com bastante conteúdo, é melhor usar ajax (...), mas para um site com pouco conteúdo, você pode fazer tudo em uma página só...
img: /imagens/css-abbreviations.jpg
categories: HTML
tags: css, estilos, navegação, layout
---

Dúvida do meu amigo Pedro Albani:

<blockquote>

Gostaria de saber como fazer um "menu fixo" para todas as páginas de um site. Por exemplo, tenho um arquivo com o menu de navegação de um site, banner-home e rodapé. Sei como fazer isso usando php, gostaria de saber se é possível fazer usando html5 e css3. Bom, acho que consegui explicar a minha dúvida.

Estou procurando uma maneira de fazer um site bem simples, gostaria de saber se existe uma maneira de criar um layout fixo para todas as páginas, e quando clicou em outra categoria do menu, apenas o conteúdo da página abaixo foi carregado. Isso faz com o que a página seja carregada mais rápido, pois o menu, rodapé, banner não são recarregados.

</blockquote>

A resposta curta é: sim, dá pra fazer. Eu faria uma ressalva. Se você tem um site com bastante conteúdo, é melhor <a href="http://johnylab.net/?id=123">usar ajax (o javascript carrega o conteúdo externo e põe o resultado onde você mandar)</a>, mas para um site com pouco conteúdo, você pode fazer tudo em uma página só e através do CSS fazer com que apareça uma seção de cada vez. É uma ótima alternativa para muitos designers fazer o site com uma página só.

A navegação se dá através de hatchtag (#):
```
<a href="#algumasecao">Ir para "alguma seção"</a>
```

Você já deve ter visto isso funcionando em algum site. Quando clica no link com hatchtag, ele rola a página para mostrar algum elemento (se houver) que tenha um id correspondente ao nome chamado após o caractere de hatchtag (#). No caso do exemplo acima, você precisaria ter um elemento qualquer na página com um id correspondente, assim:
```
<section id="algumasecao">
<p>A página vai rolar até aqui.</p>
</section>
```

Mas até aqui ainda não é o que você queria. O truque no final é, através do CSS, criar um container para as seções ficarem "escondidas" (eu prefiro mascaradas), exibindo apenas uma de cada vez. Quando você então clicar num link, o container vai rolar o seu conteúdo para atender ao chamado do hatchtag, mas de uma forma velada, sem dar a impressão de que já estava lá, criando a impressão de um site *superultrarrápido*.