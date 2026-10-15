---
name: site-sync-career
description: Sincroniza a home do site (Tech Expertise, Professional Identity, Career Summary, descrição em _config.yml) com o currículo do João. Use quando o currículo mudou ou ao revisar o site.
---

1. Leia `~/Desktop/Projetos/job-search/resumes/resume.md` (fonte da verdade) e `docs/ai/memory.md`.
2. Compare com `index.html` (seções Tech Expertise, Professional Identity, Career Summary) e `_config.yml` (`description`).
3. Atualize só o que divergir: cargos, datas, tecnologias, bullets. **Não inventar** nada; se faltar fato, pergunte.
4. Mantenha o inglês e o estilo (lista curta, verbos de ação). Ordem cronológica reversa.
5. `bundle exec jekyll build` deve passar. Commit em branch; **não dar push sem OK**.
6. Atualize `docs/ai/memory.md` se a trajetória mudou.
