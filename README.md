# lecture-UTLN-M1_Info_Math-DEV-OOCOL

Master 1 Informatique et Mathématiques — Développement OOCOL

Cours centré sur les notebooks Java et Git, utilisant le workflow de rendu Quarto partagé `ebpro/_quarto-utils` (v1.1.9).

## Structure

| Chemin | Source | Description |
|--------|--------|-------------|
| `01-notebook-git` | `ebpro/notebook-git` | Notebooks Git (bases, workflows) |
| `02-notebook-java-jpa` | `ebpro/notebook-java-jpa` | Persistance Java avec JPA |
| `03-notebook-java-restfullws` | `ebpro/notebook-java-restfullws` | API REST avec JAX-RS |
| `_quarto-utils` | `ebpro/_quarto-utils` @ v1.1.9 | Utilitaires Quarto partagés |

## CI

Le workflow `.github/workflows/ci-render.yml` appelle le workflow réutilisable
`ebpro/_quarto-utils/.github/workflows/render-quarto.yml@v1.1.9` avec :

- `profiles: 'notes,slides'`
- `utils-ref: 'v1.1.9'`
- `deploy: true`
- `nested-dind: true`
