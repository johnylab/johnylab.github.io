---
layout: page
title: IA para iniciantes
description: "Série em português que explica IA sem jargão: LLMs, contexto, RAG, agentes e como saber se a IA acertou."
lang: pt-BR
permalink: /ia-para-iniciantes/
---

<div class="wrapper">

Uma série curta e prática para quem quer entender IA o suficiente para usá-la bem (e desconfiar na hora certa). Cada texto tem uma analogia, defesas práticas e uma pergunta para você responder.

{% assign serie = site.posts | where_exp: "p", "p.categories contains 'IA para iniciantes'" | sort: "date" %}
{% if serie.size > 0 %}
<ol>
  {% for post in serie %}
  <li>
    <a href="{{ post.url | prepend: site.baseurl }}">{{ post.title }}</a>
    <br /><span class="post-meta">{{ post.date | date: "%d/%m/%Y" }}</span> — {{ post.excerpt | strip_html | truncatewords: 30 }}
  </li>
  {% endfor %}
</ol>
{% endif %}

**Roteiro da série:**

1. O que é um LLM e por que a IA inventa coisas.
2. Contexto e RAG: por que a IA esquece e como fazê-la consultar seus documentos.
3. Agentes de IA e como saber se a IA acertou.

Quer sugerir um tema? Me conte no [LinkedIn](https://www.linkedin.com/in/johnylab/) ou por [e-mail](mailto:contato@johnylab.com.br).

</div>
