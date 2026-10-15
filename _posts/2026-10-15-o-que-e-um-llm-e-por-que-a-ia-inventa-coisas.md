---
title: "O que é um LLM e por que a IA inventa coisas com tanta confiança"
excerpt: "Um LLM é um programa que prevê o próximo pedaço de texto. Entender isso explica tanto o que ele faz bem quanto por que ele erra com convicção."
date: 2026-10-15T12:00:00.000Z
tags:
  - ia
  - llm
  - alucinação
categories:
  - IA para iniciantes
---

Todo mundo fala de IA, mas pouca gente explica o que ela é. Esta é a primeira de uma série curta, sem jargão, para quem quer entender o suficiente para usar bem (e desconfiar na hora certa).

## O que é um LLM

LLM significa *large language model*, ou "modelo de linguagem grande". É o motor por trás do ChatGPT, do Claude e de ferramentas parecidas.

A melhor analogia é o **corretor do celular**, aquele que sugere a próxima palavra enquanto você digita. Agora imagine um corretor que foi treinado com uma fração enorme da internet, de livros e de código. Em vez de sugerir uma palavra, ele continua o texto inteiro: prevê qual pedaço vem a seguir, de novo e de novo, até formar uma resposta.

Esses "pedaços" se chamam **tokens**. Um token pode ser uma palavra curta, parte de uma palavra longa ou um símbolo.

Dois pontos importam daqui:

- O modelo **reconhece padrões** de texto. Por isso escreve bem, resume, traduz e gera código plausível.
- Ele **não consulta uma base de fatos** enquanto responde. O que ele "sabe" é o que ficou codificado nos padrões do treinamento.

## Por que ele inventa: a alucinação

Se o trabalho do modelo é completar o texto de forma coerente, o que acontece quando a resposta correta não está ali? Ele completa com o que *soa* certo. É isso que chamam de **alucinação**: uma resposta fluente, confiante e falsa.

Pense naquele colega que nunca diz "não sei". Ele não está mentindo de propósito; só foi treinado (no caso do modelo, literalmente) a sempre ter uma resposta pronta.

Alguns lugares onde isso aparece com frequência:

- citações e referências que parecem reais, mas não existem;
- nomes de funções ou opções de uma biblioteca que nunca existiram;
- números e datas específicos que o modelo "completou" sem ter a informação.

## Três defesas simples

1. **Dê o documento.** Em vez de perguntar de memória, cole o texto ou o trecho da documentação de onde a resposta deve sair.
2. **Peça a fonte e confira.** Se ele citar um link, um artigo ou uma função, abra e verifique.
3. **Teste o resultado, não o tom.** Código roda ou não roda. Um cálculo bate ou não bate. A confiança do texto não é prova de acerto.

## Resumindo

Um LLM é um previsor de texto muito bom. Isso o torna útil para rascunhar, explicar e acelerar trabalho, e perigoso para quem aceita a primeira resposta sem conferir.

No próximo post: por que a IA "esquece" o que você disse e o que fazer a respeito.

**Pergunta para você:** qual foi a coisa mais estranha que uma IA já te disse com toda a certeza?
