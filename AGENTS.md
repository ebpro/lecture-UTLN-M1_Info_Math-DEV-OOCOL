# AGENTS.md — lecture-UTLN-M1_Info_Math-DEV-OOCOL

Playbook de maintien du cours (contenu français, slugs anglais). Quarto exclut
automatiquement `AGENTS.md` des cibles de rendu : ce fichier n'est jamais publié.

## Identité
- UE « DEV — OO Collaboratif », M1 Informatique-Mathématiques. Arc v2026 : « POO moderne : réutilisation & maintenabilité ».
- Le public est « Informatique-Mathématiques » au sens large : aucun contenu, exemple ou adresse ne doit cibler le sous-public mathématiques.
- Branches : `develop` = travail ; `feature/*` = vagues de refonte ; `YYYY` = snapshots. Vague en cours : `feature/upgrade-2026`.
- Site : base de navigation `https://bruno.univ-tln.fr/teaching-material/lecture-UTLN-M1_Info_Math-DEV-OOCOL/<segment>/` ; segment = `develop/` (branche par défaut), `previews/<slug-de-branche>/` (autres branches), `releases/<tag>/`.

## Architecture
- Un dépôt par cours. Contenus réutilisables = ELO en submodules `NN-notebook-*` ; configuration partagée = submodule `_quarto-utils` atteint par SYMLINKS (`_quarto.yml`, `_quarto-notes.yml`, `_quarto-slides.yml`, gabarit de galerie). Ne jamais materialiser ni forker ces symlinks : le `_quarto.yml` partagé est français par défaut ; une copie locale est de la dette inter-cours.
- Leçons spécifiques au cours en RACINE (pattern `80_ai_*`, `90_java_*`) : à monter (a) dans `course-order.yml` (section `sec-NN` dédiée, `sort: false` — l'ordre des sections et des `contents:` EST l'ordre pédagogique) et (b) dans les blocs de `index.qmd`, au-dessus des sections ELO. Les fichiers racine apparaissent en tête de la nav prev/next (ordre alphabétique Quarto) : cosmétique acceptée.
- Leçons legacy dé-listées de l'arc v2026 (5 fichiers : `05-notebook-java-heritage/05_java_101_L_Heritage.qmd`, `06-notebook-java-collections/06_java_101_L_Collections.qmd`, `12-notebook-java-jdbc/01/02/03_java_jdbc_*.qmd`) : restent dans leurs ELO (d'autres usages les citent — métadonnées APC du dépôt `teaching`, sorties du dépôt `notebooks-website`) ; leur exclusion du RENDU OOCOL est portée par `_metadata.yml` racine (négations `project.render`). Vérification obligatoire (404 des 5 URLs + zéro hit dans la sidebar du root index) après chaque bump `utils-ref` ou changement d'image de rendu.

## Contenu exécutable — règles prouvées en CI
- Le projet rend avec `error: false` : une cellule qui échoue sans consigne explicite met le build ROUGE. Cellule volontairement rouge = directive dépendant du langage : bash → `#| error: true` ; kernel `{java}` → `//| error: true`. En bash, `//|` est du code ordinaire : l'option est ignorée et le rendu meurt.
- Cellules bash auto-contenues : workspace sous `/tmp/...` recréé par `mkdir -p` + `cd` absolus dans chaque cellule (noyau bash neuf par cellule ; aucun état inter-cellule garanti).
- Réseau : `[ -f <fichier> ] || curl` avec retry + `sha256sum -c` avant usage (junit-platform-console-standalone-1.11.4.jar, sha256 `b016ef6b1c3454d6d7c2c88ce081dabf289699686af6622d6e4e2e1b54b4a2fc`, source repo1.maven.org).
- JUnit Console Launcher 1.11.4, forme canonique prouvée :
  `java -jar <jar> execute --disable-ansi-colors --disable-banner --fail-if-no-tests --class-path <out> --scan-class-path <out>`
  - `-s` et `-cp` ne sont PAS des options du launcher (`Unknown options` → run rouge).
  - `javac` sur des tests important JUnit exige `-cp <jar>`.
  - Le scan ne retient que les classes `^(Test.*|.+[.$]Test.*|.*Tests?)$` : une classe hors convention est exclue silencieusement (rc=0, CI verte, page fausse). Toujours nommer les classes de test `*Test`/`*Tests`.
  - Un run CI vert ne prouve pas l'exactitude du contenu : vérifier les SORTIES RENDERUES (arbres ✔/✘, compteurs `[N tests successful]`).
- Interdits prouvés : `dind`/`tcp://2375` (flake pré-existant de la flotte) ; rendu local des pages mermaid sur poste Apple Silicon avec l'image solen (chrome-headless-shell segfaulte sous qemu) — la boucle de validation est la CI.

## CI
- Wrapper `.github/workflows/ci-render.yml` : `utils-ref` fixe la version du config partagée ET du workflow réutilisable employés par la CI ; le PIN du submodule `_quarto-utils` ne gouverne que le dev local (la CI le jette). Valeur courante : `v1.3.29`. Ne jamais descendre sous `v1.3.28` (`v1.3.27` = baseline connue-cassée : garde `du -sb` sur `_freeze` absent sous `set -e`).
- Wrapper push-only : re-trigger = un push (commit vide acceptable). File + render + deploy ≈ 30-60 min ; ne jamais annuler un run.
- `deploy-static` = `rsync -az --delete` scopé sur le sous-arbre de la branche (`previews/<slug>/` pour les feature branches) : une page retirée du rendu disparaît du site de cette branche sans toucher `develop/` ni les releases.
- Ops : les annotations d'un check-run sont inexploitables → logs du job via `/repos/ebpro/lecture-UTLN-M1_Info_Math-DEV-OOCOL/actions/jobs/{id}/logs` ; `GET /actions/runs` renvoie un objet (`workflow_runs[]`), pas un tableau.

## Git
- Commits signés GPG obligatoires ; hook commit-msg impose le préfixe conventional (`fix(scope):`, `chore(ci):`, `docs:`). TTL agent GPG 8 h : sonde `gpg --detach-sign` avant de committer ; NE JAMAIS désactiver `commit.gpgsign`.

## Pipeline de production de leçons
- Orchestration `teaching/lead` (jamais d'édition directe) : scaffolder → writer (prose FR) → practical-designer (TP) → staging `/tmp/...-drafts/` → portes `reviews/critique` + `reviews/compliance-verifier` → checkpoint humain → `builders/implement` (seul à écrire dans le dépôt).
- Règle issue de deux incidents de gates (launcher `-s` inventé ; `javac` sans `-cp` certifié) : toute commande placée dans une cellule est recopiée d'un LABO FIXTURE exécuté, jamais « normalisée » par une porte de review. Les portes valident les formes ; l'exécutabilité se prouve par l'exécution.
