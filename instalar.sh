#!/usr/bin/env bash
# Instala las reglas comunes y las skills globales de los tríos en ~/.gemini/config.
# Uso: ./instalar.sh [ruta-a-fo-skills]   (por defecto, la carpeta hermana fo-skills)
set -euo pipefail
aqui="$(cd "$(dirname "$0")" && pwd)"
skills_matt="${1:-$aqui/../fo-skills}"
cfg="$HOME/.gemini/config"
[ -d "$skills_matt/skills" ] || { echo "No encuentro fo-skills en $skills_matt" >&2; exit 1; }
mkdir -p "$cfg/fleet" "$cfg/skills"
ln -sfn "$aqui/reglas/comun.md" "$cfg/fleet/comun.md"
for r in pm wk rv; do ln -sfn "$aqui/reglas/$r.md" "$cfg/fleet/$r.md"; done
for d in "$skills_matt"/skills/{engineering,productivity}/*/ "$aqui"/skills/*/; do
  n="$(basename "$d")"
  [ -e "$cfg/skills/$n" ] && [ ! -L "$cfg/skills/$n" ] && { echo "salto $n (ya existe y no es enlace)"; continue; }
  ln -sfn "${d%/}" "$cfg/skills/$n"
done
echo "Listo: reglas en $cfg/fleet y skills en $cfg/skills"
