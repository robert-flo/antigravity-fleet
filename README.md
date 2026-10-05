# antigravity-fleet

Los tríos de bots de Roberto (PM, WK y RV por repo), traducidos a agentes custom de [Google Antigravity](https://antigravity.google/docs/subagents). Nació como copia de `robert-flo/fleet` y sigue las convenciones de Antigravity. Es un mundo separado de Grok Bot: nada de aquí cambia `robert-flo/fleet` ni a sus bots. Lo lleva Real dr eggbot dentro de pj-fleet.

## Qué hay
- `reglas/`: las reglas comunes (`comun.md`) y las de cada rol (`pm.md`, `wk.md`, `rv.md`). Se instalan globales en `~/.gemini/config/fleet/`.
- `agentes/<proyecto>/`: el trío de cada proyecto, un `.md` por agente con encabezado YAML. Van commiteados en `.agents/agents/` de cada repo del proyecto, por PR.
- `skills/`: skills propias que no están en `robert-flo/skills` (por ahora `restate-goals`).
- `docs/adr/`: las decisiones de este repo. `docs/fleet-heredado/`: copia de los ADRs, el glosario y las plantillas de fleet al 2026-10-04, solo como referencia.
- `instalar.sh`: enlaza las reglas y las skills (las de `robert-flo/skills` más las de aquí) en `~/.gemini/config`.
- `copiar-agentes.sh`: copia un trío a la carpeta `.agents/agents/` de un clon.

## Cómo se usa
```bash
git clone git@github.com:robert-flo/antigravity-fleet.git
git clone git@github.com:robert-flo/skills.git fo-skills
./antigravity-fleet/instalar.sh
./antigravity-fleet/copiar-agentes.sh rf-try-clone <clon-de-try-clone>
cd <clon-de-try-clone> && agy --agent PM-rf-try-clone
```
