#!/usr/bin/env bash
# Copia el trío de un proyecto a la carpeta .agents/agents/ de un clon.
# Uso: ./copiar-agentes.sh <proyecto> <ruta-del-clon>   (ej.: rf-try-clone ~/antigravity-pruebas/rf-try-clone)
set -euo pipefail
aqui="$(cd "$(dirname "$0")" && pwd)"
origen="$aqui/agentes/$1"; destino="$2/.agents/agents"
[ -d "$origen" ] || { echo "No hay agentes para $1" >&2; exit 1; }
mkdir -p "$destino"; cp "$origen"/*.md "$destino"/
echo "Copiados a $destino:"; ls "$destino"
