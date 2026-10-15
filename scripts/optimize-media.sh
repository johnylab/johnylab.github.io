#!/usr/bin/env bash
# Gera mídia otimizada a partir dos originais (idempotente). Requer: ffmpeg, gifsicle, cwebp, sips.
# Originais em media-src/ (excluída do build). Saída: assets/video, img/.
set -euo pipefail
cd "$(dirname "$0")/.."
# GIFs -> WebP animado
for g in media-src/grid-minmax-*.gif; do
  gifsicle -O3 --lossy=80 "$g" -o /tmp/_g.gif 2>/dev/null || cp "$g" /tmp/_g.gif
  gif2webp -quiet -q 70 -m 6 -mixed /tmp/_g.gif -o "img/blog/$(basename "${g%.gif}").webp" 2>/dev/null || gif2webp -q 70 -m 6 "$g" -o "img/blog/$(basename "${g%.gif}").webp"
done
# Avatar rodapé (300px) e og:image (1200x630)
sips -Z 300 media-src/joao-ferreira.png --out /tmp/_av.png >/dev/null && cwebp -quiet -q 65 /tmp/_av.png -o img/joao-ferreira.webp
ffmpeg -y -v error -i media-src/joao-ferreira.png -vf "scale=-2:630,pad=1200:630:(ow-iw)/2:0:color=0xf5f5f5" -frames:v 1 -update 1 -q:v 4 img/og-image.jpg
# Capturas do blog
cwebp -quiet -q 80 media-src/thecodeplayer.png -o img/blog/thecodeplayer.webp
du -ch img/blog/*.webp img/*.webp img/og-image.jpg | tail -1
