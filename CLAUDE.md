# johnylab.github.io — instruções para sessões de IA

Site pessoal do **João Ferreira** (Santos, SP): https://johnylab.com.br. Jekyll + GitHub Pages
(`kramdown`, `jekyll-paginate`, `jekyll-sitemap`). Home e páginas em **inglês**; **blog em português**.

## Comandos
- `bundle exec jekyll serve` — preview local (http://127.0.0.1:4000)
- `bundle exec jekyll s -w --livereload` — preview com recarga automática
- `bundle exec jekyll build` — build; deve terminar sem erro antes de qualquer commit
- **Erro no Mac** `incompatible library version ... eventmachine / http_parser .bundle` (LoadError): as gems nativas em `vendor/bundle` foram compiladas com outro Ruby (ex.: rbenv 3.1.2 vs rvm 3.1.5). Correção: `bundle pristine` (recompila todas). Se faltar OpenSSL: `bundle config build.eventmachine "--with-cppflags=-I$(brew --prefix openssl@3)/include --with-ldflags=-L$(brew --prefix openssl@3)/lib"` e repita.
- `_site/` é artefato de build (gitignored): **nunca editar nem commitar**.

## Estrutura
- `index.html` — home (apresentação, Tech Expertise, blog, About, Career Summary).
- `_config.yml` — título/descrição/SEO. `_data/vcard.yml` — contato e redes.
- `_posts/AAAA-MM-DD-slug.md` — blog (front matter: title, excerpt, date, tags, categories, image.path/alt).
- `_layouts/`, `_includes/`, `css/`, `img/`, `assets/` — tema e mídia.

## Regras (obrigatórias)
1. **Nunca inventar fato.** Carreira, datas, cargos e números vêm do currículo, fonte da verdade:
   `~/Desktop/Projetos/job-search/resumes/resume.md` (repo `job-search`). Se faltar dado, pergunte.
2. **Nada de dado sensível no site:** CPF/RG/PIS, endereço, telefone pessoal, documentos. E-mail só o de `_data/vcard.yml`.
3. **Não publicar sem OK explícito do João:** `git push`, merge em `master` e deploy dependem de aprovação por mensagem.
   Trabalhe em branch (`refresh-AAAA-MM`), faça commits locais e mostre o `git diff`.
4. **Não reaproveitar a história "async-events/billing" do Dappier** — nunca aconteceu (ver `docs/ai/memory.md`).
5. Decisões editoriais já tomadas pelo João (não reverter): removeu "married" e "Family oriented"; mantém "father of three".
6. Posts de blog: sempre **rascunho primeiro** (`draft: true` ou arquivo em `docs/ai/drafts/`), em PT, tom direto e prático.
7. Acessibilidade e performance importam: `alt` em toda imagem, respeitar `prefers-reduced-motion` (já usado no vídeo da home).
8. Pronomes: se não declarados, use they/them para terceiros.

## Skills e comandos (`.claude/`)
- `site-sync-career` — sincroniza Career Summary/Tech Expertise com o currículo.
- `blog-post` — rascunha post PT com o front matter do repo.
- `site-audit` — checklist de SEO, acessibilidade, links e performance.
- `/preview` e `/audit` — atalhos para build/serve e auditoria.

## Memória e contexto
Fatos duráveis sobre o João e o site: `docs/ai/memory.md`. Atualize quando aprender algo novo (e remova o que ficar errado).
