---
title: 'Editores online de HTML e CSS e o melhor de todos: o navegador'
date: 2013-09-26 00:00:00 Z
categories:
- Tutoriais
codigoTexto: 119
excerpt: 'Apesar de ser uma grande ideia (e bem didática), o Thimble não é nenhuma
  novidade. Para quem precisa de uma alternativa mais poderosa para testes avançados,
  já existem diversos aplicativos na web onde se pode testar códigos HTML, javascript
  e CSS.

'
img: "/imagens/thimble-mozilla.jpg"
---

A Mozilla lançou oficialmente seu <a href="https://thimble.mozilla.org/pt-BR/" target="_blank">novo editor online e gratuito de HTML e CSS</a>. Batizado como Thimble, o editor é simples e funcional. Além de não precisar de nenhum cadastro para começar a usá-lo, o serviço sugere alguns modelos de projetos para praticar.

![Thimble da Mozilla](https://raw.githubusercontent.com/wiki/mozilla/thimble.webmaker.org/tutorial.gif)

Indicado para pessoas que não são muito familiarizadas com <abbr title="Hypertext Markup Language">HTML</abbr> e <abbr title="Cascading Style Sheet">CSS</abbr>, o editor consiste de um campo de texto para inserção do código-fonte, com uma área de pre-visualização ao lado. A grande vantagem deste formato é poder ver as alterações acontecerem na página em tempo real, enquanto se digita na área de código. Instruções para quem deseja dar os primeiros passos na linguagem de marcação HTML são dadas como comentários na própria tela de código, e mensagens de erros, alertas e sugestões com acesso a referências de consulta são mostradas enquanto se digita.

Além de contar com um visual elegante e moderno, o novo editor online da Mozilla permite que os editores publiquem as páginas após sua edição. Com isso você pode criar seu próprio site através do Thimble e publicá-lo imediatamente.

## Outros aplicativos parecidos

Apesar de ser uma grande ideia (e bem didática), o Thimble não é nenhuma novidade. Para quem precisa de uma alternativa mais poderosa para testes avançados, já existem diversos aplicativos na web onde se pode testar códigos HTML, javascript e CSS e publicar imediatamente os resultados. Aqui estão os meus preferidos:

### jsFiddle

![jsFiddle](https://visualstudiomagazine.com/articles/2012/01/10/~/media/ECG/visualstudiomagazine/Images/2012/01/wcpap_jsfiddle11002fig.ashx)

O <a href="http://jsfiddle.net" target="_blank">jsFiddle</a> é um serviço completo para se testar <em lang="en" title="Trechos independentes de código.">snippets</em> sem ter de salvar vários arquivos de código. Até mesmo membros de grandes organizações, como o <a href="http://johnylab.net/?id=117"><abbr lang="en" title="Web Hypertext Application Technology Working Group">WHATWG</abbr></a> o utilizam para compartilhar testes. Você pode incluir automaticamente uma biblioteca de javascript, como a jQery, ou uma folha de estilos CSS já disponível, e digitar apenas o trecho de código que deseja testar. Perfeito para se praticar conceitos tanto de HTML como de CSS e javascript. A tela pode ser dividida em até quatro painéis: um para o HTML, um para o CSS adicional, um para a programação, e o último mostra o resultado de todos os outros funcionando em conjunto.

### TheCodePlayer

![The Code Player](http://www.improgrammer.net/wp-content/uploads/2015/01/The-Code-Player-1-1.png)

<a href="http://thecodeplayer.com/" target="_blank">TheCodePlayer</a>, como o nome já diz, é um "player de código". Contém diversos tutoriais, principalmente de efeitos avançados em CSS3, e também podem ser vistos com a tela dividida para exibir o resultado em tempo real. Mas a grande vantagem deste aplicativo é que ele também funciona como um player. Funcionando como se estivesse rodando um vídeo, ele mostra o código todo sendo digitado do jeito que o desenvolvedor fez, e você pode notar como as alterações vão afetando o resultado durante todo o processo. O efeito disso é tão impressionante quanto assistir o código sendo digitado sozinho, como se fosse uma transmissão de vídeo.

### CodePen

![CodePen.io](http://cheneytsai.github.io/slides-prototyping-tools/img/codepen.png)

<a href="http://codepen.io/" target="_blank">CodePen</a> é um meio termo entre os dois. Criado por <a href="http://codepen.io/chriscoyier" target="_blank">Chris Coyier</a>, tem uma interface que facilita pesquisa de trabalhos antigos, além de um blog para discussão, o que torna o aplicativo muito mais colaborativo. Você não pode dar <em lang="en">play</em> no código e vê-lo se explicando sozinho, mas tem a lista de experimentos de outros usuários para pesquisar. Outra vantagem é que você pode fazer login pelo seu perfil do Github para salvar os experimentos.

## Editar o HTML e CSS em tempo real direto no navegador

O melhor editor de todos na minha opinião, você já usa: o navegador web. E a maioria dos usuários brasileiros hoje usa o melhor navegador (na minha humilde não negociável opinião), que é o Google Chrome. Basta pressionar a tecla <kbd>F12</kbd> do teclado (ou <kbd>Ctrl + Shift + I</kbd>) para abrir o painel de Ferramentas para Desenvolvedores e sair mexendo no código-fonte.

Você pode testar o Dev Tools enquanto lê esta página. Comece por mais um atalho: clique com o botão direito do mouse neste parágrafo e selecione "Inspecionar elemento". Se você estiver usando o Internet Explorer vai ter que pressionar a tecla <kbd>F12</kbd> mesmo, pois é o único atalho que ele tem. No Opera não tem o F12, só <kbd>Ctrl + Shift + I</kbd>. Se quiser "inspecionar um elemento" específico da página no IE, não se desespere. No painel aberto, tem uma ferramenta com ícone semelhante a uma seta do mouse que serve para selecionar o elemento direto na página.

<figure>
    <img src="https://developers.google.com/chrome-developer-tools/images/image03.png" alt="Ferramentas para desenvolvedores Chrome DevTools">
    <figcaption>
        <small>O painel <a href="https://developers.google.com/chrome-developer-tools/" target="_blank" hreflang="en">DevTools do Google Chrome</a></small>
    </figcaption>
</figure>

Ao abrir o painel DevTools, você terá várias abas com recursos diferentes e muito úteis em diversos momentos do desenvolvimento do site. Na aba Console, por exemplo, você pode ver mensagens de erro de javascript e alertas, e digitar comandos de programação para testar os resultados sem o inconveniente de recarregar a página várias vezes. Em Elements está o <abbr title="HyperText Markup Language" lang="en">HTML</abbr> da página e os estilos aplicados a cada elemento. Selecione um elemento no <abbr title="HyperText Markup Language" lang="en">HTML</abbr> e veja ao lado (ou embaixo) os <i>styles</i> aplicados. Duplo clique em qualquer coisa para editar. Você pode fazer os testes que quiser alterando o código que está carregado no navegador antes de sair salvando direto no seu código-fonte.

É importante obervar que o <abbr title="HyperText Markup Language" lang="en">HTML</abbr> exibido no DevTools <strong>não é o código-fonte original da página</strong>. Ele exibe o resultado de scripts e até implementações do navegador, ou seja, o <abbr title="HyperText Markup Language" lang="en">HTML</abbr> processado pelo navegador. Se você inserir código com javascript na página, o resultado dessas operações será visualizado no painel. Para ver o código-fonte como ele foi enviado pelo servidor web, você ainda precisa usar a opção "Exibir código fonte", também presente em todos os navegadores.

Para aprender mais sobre o uso das Ferramentas para Desenvolvedores do seu browser preferido, visite o site <a href="http://devtoolsecrets.com/" target="_blank" hreflang="en">Secrets of the Browser Developer Tools</a>. Você pode filtrar informações de cada browser, agrupadas em diversas categorias, conhecer atalhos e ver as funcionalidades que estão presentes em mais de um navegador. Divirta-se!

PS.: Para saber mais sobre editar o código-fonte e visualizar os resultados em tempo real, experimente conhecer o <a href="http://tableless.com.br/emmet-livestyle/" target="_blank" hreflang="pt">Emmet LiveStyle</a>, um plugin que trabalha em conjunto com o DevTools do Google Chrome e permite testar o resultado em diversos dispositivos ao mesmo tempo.