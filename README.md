# lecture-UTLN-M1_Info_Math-DEV-OOCOL

Master 1 Informatique et Mathématiques — Développement OOCOL

Cours centré sur les notebooks Java et Git, utilisant le workflow de rendu Quarto partagé `ebpro/_quarto-utils` (v1.3.42).

## Structure

| Chemin | Source | Description |
|--------|--------|-------------|
| `01-notebook-java-introduction` | `ebpro/notebook-java-introduction` | Introduction à Java |
| `02-notebook-java-install` | `ebpro/notebook-java-install` | Installation de l'environnement Java |
| `03-notebook-java-maven` | `ebpro/notebook-java-maven` | Maven |
| `04-notebook-java-bases` | `ebpro/notebook-java-bases` | Bases de Java (POO) |
| `05-notebook-java-heritage` | `ebpro/notebook-java-heritage` | Héritage |
| `06-notebook-java-collections` | `ebpro/notebook-java-collections` | Collections |
| `07-notebook-java-exceptions` | `ebpro/notebook-java-exceptions` | Gestion des exceptions |
| `08-notebook-java-io` | `ebpro/notebook-java-io` | Entrées / sorties (I/O) |
| `09-notebook-java-serialisation` | `ebpro/notebook-java-serialisation` | Sérialisation |
| `10-notebook-git` | `ebpro/notebook-git` | Git (bases, workflows) |
| `11-notebook-java-after8` | `ebpro/notebook-java-after8` | Java (after8) |
| `12-notebook-java-jdbc` | `ebpro/notebook-java-jdbc` | JDBC |
| `13-notebook-revision-java` | `ebpro/notebook-revision-java` | Révisions Java |
| `dev-oocol-fil-rouge` | `ebpro/dev-oocol-fil-rouge` | Projet fil rouge DEV-OOCOL |
| `_quarto-utils` | `ebpro/_quarto-utils` @ v1.3.42 | Utilitaires Quarto partagés |

## CI

Le workflow `.github/workflows/ci-render.yml` appelle le workflow réutilisable
`ebpro/_quarto-utils/.github/workflows/render-quarto.yml@v1.3.42` avec :

- `utils-ref: v1.3.42`
- `site-transport: staging`
- `hang-detection-minutes: 20`
- `deploy-static: ${{ github.event_name != 'pull_request' }}`
- `quarto-image: ghcr.io/ebpro/solen:quarto-full-ea70f62`
- `profiles: notes,slides`
- `enable-docker: true`
