---
title: "Contexto e RAG: por que a IA esquece e como fazê-la consultar seus documentos"
excerpt: "A IA só enxerga o que está na 'mesa de trabalho' dela. Entenda o contexto e como o RAG coloca os documentos certos sobre essa mesa."
date: 2026-10-16T12:00:00.000Z
tags:
  - ia
  - rag
  - contexto
categories:
  - IA para iniciantes
---

No [post anterior]({{ site.baseurl }}/blog/o-que-e-um-llm-e-por-que-a-ia-inventa-coisas/) vimos que um LLM prevê texto e pode inventar quando não tem a resposta. Aqui vão duas ideias que explicam boa parte do comportamento dele no dia a dia: o **contexto** e o **RAG**.

## Contexto: a mesa de trabalho

O modelo só enxerga o que está no **contexto** da conversa: suas instruções, o histórico e os arquivos que você colou. Pense numa mesa de trabalho. O que está sobre a mesa, ele usa. O que não está, para ele simplesmente não existe.

A mesa tem tamanho limitado. Numa conversa muito longa, as coisas do começo podem cair da mesa, e é por isso que a IA parece "esquecer" uma regra que você deu lá atrás.

Dicas práticas:

- escreva um **resumo curto do que importa** (objetivo, regras, estilo) e cole no início, em vez de repetir tudo;
- ferramentas de código com agentes fazem isso com um arquivo fixo de instruções do projeto, que é lido antes de cada tarefa;
- se a conversa ficou longa e confusa, comece outra com o resumo.

## E se o documento é grande demais para a mesa?

Imagine que você quer um assistente que responda perguntas sobre os documentos da sua empresa: manuais, políticas, FAQs. Não dá para colar tudo no contexto. É aí que entra o **RAG** (*retrieval-augmented generation*, ou geração aumentada por busca).

A ideia é uma **prova com consulta**. Em vez de decorar tudo, o modelo abre o livro na página certa:

1. A pergunta chega ("como peço reembolso?").
2. O sistema **busca** os trechos mais relevantes numa base de documentos.
3. Esses trechos são colocados **no contexto**, junto com a pergunta.
4. O modelo responde com base neles.

### Como a busca acha a página certa

A busca não procura só palavras iguais. Cada trecho de texto é transformado em uma lista de números chamada **embedding**, que representa o significado dele. Trechos com significado parecido ficam "perto" um do outro. Assim, "como peço reembolso?" encontra o texto sobre "devolução de compras", mesmo sem as mesmas palavras. Os bancos de dados que guardam esses números e fazem essa busca são os chamados **bancos vetoriais**.

Um esboço do fluxo em Python (a função `embed` aqui é um espaço reservado para qualquer serviço de embeddings):

```python
import math

def cosseno(a, b):
    dot = sum(x * y for x, y in zip(a, b))
    return dot / (math.sqrt(sum(x * x for x in a)) * math.sqrt(sum(y * y for y in b)))

def buscar(pergunta, trechos, embed, k=3):
    q = embed(pergunta)
    ranqueados = sorted(trechos, key=lambda t: cosseno(q, embed(t)), reverse=True)
    return ranqueados[:k]

def montar_prompt(pergunta, trechos_relevantes):
    contexto = "\n---\n".join(trechos_relevantes)
    return f"Responda usando só os trechos abaixo.\n\n{contexto}\n\nPergunta: {pergunta}"
```

Em um sistema real, os embeddings dos trechos são calculados uma vez e guardados, não a cada pergunta. Mas a lógica é essa: **buscar, colocar no contexto, responder**.

## Por que isso importa

O RAG reduz as alucinações do post anterior, porque o modelo responde olhando para o documento em vez de adivinhar. Não as elimina: se a busca trouxer o trecho errado, a resposta sai errada com a mesma confiança.

**Pergunta para você:** que documento da sua rotina você gostaria que uma IA lesse por você?
