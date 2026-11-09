---

title: "Como construí um framework de kanban com a IA (Python, JSON e CSV) e o que descobrimos no caminho"

excerpt: "Dois quadros que faziam quase a mesma coisa viraram um núcleo reaproveitável: servidor em Python puro, dados em JSON e CSV, uma tela descrita por configuração e zero JavaScript por quadro. Depois vieram o layout novo, uma auditoria de acessibilidade e um susto com uma tecla de atalho. Decisões, tropeços e custo."

date: 2026-11-09T12:00:00.000Z

tags:
  - ia
  - python
  - claude-code
  - json
  - refatoracao

categories:
  - IA aplicada

draft: true

---

<!-- RASCUNHO ATUALIZADO em 09/11/2026 (layout v3, auditoria de acessibilidade, tokens legíveis, refazer). Faltam exemplos de código, imagens e a revisão do tom; os "TODO" marcam o que expandir. Confirmar antes de publicar: números de custo e o que mencionar dos projetos pessoais (candidaturas e roteiros são pessoais; o repositório do núcleo ainda é privado). Não publicar sem o OK do João. -->

Eu usava dois quadros kanban feitos por mim e pela IA: um para organizar o trabalho de vários projetos e outro para acompanhar candidaturas de emprego. Funcionavam, mas tinham nascido separados. Quando fui mexer em um, percebi que estava reescrevendo o outro. Este post conta como transformamos os dois em um framework pequeno, só com a biblioteca padrão do Python, e o que aprendemos fazendo isso em uma conversa longa com o Claude Code.

## O ponto de partida

Cada quadro tinha o seu servidor, a sua página HTML com CSS e JavaScript embutidos, e a sua maneira de gravar dados. Medimos antes de decidir qualquer coisa:

| O quê | Resultado |
|---|---|
| Funções JavaScript com o mesmo nome nos dois quadros | 16 |
| Funções JavaScript realmente idênticas | 5 de 75 |
| Regras de CSS idênticas | 83 de 230 (29% dos bytes) |
| Quadros que escreviam no arquivo de dados sem trava | 1 |

O número que mais pesou foi o terceiro: as duas telas tinham divergido tanto que **copiar e colar não servia**. Reaproveitar de verdade exigia desenhar componentes genéricos e reescrever os dois quadros em cima deles.

O pior problema, porém, era invisível: o arquivo de tarefas era reescrito por inteiro, sem trava e sem arquivo temporário. Com duas sessões da IA e o servidor trabalhando ao mesmo tempo, uma alteração podia simplesmente sumir.

## A ideia: núcleo, adaptador e um arquivo de configuração

Chegamos a três peças:

1. **Núcleo** (um repositório à parte): servidor HTTP local, armazenamento seguro, validação do esquema e uma interface genérica.
2. **Adaptador** (Python): entrega os cartões e executa as ações. É o único código que conhece o assunto do quadro (tarefas, vagas).
3. **`quadro.json`**: descreve a tela inteira, com abas, colunas, chips, campos do painel, botões e formulário de novo cartão.

A regra que guiou tudo: **nenhum quadro tem JavaScript ou CSS próprio**. Se faltar um recurso, ele entra no núcleo. Hoje um quadro novo é um arquivo de configuração mais um adaptador de algumas centenas de linhas. O quadro de um projeto isolado, filtrado, são cinco linhas de JSON.

<!-- TODO: mostrar um quadro.json enxuto (5 a 10 linhas) e o contrato do adaptador (estado, acoes, detalhe). -->

## Python puro, JSON e CSV

Não usamos framework web nem banco de dados. O servidor é `http.server`, o dado é JSON ou CSV e a trava entre processos é `fcntl.flock`. Três decisões merecem destaque:

- **Escrita atômica com trava.** Gravamos num arquivo temporário na mesma pasta e trocamos de uma vez; a trava impede que duas alterações se atropelem. O teste de concorrência (4 processos incrementando um contador 25 vezes cada) deu **31 em vez de 100** sem a trava. Em outro teste, 4 processos adicionando 10 tarefas cada deixaram só 13 das 40 sem a trava.
- **O servidor só aceita o que ele mesmo gerou.** Token por execução, checagem do cabeçalho `Host`, ações e comandos em lista fechada e, para rascunhos, o navegador manda só o id do cartão, nunca o caminho do arquivo.
- **O que o dado diz, a configuração mostra.** As condições dos chips (por exemplo, "tem data mas não tem evento no calendário") são avaliadas no servidor, em Python, sem `eval`. O navegador só desenha.

O CSV merece uma nota à parte: o arquivo de tarefas do quadro de candidaturas usa fim de linha CRLF, e precisamos preservar isso ao regravar. Detalhes assim não aparecem em nenhum tutorial.

## Testar antes de refatorar

A primeira coisa que fizemos foi **escrever testes que congelam o comportamento atual**, antes de mexer em qualquer código. Rodam em pasta temporária (com `HOME` falso para um dos quadros e uma cópia do diretório para o outro), então nunca tocam nos dados reais.

Depois veio a prática que mais me surpreendeu: **validar os testes por mutação**. Quebrar o código de propósito e conferir que o teste falha. Já na primeira rodada isso mostrou que meu teste contra "travessia de pasta" (alguém pedir `../segredo.txt`) passava mesmo sem a proteção, porque o arquivo-isca que eu usava não existia fora da pasta. Consertamos colocando o arquivo-isca no lugar certo.

<!-- TODO: exemplo de teste de caracterização e de teste de concorrência com subprocessos. -->

## As descobertas (que não estavam no plano)

Uma lista curta do que aprendemos pelo caminho, quase tudo por tropeço:

- **Podar CSS por regra inteira derruba estilo vivo.** Uma regra `.nav,.sub{...}` caiu inteira porque `.sub` não existia mais, e levou junto o estilo da navegação. Podar por seletor resolve; conferir por script que todo id e classe usados no JavaScript existem no HTML e no CSS evita o susto.
- **A largura de um pop-up é do `dialog`.** O `dialog` tinha `max-width`, então qualquer largura nos filhos era ignorada. Definir o `max-width` no próprio `dialog` e deixar os filhos em 100% resolveu.
- **Cuidado com nomes de classe.** Eu quis usar `.md` como "tamanho médio", mas `.md` já era a classe do texto em markdown; usei `med`.
- **Python 3.8 não tem `dict | dict`.** O ambiente era antigo e o operador de união só chegou na 3.9.
- **O retorno da função importa.** Na atualização de CSV, a função recebe as linhas e, se devolver algo que não seja `None`, isso vira os dados novos. Um `r.pop(idx)` inocente trocou a lista inteira por uma linha.
- **Ids de tarefa arquivada não podem ser reaproveitados.** Passamos a recusar `add` com id repetido, inclusive o de tarefa já arquivada.
- **Markdown tem suas manhas.** Meu editor exige linha em branco entre parágrafos e depois de tabelas; conferimos os arquivos por script, e aprendemos a não mexer no front matter YAML.

<!-- TODO: escolher 2 ou 3 destas descobertas e transformar em posts curtos próprios. -->

## Resultado

Alguns números do antes e depois:

| Antes | Depois |
|---|---|
| CCPM: 293 linhas de JavaScript, 121 de CSS e 69 de HTML próprios | zero; só `quadro.json` (cerca de 150 linhas de configuração) e o adaptador |
| Candidaturas: HTML de 425 linhas e servidor de 377 | adaptador de 329 linhas e `quadro.json` |
| Tarefas encerradas misturadas com as abertas | arquivo por sprint; na simulação com dados reais, 108 tarefas viram 50 abertas mais 58 arquivadas, e o JSON cai pela metade |
| Nenhum teste | 104 testes no núcleo e 53 nos quadros |
| Alteração sem rastro | log de cada mudança, com o antes e o depois, e desfazer (`z` no quadro) |

O quadro também ganhou coisas que não existiam: um pop-up para ler, editar e aprovar rascunhos (com caixa de comentário para pedir ajuste), atalhos de teclado, um menu de ações, visão da semana e abas agrupadas, como "Pendências" e "Folga" virando colunas do backlog.

## Depois do núcleo: a tela, a acessibilidade e um susto

Com o núcleo pronto, redesenhamos a tela a partir de um documento de design. O que ficou:

- **Duas telas, decididas pela URL.** A lista de cartões e uma tela de detalhe em `/tarefa/<id>`, com endereço único por cartão. Dá para colar o link de uma tarefa no Calendar ou numa conversa e voltar exatamente ali.
- **Rodapé configurável por projeto.** Progresso da sprint, consumo do plano em barras que mudam de cor conforme a projeção até o reinício, e um botão de resumo.
- **Avisos com o peso certo.** Confirmação de rotina vai para o rodapé; erro e saída longa viram um aviso no canto superior direito, que dura 10 segundos e pausa quando o mouse está em cima.
- **Movimento discreto**, só com `transform` e `opacity` e desligado em `prefers-reduced-motion`: a transição entre lista e detalhe usa View Transitions, e o cartão que muda de coluna desliza.

### O susto da tecla "1"

Eu tinha deixado os números de 1 a 9 como atalho para as abas e, na tela de detalhe, também como atalho para as ações do cartão. Apertei "1" achando que trocava de aba e tirei uma tarefa da sprint. A correção virou regra do projeto: **teclas só navegam; toda ação pede confirmação**. Cada ação ganhou uma letra própria e um pop-up com dois botões que dizem o resultado do clique ("Manter a tarefa" e "Cancelar a tarefa"), com Enter para confirmar e Esc para voltar. O Esc do pop-up não pode fechar o detalhe por trás, então há uma pequena trava de 350 ms depois que ele fecha. Um teste guarda tudo isso.

### Auditoria de acessibilidade

Pedi uma auditoria e, para ela, nada de olhar a tela: um script de 20 linhas calculou a razão de contraste de cada token nos dois temas (o mínimo do WCAG AA é 4,5:1 para texto). O tema escuro tinha ficado um cinza médio, "claro demais" no meu olho, e o cálculo confirmou: o texto secundário e o de erro tinham 3,9:1 sobre o cartão, abaixo do mínimo.

| Texto sobre o cartão (escuro) | Antes | Depois |
|---|---|---|
| secundário (`muted`) | 3,9 | 6,5 |
| acento (`accent`) | 4,1 | 7,3 |
| erro (`danger`) | 3,9 | 6,9 |

A mesma tabela, rodada para todos os tokens, achou dois tons do tema claro (o verde de sucesso e o amarelo de atenção sobre a coluna) que também reprovavam, coisa que eu não teria visto a olho. Agora é um teste automático: se alguém trocar uma cor e o contraste cair, a suíte falha. Também entraram pop-ups nomeados para leitores de tela, o estado em texto além da cor (`72% · atenção`), um link "pular para o conteúdo", o modo de alto contraste do sistema, alvos de toque de 44 px, um seletor de tema (auto, claro e escuro) e o "Refazer" depois do "Desfazer".

### Nomes que se explicam

Os tokens de cor tinham nomes como `tx`, `mut`, `ac` e `bd`, e as classes CSS `mt`, `dp`, `ib`, `gh`. Eu mesmo não sabia o que eram. Renomeamos por função (`text`, `muted`, `accent`, `border`; `meter`, `detail-panel`, `icon-button`, `ghost`) com um mapa e um script, e um teste impede que os nomes antigos voltem. Cogitamos o Tailwind e descartamos: o núcleo é Python e JS/CSS puros, sem etapa de build, e trocar 250 linhas legíveis por classes utilitárias dentro de strings de JavaScript pioraria justamente a legibilidade.

### Um bug que só aparecia ao recarregar

Ao recarregar a página de uma tarefa, o conteúdo às vezes não aparecia. A transição animada monta o painel só no quadro seguinte, e o texto da tarefa podia chegar antes disso, sem lugar para ser escrito. A correção foi esperar a transição terminar antes de buscar o texto. A lição ficou em outro teste: os testes que liam só o texto dos arquivos não percebiam um parêntese perdido no JavaScript, então agora a suíte também roda `node --check` nos arquivos.

## Trabalhar com a IA

O que mais funcionou foi o método, mais que o código:

- **Plano antes de código, com decisões minhas.** O Claude escreveu o plano em arquivo, com alternativas, prós e contras e uma recomendação; eu marcava as decisões. Isso evitou retrabalho.
- **Rodadas pequenas, cada uma com testes verdes e commit.** E uma regra de honestidade: quando a estimativa estava errada, o plano era atualizado com o número real.
- **Medir o custo, não adivinhar.** Calibramos que **1 ponto da cota semanal custava cerca de US$ 1**. Os passos bem especificados e com testes saíram baratíssimos (o primeiro, menos de US$ 1). O que encareceu foi conferir a tela com imagens: o passo que usou screenshots custou US$ 3,68; o seguinte, maior e sem imagens, custou US$ 1,56. A refatoração inteira ficou em cerca de US$ 21, mais ou menos 21% da semana. Passei a pedir que a IA **calcule a interface em vez de olhar para ela**, e eu mesmo testo no navegador.
- **Quem decide o quê.** Decidi que a IA fecha a sprint (ela avisa em uma linha), que repositórios do GitHub só eu apago e que o quadro de candidaturas só é tocado com a janela dele fechada.
- **Etapas com custo no plano.** Para a fase de acessibilidade e UX, o documento trazia uma tabela com cada etapa, o custo estimado em dólares e em percentual da semana, e a coluna "real" preenchida ao fim de cada uma. A sequência custou cerca de US$ 2,79 (2,8% da semana) contra US$ 4,25 estimados. O que mais encareceu foi um erro meu, ao consertar um arquivo de testes e apagar sem querer várias classes.
- **Interface moldada em conversa.** Muita coisa surgiu de pedidos pequenos em sequência: mover o botão para o topo, deixar o pop-up mais largo, trocar um botão por uma caixa de comentário, tirar o rodapé e usar um menu de três pontos. Cada pedido virou uma linha na configuração ou uma regra no núcleo, não um remendo.

<!-- TODO: contar uma conversa real (um exemplo de pedido -> decisão -> commit) e discutir o que a IA errou. -->

## O que ainda falta

- Um quadro novo de verdade para provar a receita (hoje já são três: tarefas, candidaturas e roteiros de vídeo, o último construído em cima do primeiro).
- Publicar o núcleo (hoje é um repositório privado) com um exemplo mínimo e uma página de documentação.
- Um painel que mostre o consumo da IA por projeto, usando os mesmos indicadores do quadro.
- Indicadores novos no rodapé (funil de candidaturas e próximo prazo) e uma barra lateral para alternar entre os quadros.

<!-- TODO: ideias de posts derivados: (1) testes por mutação, (2) escrita atômica com trava em Python, (3) interface descrita por configuração, (4) como medir o custo de uma sessão com IA, (5) o que mudou na forma de pedir coisas à IA. -->
