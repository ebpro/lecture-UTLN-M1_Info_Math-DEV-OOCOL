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

## Registre ADR (autorite, restaure 2026-11-05)

- ADR-01 : un owner formel unique par projet (regle, pas un constat).
- ADR-02 : les launch-prompts sont du contexte de session, jamais de l'etat date.
- ADR-03 : verification serveur avant tout claim (commit, push, tag, merge, ecriture, suppression).
- ADR-04 : go-ahead humain explicite par poussee; les approvals blanket n'autorisent aucun push.
- ADR-05 : gel flotte `v1.3.45`.
- ADR-06 : owner unique pour `_quarto-utils`.
- ADR-07 : timeouts bornes sur toute commande, fail-fast sur toute atteinte non verifiee.
- ADR-08 : une preuve durable vit dans un lieu durable (commit), pas dans un fichier non suivi.
- ADR-09 : eligibilite scrub - fence `{.bash}` + legende « Capture de l'atelier - commandes et sortie, non executees par le rendu : » + honnetete PAR DOCUMENT (verifier `execute:` / `eval:` du document avant toute formulation).
- ADR-10 : un `404` ne veut pas dire absent (contents API vs git tree).
- ADR-11 : bundle avant toute mutation git.
- ADR-12 : zsh ne decoupe pas les mots.
- ADR-13 : le journal `Teaching/AGENTS.md` est la source unique d'etat mutable; un fichier de doctrine par repo ne porte aucun fait date.
- ADR-14 : un projet ne publie pas son propre verdict.

## Invariant de verification des mounts

Un mount = intersection entre les entrees de `.gitmodules` et les repertoines reels a la racine du repo. Le total des gitlinks renvoye par un `git ls-tree` recursif N'EST PAS un nombre de mounts. Ne jamais enoncer un nombre de mounts dans un fichier de doctrine : le mesurer a la demande.
