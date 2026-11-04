# Plano da vitrine do site (2026-11)

Complementa, sem repetir: `audit-2026-10-15.md` (situação no topo) e `plan-compressao-midia.md` (fases de compressão). O calendário de posts e a rotação de LinkedIn ficam no repo `job-search` (`networking/drafts/`); a oferta e o preço dos serviços de carreira ficam em `~/.claude/plans/detalhes/gift.md`. Próximas ações: `~/.claude/plans/tarefas.json` (projeto `johnylab-site-pages`).

Regras do site que valem aqui: nunca inventar fato (fonte: `job-search/resumes/resume.md`); sem dado pessoal; acessibilidade (`alt`, `prefers-reduced-motion`); commit e push diretos, corrigindo na hora se o build do Pages falhar.

## 1. Destaques (código aberto e experimentos)
- **Onde:** nova seção "Open source & experiments" em `projects/index.md` (EN) e `pt/projetos/index.md` (PT), depois de "Selected work". Fonte única da lista: os pins do GitHub (`johnylab`); o site resume com 1 linha por projeto e link, sem copiar README.
- **Conteúdo:** car-catalog-nestjs-graphql, octobusca (demo), br-input-masks (npm), threejs-surveillance-camera (demo + `docs/demo.gif` do repositório), claude-code-usage-monitor.
- **Home:** só um link "Open source" no bloco de abertura ou na lista de CTAs; sem duplicar a lista.
- **Aceite:** build ok; links testados; as duas línguas atualizadas juntas (`_data/i18n.yml` quando for texto da home).

## 2. Fotos
Inventário hoje (`img/`): `joao-ferreira.webp` (rodapé/avatar), `og-image.jpg` (compartilhamento), `johnylab-at-google*.webp`, duas fotos de 2022 (`in-my-office.jpg`, `dts-modern-workshop.jpg`).
- **O João fornece 3 fotos:** retrato (rosto, fundo limpo, ≥1200 px), trabalhando (mesa/tela) e uma de evento ou palestra. Sem crianças e sem documentos à vista.
- **Eu processo:** avatar WebP ~600 px (≤40 KB), `og-image.jpg` 1200×630 (≤120 KB; hoje 242 KB), versões para a página `/work/`; remover EXIF (localização); `alt` descritivo; atualizar `photo_alt` em `_data/i18n.yml`; só apagar as antigas depois de conferir o site.
- **Aceite:** prévia de link no LinkedIn e no WhatsApp com a imagem nova (testar com o link em uma conversa), soma de `img/` menor que hoje.

## 3. Vídeo do topo da home
Hoje: dois vídeos de banco de imagens (Pexels, ~5,8 MB cada), autoplay mudo.
- **Fase 1 (decidida, barata):** executar `plan-compressao-midia.md` (MP4 e WebM, poster, `preload="metadata"`): ~11,6 MB → ~2 MB.
- **Fase 2 (o João escolhe):** (a) manter o fundo abstrato; (b) loop próprio, gravado de um projeto dele (ex. a demo do threejs ou uma tela do car-catalog); (c) vídeo curto de apresentação (30 a 45 s, legendado, ele grava; o repo `job-search` já tem um áudio de apresentação). Recomendação: (a) agora e (c) depois, porque é o que mais converte para recrutador e cliente.
- **Aceite:** Lighthouse local com LCP < 2,5 s; `prefers-reduced-motion` respeitado; nenhuma mídia > 2 MB na home.

## 4. Serviços
O `/work/` (EN) e o `/pt/trabalhe-comigo/` já existem, escritos para vagas e contratos. Mudança: virar um **menu de serviços** com 3 blocos, cada um com para quem é, entregável, prazo típico e como contratar (e-mail e LinkedIn; formulário depois):
1. **Engenharia de IA/LLM/RAG sob contrato** (o que o currículo já comprova).
2. **Carreira:** revisão de currículo e LinkedIn + simulação de entrevista. Definição e preço: `gift.md` (decisão do João); o site só linka quando houver preço.
3. **Inglês para tech:** só publicar quando a oferta existir (`gift.md`, tarefa `ingles-oferta`).
- **Não inventar:** sem depoimento, número de clientes ou prazo que o João não tenha confirmado; preço só com ele.
- **Aceite:** páginas EN e PT iguais em estrutura; mailto testado.

## 5. Anunciar
Fonte do calendário: `job-search/networking/drafts/` (propostas aprovadas e rotação). Gatilhos de anúncio a abastecer:
- site atualizado (destaques, fotos novas, serviços);
- monitor de consumo público, com o post "como ensinei a IA a monitorar o próprio gasto" (rascunho em `_drafts/` aqui, versão curta para LinkedIn em `job-search`);
- continuação da série "IA para iniciantes" (roteiro em `ia-para-iniciantes/index.md`; textos em `_drafts/`);
- serviços (depois da oferta definida).
Canais: LinkedIn (perfil e post), grupo de WhatsApp da Gift, README do GitHub, rodapé de e-mail. Cada anúncio linka a página, não repete o texto dela.

## Ordem
1. Fotos (depende do João) e compressão de mídia (não depende).
2. Destaques open source (rápido, já há material).
3. Serviços, assim que o João fechar a oferta.
4. Anúncios, depois de cada entrega acima.
