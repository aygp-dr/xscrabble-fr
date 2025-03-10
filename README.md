# XScrabble-FR

Une version française du jeu de Scrabble XScrabble pour les systèmes X-Window.

## Description

XScrabble-FR est une adaptation française du jeu XScrabble, permettant aux utilisateurs francophones de jouer au Scrabble sur leurs systèmes Unix/Linux avec l'interface X-Window. Cette version utilise le dictionnaire officiel ODS8 (Officiel du Scrabble) et propose une interface entièrement traduite en français.

## Fonctionnalités

- Jeu de Scrabble complet avec règles françaises
- Dictionnaire ODS8 inclus pour la validation des mots
- Interface utilisateur en français
- Support pour 1 à 4 joueurs
- Possibilité de jouer contre l'ordinateur avec différents niveaux de difficulté
- Jeu en réseau possible

## Installation

### Prérequis

- Système X Window
- Bibliothèques X11 de développement
- Utilitaires de compilation standard (make, gcc)

### Compilation

```bash
make
```

### Installation

```bash
make install
```

## Utilisation

Pour lancer le jeu :

```bash
xscrabble
```

## Structure des fichiers

- `app-defaults/XScrabble_fr` : Fichier de ressources X11 pour l'interface française
- `lib/ODS8.gz` : Dictionnaire français compressé
- `lib/scrabble_rules` : Règles du jeu en français
- `lib/scrabble_scores` : Tableau des scores et distributions des lettres

## Développement

Pour mettre à jour uniquement le dictionnaire :

```bash
make fetch-dictionary
```

Pour créer une archive de distribution :

```bash
make release
```

L'archive `release/xscrabble_fr.tar.gz` contient uniquement les fichiers essentiels pour jouer à XScrabble en français, et s'extrait proprement dans un répertoire `xscrabble_fr` :

```bash
tar -xzvf xscrabble_fr.tar.gz
```

Cette archive peut être directement utilisée avec l'application XScrabble sans nécessiter le clonage du dépôt entier.

## Licence

Ce projet est distribué sous la même licence que XScrabble original.

## Remerciements

- Matt Chapman et Matthew Badham pour la création du jeu XScrabble original
- Thecoolsim pour le dictionnaire ODS8

## Contribution

Les contributions sont les bienvenues. N'hésitez pas à ouvrir une issue ou une pull request pour proposer des améliorations.