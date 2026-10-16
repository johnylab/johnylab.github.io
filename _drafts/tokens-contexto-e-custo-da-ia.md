---
title: "Tokens, contexto e custo: por que a IA fica cara (e como gastar menos)"
excerpt: "Tokens são os pedaços de texto que o modelo lê e escreve. Entender isso explica o custo, o limite de conversa e como economizar."
date: 2026-10-23T12:00:00.000Z
tags:
  - ia
  - llm
  - custos
categories:
  - IA para iniciantes
draft: true
---

Quem começa a usar IA no trabalho costuma esbarrar em duas perguntas: "por que isso fica caro?" e "por que a conversa chega num limite?". A resposta às duas é a mesma palavra: **token**.

## O que é um token

O modelo não lê letras nem palavras inteiras: ele lê **tokens**, pedaços de texto. Uma palavra curta pode ser um token; uma palavra longa, rara ou em outro idioma pode virar vários. Números, símbolos e código também viram tokens.

Regra prática para estimar: em português, uma página de texto costuma ter algumas centenas de tokens. A contagem exata varia por modelo.

## Por que isso define o custo

Na maioria dos serviços de IA para desenvolvedores, o preço é por **token de entrada** (o que você manda) e por **token de saída** (o que o modelo responde). Quanto mais texto entra e sai, mais caro fica.

## Por que isso define o limite da conversa

O modelo só enxerga o que está no **contexto** da conversa (instruções, histórico e arquivos colados), e o contexto tem tamanho máximo, medido em tokens. Quando a conversa passa do limite, o começo "cai da mesa", o que dá a impressão de que a IA esqueceu.

## Como gastar menos (e errar menos)

1. **Seja específico e curto:** diga o objetivo, as regras e o formato da resposta. Instrução vaga gera resposta longa.
2. **Cole só o necessário:** em vez do arquivo inteiro, cole o trecho relevante.
3. **Resuma em vez de repetir:** em conversas longas, escreva um resumo do que importa e comece uma conversa nova com ele.
4. **Peça o formato certo:** "em 5 tópicos" ou "só o código alterado" reduz tokens de saída.
5. **Use o modelo certo para a tarefa:** modelos menores resolvem tarefas simples por uma fração do custo.

## Em resumo

Tokens são a moeda da IA: custam dinheiro e ocupam espaço no contexto. Quem aprende a economizá-los gasta menos e costuma ter respostas melhores.

**Pergunta para você:** em que tarefa você gasta mais texto com a IA do que precisaria?
