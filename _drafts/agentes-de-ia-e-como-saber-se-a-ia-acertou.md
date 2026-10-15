---
title: "Agentes de IA e como saber se a IA acertou"
excerpt: "Um agente é um LLM com ferramentas e um loop. Quando ele passa a agir sozinho, testar a resposta deixa de ser opcional."
date: 2026-10-19T12:00:00.000Z
tags:
  - ia
  - agentes
  - testes
categories:
  - IA para iniciantes
draft: true
---

Nos posts anteriores ([LLM e alucinação]({{ site.baseurl }}/blog/o-que-e-um-llm-e-por-que-a-ia-inventa-coisas/), [contexto e RAG]({{ site.baseurl }}/blog/contexto-e-rag-como-a-ia-consulta-seus-documentos/)): um LLM prevê texto, pode inventar e só enxerga o que está no contexto. Falta explicar o que muda quando ele ganha mãos, e como saber se dá para confiar no resultado.

## Chatbot e agente não são a mesma coisa

- **Chatbot:** você pergunta, ele responde.
- **Agente:** você dá um **objetivo**; ele usa **ferramentas** (rodar código, ler arquivos, chamar APIs), olha o resultado e decide o próximo passo, **em loop**, até terminar.

Pense num estagiário com acesso ao computador. Ele não só explica como fazer: faz e volta com o resultado. Ferramentas de programação como o Claude Code, o Cursor e o Copilot no modo agente funcionam assim. Existe até um padrão aberto para "plugar" ferramentas nesses agentes, o MCP (*Model Context Protocol*).

O loop, em pseudocódigo:

```python
while not terminou:
    acao = modelo.decide(objetivo, historico)   # qual ferramenta usar?
    resultado = executar(acao)                  # roda a ferramenta
    historico.append((acao, resultado))         # o resultado volta para o contexto
    terminou = modelo.acabou(historico)
```

A parte que muda o jogo é a segunda linha: o modelo não só fala, **age**. Por isso a pergunta importante deixa de ser "ele escreve bem?" e passa a ser: **o que o agente pode fazer sozinho e o que precisa de aprovação humana?** Ler arquivos é bem diferente de apagar um banco de dados.

## "Parece bom" não é critério

Se o agente trabalha rápido e com confiança, quem garante que acertou? Quem leva IA a sério cria **evals**: testes automáticos para as respostas, como os testes unitários que programadores já escrevem para código. Um conjunto de perguntas com respostas esperadas, rodado toda vez que algo muda (o prompt, o modelo, os documentos).

Sem eval, qualquer ajuste é palpite. Com eval, você vê se melhorou ou se quebrou algo que antes funcionava.

### Um exemplo mínimo

```python
casos = [
    {"pergunta": "Qual o prazo de reembolso?", "deve_conter": "30 dias"},
    {"pergunta": "Posso trocar um produto usado?", "deve_conter": "não"},
]

def rodar_evals(responder):
    falhas = []
    for c in casos:
        resposta = responder(c["pergunta"]).lower()
        if c["deve_conter"] not in resposta:
            falhas.append((c["pergunta"], resposta))
    print(f"{len(casos) - len(falhas)}/{len(casos)} passaram")
    return falhas
```

É simples de propósito: critério de aceite escrito **antes** de olhar a resposta.

## Três perguntas antes de aceitar o que a IA gerou

Para código gerado por IA, um filtro rápido que vale para qualquer pessoa:

1. Eu saberia explicar essa mudança sem olhar o código?
2. O que quebra se a suposição por trás dela estiver errada?
3. Existe um teste que falharia se a IA tivesse errado?

Se alguma resposta for "não", o código ainda não é seu: é só texto plausível. Com agentes escrevendo cada vez mais código, o gargalo deixa de ser digitar e passa a ser julgar.

## Fechando a série

A IA é um modelo que prevê texto (1), que só vê o que está no contexto (2), que pode inventar (3), que melhora com consulta (RAG, 4), que vira agente quando ganha ferramentas (5) e que só merece confiança quando é testada (6).

**Pergunta para você:** que tarefa repetitiva você entregaria a um agente? E qual jamais entregaria?
