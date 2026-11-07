# AGENTS.md - lecture-UTLN-M1_Info_Math-DEV-OOCOL

Project rules for any agent opening this repository. Doctrine partagee :
`/Users/bruno/Documents/teaching-repos/TEACHING-FLEET.md`. Etat de flotte date : le
journal du corpus `/Users/bruno/Documents/Teaching/AGENTS.md`. Ce fichier reste mince :
regles seules, aucun sha, tag, numero de run, taille d'octets ni date.

## Identite

- Projet : `lecture-UTLN-M1_Info_Math-DEV-OOCOL` - assembly de cours (UTLN, M1
  info-math).
- Role : ce depot n'ecrit pas de lecons : le contenu vit dans des ELO `notebook-*`
  montes comme sous-modules a la racine, et chaque ELO est possede par son propre
  depot.
- Branche de travail : `develop`.
- Owner : non designe (ADR-01).

## Disposition

- Les lecons vivent dans les repertoires ELO montes a la racine, nommes `NN-<elo>`.
- Etat observe au moment de la lecture :
  `01-notebook-java-introduction`, `02-notebook-java-install`, `03-notebook-java-maven`,
  `04-notebook-java-bases`, `05-notebook-java-heritage`, `06-notebook-java-collections`,
  `07-notebook-java-exceptions`, `08-notebook-java-io`, `09-notebook-java-serialisation`,
  `10-notebook-git`, `11-notebook-java-after8`, `12-notebook-java-jdbc`.
  La source est l'intersection de `.gitmodules` et des repertoires reels sur disque :
  re-lister a chaque session, ne jamais copier cette liste sans la verifier.
- `index.qmd` a la racine est de style genere : ne pas le retoucher a la main.
  `course-order.yml` porte l'ordre du cours. `fix-sql-magic.lua` et `README.md`
  sont des fichiers locaux a la racine.
- Une lecon se corrige dans le DEPOT de l'ELO ; cet assembly ne recoit alors que la
  mise a jour du gitlink (go-ahead humain separe par depot).

## Frontieres

- Cette session possede le travail de contenu de cet assembly : ordre, index, montage.
  La session du corpus `Teaching` possede la gouvernance inter-depots : pins, journal,
  classification, `label_repos.py`.
- Rendu / CI : toutes les regles de flotte (pipeline, image, deploiement) vivent
  dans `/Users/bruno/Documents/teaching-repos/TEACHING-FLEET.md`. Rien de date ici.
- Cet assembly ne modifie jamais `_quarto-utils/` depuis sa copie locale.

## Ne pas faire

- `.devcontainer` est un lien symbolique vers `_quarto-utils/.devcontainer`
  (convention de template partage). Ne proposez aucune modification ni redirection
  de la configuration conteneur depuis ce depot : elle releve de la session
  `_quarto-utils`.
- Ne pas ecrire ni corriger de lecons a l'interieur des repertoires ELO : ce sont des
  checkouts de depots independants ; toute modification faite la est perdue et
  contredit le depot d'origine.
- Ne jamais enoncer un nombre de sous-modules dans un fichier de doctrine : mesurer
  a la demande (`.gitmodules` intersecte les repertoires reels sur disque).
- Preuve de publication : sonde du corps de page + entete `Last-Modified`, jamais un
  simple `200`.
- Lire une sortie de rendu comme preuve : les logs CI sont a preuve positive
  seulement.
- Aucune poussee sans go-ahead humain explicite, un par poussee (ADR-04).

## Validation avant "fait"

- `git status --porcelain` : seulement les chemins prevus (gitlinks + fichiers racine).
- Un `404` sur le site ne prouve pas l'absence du fichier dans le depot (ADR-10) ;
  verifier du cote du depot avant de conclure.
- Scan de doctrine : aucune date, aucun pin, aucun hash n'entre dans ce fichier
  (ADR-13).
- Les commandes de re-deploiement et leur ordre sont dans `TEACHING-FLEET.md`,
  pas ici.

<!-- ADR-REGISTRY:BEGIN source=Teaching/TEACHING-FLEET.md -->
## Registre ADR

| ADR | Règle | Statut |
|---|---|---|
| ADR-01 | Un owner formel unique par projet. Une règle, pas un constat : tous les owners ne sont pas désignés. | actif |
| ADR-02 | Une fiche de démarrage est du contexte de session, jamais un fait daté. | rescopé par ADR-18 : le lieu durable du contexte d'un projet est son propre `AGENTS.md` versionné ; la distribution par copie n'est plus la voie |
| ADR-03 | Aucun énoncé d'état (commit, poussée, tag, fusion, écriture, suppression) sans relecture côté serveur ou côté dépôt. Une reconstitution qui n'exécute pas l'outil ne prouve rien. | actif |
| ADR-04 | Go-ahead humain explicite, formulé pour cette ressource et cette action, par mutation. Une autorisation dont la charge change est périmée et s'obtient de nouveau. | actif |
| ADR-05 | Le gel de la flotte est décidé et levé par l'humain. Sa valeur courante ne vit pas dans un fichier de doctrine : elle se lit côté serveur et au lieu d'état que nomme `TEACHING-FLEET.md`. | actif ; la valeur que ce registre portait en est retirée par ADR-18 |
| ADR-06 | Un owner unique pour `_quarto-utils` ; les autres flux n'y touchent pas. | actif |
| ADR-07 | Timeout borné sur toute commande, fail-fast sur toute atteinte non vérifiée. Une vérification perdue n'est jamais une vérification réussie. | actif |
| ADR-08 | Une preuve durable a un lieu durable : un ref, un tag, un artefact versionné. Jamais un fichier temporaire, jamais un objet git non atteignable. | actif |
| ADR-09 | Éligibilité scrub : fence `{.bash}`, légende « Capture de l'atelier - commandes et sortie, non exécutées par le rendu : », et honnêteté par document (vérifier `execute:` et `eval:` du document avant toute formulation). | actif |
| ADR-10 | Un `404` ne veut pas dire absent : l'API de contenu et l'arbre git ne couvrent pas le même espace. | actif |
| ADR-11 | Bundle du travail avant toute mutation git. | actif |
| ADR-12 | zsh ne découpe pas les mots : tableaux, ou sortie délimitée et lue proprement. | actif |
| ADR-13 | Le journal du corpus est la source unique de l'état **transverse** ; l'état d'un seul dépôt vit dans l'`AGENTS.md` de ce dépôt. | rescopé par ADR-17 |
| ADR-14 | Un projet ne publie pas son propre verdict. | actif |
| ADR-15 | *Aucun énoncé : cet identifiant n'a jamais été émis.* Il n'est pas remplacé, pour que les références à ADR-16 et ADR-17 restent vraies. | non émis |
| ADR-16 | Une passe de transfert d'état n'est pas une mission de contenu : pas de leçon, pas de TP, pas de relance de CI, pas de changement d'épinglage. Un dépôt par rédacteur ; une reprise commence par une remesure fraîche. | actif |
| ADR-17 | Un `AGENTS.md` de projet porte une zone mince sans fait daté, puis une unique section de registre de session. | modifié par ADR-18 : la borne ne se pose plus par position mais par classe de région, §11 |
| ADR-18 | Trois classes de région, §11 : ce qui est gelé est l'information et ses ancres, pas la phrase ; la zone mince est éditoriale sous retrait nommé ; le plancher dur de la mutation est inchangé. | actif |

## Invariant de vérification des montages

Un montage est l'intersection entre les entrées de `.gitmodules` et les répertoires réellement
présents à la racine du dépôt. Le total des liens git renvoyés par un `git ls-tree` récursif **n'est
pas** un nombre de montages. Ne jamais énoncer un nombre de montages dans un fichier de doctrine :
le mesurer à la demande.
<!-- ADR-REGISTRY:END -->

## Registre de session (zone ledger, hors Validation 5)

Fait date autorise ici uniquement ; la clause 5 de TEACHING-FLEET.md s'arrete a la ligne precedente.

### Identite

- Depot `ebpro/lecture-UTLN-M1_Info_Math-DEV-OOCOL`, branche de travail `develop`, consommateur du pipeline de rendu (`ci-render.yml`).
- Classification (topics `area-*`, `status-*`) : la carte du projet `Teaching` (`label_repos.py`) et le serveur en font foi, pas ce fichier.
- Les valeurs d'epinglage de flotte (version de workflow partage, tag d'image de rendu) ne vivent pas ici : `teaching-repos/TEACHING-FLEET.md` et le serveur.
- Zone de registre **creee le 2026-11-07** par la vague d'extension ADR-18. Avant elle, ce fichier portait le bloc ADR fige herite de la vague de gel `2026-11-05 (late-2)` sans zone de ledger, et l'emetteur du registre le refusait (`rc=4`) : l'extension n'etait pas une emission, c'etait d'abord la creation de cette zone.

### Etat mesure le 2026-11-07 (portes de la vague d'extension)

- HEAD local `bc7dfce67493fbd57458c4013966b228d830e80a` ; tip de `refs/heads/develop` sur la distante `e3483491e027906f489d507e05ccbe98f08ed4c7` ; avancee de `2` commit. L'ancetre est verifie (`merge-base --is-ancestor` : code de sortie 0) : une poussee serait un fast-forward pur.
- Commits locaux non pousses aux portes de la vague (travail d'une vague anterieure du corpus ; la vague d'extension ne pousse rien) :
  - `bc7dfce docs(agents): restaure registre ADR + invariant de verification des mounts`
  - `b577e0b docs(agents): consigner AGENTS.md (doctrine mince, etat courant)`
- Le commit engageant le present registre s'ajoute a cette liste : la poussee publiera donc **3 commits**, les 2 ci-dessus et lui. Les valeurs de HEAD et d'avancee ci-dessus sont celles des portes, avant ce commit.
- Arbre de travail (`git status --porcelain=v1`) : vide
- Declaration du wrapper de rendu (mesuree dans `.github/workflows/ci-render.yml`, pas supposee) : push sur **toute** branche (plus les tags `v*`, plus la suppression de branche), et requetes limitees a `develop`. Porte du job de publication : `github.event_name != 'pull_request'`.
- Poussee laterale : le rendu se declenche quand meme et la porte de publication ne l'exclut pas, donc elle publie une **preview ephemere** sous `previews/<branche>` (le wrapper le dit lui-meme : commentaire `preview deploys + auto-cleanup`, et `delete: branches: ['**']` menage le nettoyage). Poussee a `develop` : rendu, puis si vert, **republie le site du cours**. Autrement dit, ici, **aucune facon de poser ces commits sans declencher un rendu**.

### Missions ouvertes

- Mission « index DEV-OOCOL » des restes ouverts du journal de corpus.
- La tip distante est portee par une autre session de contenu. Cette vague ne pousse rien, ne reecrit rien, et n'interprete aucun verdict de rendu.

### Decisions humaines en attente

- Poussee de `develop` : go-ahead humain **individuel** (ADR-04), qui doit nommer la consequence mesuree ci-dessus (le job `deploy-static` est conditionne par une porte d'evenement : un rendu vert sur `develop` **republie le site du cours**).
- Relecture du contenu editorial de la table ADR par un second regard : la porte de derive prouve la forme, jamais le sens.

### Pointeurs

- `teaching-repos/TEACHING-FLEET.md` : regles de flotte, seule autorite sur les valeurs partagees.
- `Teaching/AGENTS.md` : journal de corpus, etat transverse date, registres de decisions.
