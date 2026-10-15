---
name: blog-post
description: Rascunha um post de blog em português para o site, com o front matter do repositório. Sempre como rascunho; o João aprova antes de publicar.
---

1. Pergunte tema e público se não estiverem claros. Temas úteis: carreira/entrevistas, JavaScript/React, IA aplicada (série "IA para iniciantes"), mercado de trabalho.
2. Crie `_posts/AAAA-MM-DD-slug-sem-acentos.md` com front matter:
   ```
   ---
   title: ...
   excerpt: "uma frase"
   date: AAAA-MM-DDT12:00:00.000Z
   tags: [..]
   categories: [..]
   draft: true
   image: { path: /img/blog/<arquivo>, alt: "descrição" }
   ---
   ```
3. Texto em PT, 600–1200 palavras, direto e prático, com exemplo de código quando fizer sentido. **Só fatos verificáveis; nada inventado sobre a experiência do João.**
4. Rode `bundle exec jekyll build --drafts` para validar. Mostre o rascunho e espere o OK antes de remover `draft: true`, commitar ou dar push.
