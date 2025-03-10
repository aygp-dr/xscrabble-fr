# Contribuer à XScrabble-FR

Merci de votre intérêt pour contribuer à XScrabble-FR !

## Comment contribuer

### Signaler des bugs

Si vous trouvez un bug :

1. Vérifiez d'abord si le problème a déjà été signalé dans les issues.
2. Si ce n'est pas le cas, créez une nouvelle issue avec une description claire du problème.
3. Incluez les étapes pour reproduire le bug, le comportement attendu et le comportement observé.
4. Ajoutez des informations sur votre système d'exploitation et votre environnement.

### Proposer des améliorations

Pour proposer des améliorations :

1. Ouvrez une issue décrivant l'amélioration que vous souhaitez apporter.
2. Expliquez pourquoi cette amélioration serait utile pour le projet.
3. Décrivez comment vous envisagez d'implémenter cette amélioration.

### Pull Requests

1. Assurez-vous d'avoir d'abord discuté de votre contribution dans une issue.
2. Forkez le dépôt et créez une branche pour votre contribution.
3. Faites vos modifications.
4. Assurez-vous que votre code respecte le style du projet.
5. Soumettez une pull request avec une description claire de vos modifications.

## Processus de développement

1. Clonez le dépôt : `git clone https://github.com/username/xscrabble-fr.git`
2. Installez les dépendances nécessaires (voir README.md)
3. Exécutez le script de construction : `./build.sh`
4. Effectuez vos modifications
5. Testez vos modifications
6. Soumettez une pull request

## Mise à jour du dictionnaire

Pour mettre à jour le dictionnaire ODS8 :

1. Assurez-vous d'avoir les droits nécessaires pour la source du dictionnaire
2. Utilisez `make fetch-dictionary` pour télécharger la dernière version
3. Vérifiez que le dictionnaire fonctionne correctement avec le jeu

## Traduction et adaptation

Si vous souhaitez améliorer la traduction française :

1. Modifiez les fichiers dans `app-defaults/` pour l'interface utilisateur
2. Modifiez le fichier `lib/scrabble_rules` pour les règles du jeu
3. Testez vos modifications pour vous assurer qu'elles s'affichent correctement

## Code de conduite

Nous attendons de tous les contributeurs qu'ils soient respectueux envers les autres contributeurs et qu'ils maintiennent un environnement positif et inclusif.