# Plano: compressão de vídeos e imagens do site (2026-10-15)

## 1. Diagnóstico (medido)
| Item | Hoje | Observação |
|---|---|---|
| `assets/video/pexels-…232.mp4` (desktop) | 5,87 MB · 960×540 · 29,5 s · ~1,6 Mbps · H.264 + **áudio AAC** | autoplay **mudo** → áudio é peso morto (~0,45 MB) |
| `assets/video/pexels-…233.mp4` (mobile) | 5,76 MB · 540×960 · 29,5 s · ~1,6 Mbps · H.264 + áudio AAC | mobile carrega vídeo de desktop-class |
| 7 GIFs `img/blog/grid-minmax-*.gif` (892×222) | 3,3 MB (0,34–0,92 MB cada) | 1 post só |
| PNGs/JPGs do blog > 60 KB | ~1,4 MB (thecodeplayer 387 KB, chrome-devtools 226 KB, 3 JPG ~100 KB…) | |
| `img/joao-ferreira.png` | 302 KB · 1000×1000 | exibida a **150 px** no rodapé; também é o `og:image` |
| **Total** | vídeos 11,6 MB + img 5,1 MB = **16,7 MB** | |

Ferramentas locais: `cwebp`, `avifenc`, `sips` (já instalados); **faltam `ffmpeg` e `gifsicle`** (`brew install ffmpeg gifsicle`, ~300 MB de dependências, sem custo de tokens).
Observação: o histórico do git continua com os binários antigos (o clone não encolhe) — não recomendo reescrever histórico; o ganho é no **peso de página** (o que o visitante baixa).

## 2. Metas
- Vídeos: 11,6 MB → **~1,5–3 MB** (−75–85%), sem perda visível (fundo abstrato em movimento suave).
- Imagens: 5,1 MB → **~1,2–1,6 MB** (−70%).
- Home: tempo até o 1º quadro: poster WebP (~30–60 KB) aparece imediatamente; vídeo só carrega depois (`preload="metadata"`).
- Nada muda no design nem no texto; sem quebra de links de imagens dos posts.

## 3. Estratégia técnica
### 3.1 Vídeos (2 arquivos → 2 versões × 2 formatos + 2 posters)
1. Remover áudio (`-an`), `+faststart`, 30 fps → 24 fps (movimento suave, −20%).
2. **H.264 (fallback universal):** `-c:v libx264 -crf 29 -preset slow -pix_fmt yuv420p` → alvo ~1,0–1,8 MB cada.
3. **WebM VP9 (preferido, Chrome/Firefox/Edge/Safari ≥14.1):** `-c:v libvpx-vp9 -crf 36 -b:v 0 -row-mt 1` → alvo ~0,5–1,0 MB cada.
4. Mobile: reduzir para **360×640** (tela ≤600px não precisa de 540×960) → ~40% menor.
5. Posters: 1 quadro (t=1 s) → WebP q75 (`cwebp`) ~40 KB cada.
6. HTML (`_includes/home.html`): `<video poster="…" preload="metadata">` com `<source>` WebM antes do MP4 dentro de cada `media`. O script JS atual troca `video.src` por `source.src` por media query — precisa ser ajustado para escolher WebM se `video.canPlayType('video/webm; codecs="vp9"')`, senão MP4.

### 3.2 GIFs do blog (3,3 MB)
- **Opção A (recomendada):** converter para **WebP animado** com `gif2webp -q 70 -m 6` (−60–70% → ~1,1 MB total) e atualizar **1 post** (`<img src=…webp>`; navegadores modernos animam normalmente). Menor risco, não muda layout.
- Opção B: MP4/WebM em `<video autoplay loop muted playsinline>` (−90%: ~0,3 MB total), mas exige trocar a marcação de 7 imagens e atenção a acessibilidade (`aria-label`, controles).
- Fallback: `gifsicle -O3 --lossy=80 --colors 128` mantendo .gif (−30–40%) se quiser zero mudança de markup.

### 3.3 PNG/JPG
- `joao-ferreira.png` 1000 → **300 px** (WebP ~15–25 KB) para o rodapé **e** um JPG/PNG 1200×630 (~70 KB) dedicado ao `og:image` (WhatsApp/LinkedIn preferem JPG/PNG; WebP no og pode não renderizar).
- Capturas de tela dos posts (PNG): `cwebp -q 80` (−60–70%) ou `avifenc` (−75%) com `<picture>` fallback; fotos JPG: `sips -s formatOptions 75` / `cwebp -q 78`.
- Regra: manter a **mesma largura máxima exibida** (≤ 900 px, `--content-width`); gerar `.webp` ao lado do original e referenciar por `<picture>` ou trocar a extensão nos posts (sem apagar o original até conferir).
- `loading="lazy"` e `width/height` em todas as imagens dos posts e da home abaixo da dobra (evita layout shift).

### 3.4 Automação reaproveitável
Um único script idempotente `scripts/optimize-media.sh` (ffmpeg + cwebp + gifsicle + sips) que lê `assets/` e `img/`, gera a saída em `…/optimized/` e imprime a tabela antes/depois. Rodar localmente; **o CI não precisa de ffmpeg** (os arquivos otimizados vão no commit).

## 4. Fases, entregas e critério de aceite
| Fase | O que fazer | Aceite |
|---|---|---|
| 0 | `brew install ffmpeg gifsicle` (com seu OK); criar branch `media-compression` | `ffmpeg -version` ok |
| 1 | Script + encode dos 2 vídeos (MP4+WebM) + posters | cada vídeo ≤ 2 MB (MP4) / ≤ 1 MB (WebM); revisão visual lado a lado no Chrome (sem banding evidente) |
| 2 | Imagens: avatar/og, PNG→WebP, JPG recomprimido, GIFs→WebP animado | soma de `img/` ≤ 1,6 MB; posts renderizam iguais |
| 3 | Markup: `home.html` (sources, poster, preload), posts (picture/webp/lazy), og:image dedicado | build ok; Lighthouse local: LCP < 2,5 s, sem CLS novo |
| 4 | PR com tabela antes/depois e prints; após aprovação: merge + conferir deploy | deploy verde; `curl -I` dos assets com tamanho novo |

## 5. Estimativa de consumo do plano (Claude)
Medições desta sessão: ~0,04 ponto da **semana** e ~0,10–0,15 ponto da **sessão (5h)** por chamada de ferramenta em trabalho de site (inclui leitura de saída); o encode em si roda **local no `ffmpeg` e não gasta tokens**.

| Cenário | Chamadas de ferramenta | Semana | Sessão 5h | Observação |
|---|---|---|---|---|
| **A. Scriptado (recomendado)** | ~25–30 | **≈ 1,0–1,5 pt** | **≈ 3–5 pt** | 1 script faz todo o encode; poucos ciclos de verificação |
| B. Manual arquivo a arquivo | ~55–70 | ≈ 2,5–3,5 pt | ≈ 7–10 pt | mais ajustes finos por vídeo/imagem |
| Extra: Opção B dos GIFs (→ `<video>`) | +8–10 | +0,4 pt | +1–1,5 pt | edita a marcação de 7 figuras |
| Extra: Lighthouse/verificação visual detalhada | +6–8 | +0,3 pt | +1 pt | screenshots em escala pequena |

Faixa de erro ±50% (depende de quantas rodadas de ajuste de qualidade). Hoje a semana está em ~72% e a sessão ~55–60%: o cenário A cabe sem sair do modo normal (limite que você definiu: economizar só a partir de **90%** da semana; sessão ≥80% é o único risco, e fica longe).

Tempo de relógio estimado: ~25–40 min (encode VP9 `-row-mt 1` de 30 s em 540p leva ~1–3 min por arquivo no M-series).

## 6. Riscos e mitigação
- **Qualidade/banding no fundo suave:** testar CRF 28/29/31 em 5 s de cada vídeo, comparar visualmente, escolher o maior CRF sem artefato.
- **Safari antigo sem VP9:** o MP4 permanece como fallback no mesmo `<video>`.
- **`og:image` quebra:** manter PNG/JPG (não WebP) e só trocar após conferir a prévia no LinkedIn Post Inspector.
- **Reduzir demais o avatar:** o rodapé usa 150 px (2x = 300 px); `og:image` e perfil mantêm o original grande.
- **Histórico git pesado:** aceito; reescrever histórico (BFG) só se o tamanho do clone for um problema real.

## 7. Decisões que preciso de você
1. Posso instalar `ffmpeg` e `gifsicle` via Homebrew?
2. GIFs: **WebP animado (A)** ou `<video>` (B)?
3. Formatos de vídeo: MP4 + WebM (recomendado) ou só MP4 H.264?
4. Aceita reduzir o vídeo mobile para 360×640 (e 24 fps)?
5. Posso rodar o scriptado (cenário A) numa branch/PR e só mesclar com sua aprovação?

## Resultado (implementado em 2026-10-15)
- Decisões aplicadas: ffmpeg/gifsicle via Homebrew; GIFs → WebP animado; **só MP4** (WebM VP9 testado: ficou maior que o H.264 neste vídeo, descartado); mobile 360 px, 24 fps; PR sem merge automático.
- Vídeos 11,6 MB → 2,6 MB (desktop 1,7 MB CRF 33 · mobile 0,87 MB), sem áudio, poster WebP + `preload="metadata"`.
- GIFs 3,3 MB → 1,4 MB (WebP, `loading="lazy"`); avatar 302 KB → 37 KB WebP; `og:image` agora `img/og-image.jpg` 1200×630; `thecodeplayer` 396 → 44 KB.
- Total de mídia no `_site`: 16,7 MB → 5,4 MB. Originais em `media-src/` (excluída do build); regenerar com `scripts/optimize-media.sh`.

**Atualização:** vídeos do hero revertidos aos originais (qualidade da recompressão rejeitada pelo João). Vídeos seguem em `assets/video/` (11,6 MB); só imagens foram otimizadas.
