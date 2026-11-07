---

title: "Como construí um framework de kanban com a IA (Python, JSON e CSV) e o que descobrimos no caminho"

excerpt: "Dois quadros que faziam quase a mesma coisa viraram um núcleo reaproveitável: servidor em Python puro, dados em JSON e CSV, uma tela descrita por configuração e zero JavaScript por quadro. Aqui estão as decisões, os tropeços e o custo."

date: 2026-11-07T12:00:00.000Z

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

<!-- RASCUNHO PARA ELABORAR: o esqueleto e os fatos estão aqui; faltam exemplos de código, imagens e a revisão do tom. Os trechos "TODO" marcam o que expandir. Confirmar antes de publicar: os números de custo e o que mencionar dos projetos pessoais. -->

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
| Nenhum teste | 61 testes no núcleo e 51 nos quadros |
| Alteração sem rastro | log de cada mudança, com o antes e o depois, e desfazer (`z` no quadro) |

O quadro também ganhou coisas que não existiam: um pop-up para ler, editar e aprovar rascunhos (com caixa de comentário para pedir ajuste), atalhos de teclado, um menu de ações, visão da semana e abas agrupadas, como "Pendências" e "Folga" virando colunas do backlog.

## Trabalhar com a IA

O que mais funcionou foi o método, mais que o código:

- **Plano antes de código, com decisões minhas.** O Claude escreveu o plano em arquivo, com alternativas, prós e contras e uma recomendação; eu marcava as decisões. Isso evitou retrabalho.
- **Rodadas pequenas, cada uma com testes verdes e commit.** E uma regra de honestidade: quando a estimativa estava errada, o plano era atualizado com o número real.
- **Medir o custo, não adivinhar.** Calibramos que **1 ponto da cota semanal custava cerca de US$ 1**. Os passos bem especificados e com testes saíram baratíssimos (o primeiro, menos de US$ 1). O que encareceu foi conferir a tela com imagens: o passo que usou screenshots custou US$ 3,68; o seguinte, maior e sem imagens, custou US$ 1,56. A refatoração inteira ficou em cerca de US$ 21, mais ou menos 21% da semana. Passei a pedir que a IA **calcule a interface em vez de olhar para ela**, e eu mesmo testo no navegador.
- **Quem decide o quê.** Decidi que a IA fecha a sprint (ela avisa em uma linha), que repositórios do GitHub só eu apago e que o quadro de candidaturas só é tocado com a janela dele fechada.
- **Interface moldada em conversa.** Muita coisa surgiu de pedidos pequenos em sequência: mover o botão para o topo, deixar o pop-up mais largo, trocar um botão por uma caixa de comentário, tirar o rodapé e usar um menu de três pontos. Cada pedido virou uma linha na configuração ou uma regra no núcleo, não um remendo.

<!-- TODO: contar uma conversa real (um exemplo de pedido -> decisão -> commit) e discutir o que a IA errou. -->

## O que ainda falta

- Um quadro novo de verdade para provar a receita (o terceiro caso de uso).
- Publicar o núcleo (hoje é um repositório privado) com um exemplo mínimo e uma página de documentação.
- Um painel que mostre o consumo da IA por projeto, usando os mesmos indicadores do quadro.

<!-- TODO: ideias de posts derivados: (1) testes por mutação, (2) escrita atômica com trava em Python, (3) interface descrita por configuração, (4) como medir o custo de uma sessão com IA, (5) o que mudou na forma de pedir coisas à IA. -->
