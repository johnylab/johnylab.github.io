---
name: site-audit
description: Auditoria do site: SEO, acessibilidade, links quebrados, performance de mídia e consistência de conteúdo. Gera relatório, não altera sem pedir.
---

Checklist (rode build primeiro, `bundle exec jekyll build`):
- **SEO:** `<title>` e meta description por página, Open Graph/Twitter, sitemap (jekyll-sitemap), `robots.txt`, canonical, `lang`.
- **Acessibilidade:** `alt` em todas as imagens, contraste, foco visível, ordem de headings, `prefers-reduced-motion` no vídeo da home, `aria-label` nos links de ícone.
- **Performance:** peso de `assets/video/*.mp4` e `img/*` (preferir WebP/AVIF, vídeo com `preload`/poster), CSS/JS desnecessários, lazy-loading.
- **Links:** externos e internos (`_site`), incluindo LinkedIn/GitHub e `blog/`.
- **Conteúdo:** home vs. currículo (use `site-sync-career`), posts antigos com código desatualizado, última data do blog.
Entregue: lista priorizada (impacto × esforço) com o arquivo/linha de cada item. Aplique só o que o João aprovar.
