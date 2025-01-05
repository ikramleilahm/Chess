
# Fix Pawn Moves

## Objectif
L'objectif de ce projet est d'implémenter et de corriger les mouvements du pion dans un jeu d'échecs, en mettant l'accent sur la gestion des mouvements de base ainsi que de la règle complexe du "en passant". Ce projet est une occasion de pratiquer le débogage et les tests, tout en utilisant des méthodes et classes déjà existantes pour résoudre un problème spécifique.

## Aperçu du Projet
Les pions sont l'une des pièces les plus compliquées à implémenter dans un jeu d'échecs, en raison de leurs règles de mouvement particulières. Voici les règles principales à gérer :
1. **Mouvement normal** : Le pion se déplace d'une case en avant.
2. **Premier mouvement** : Lors du premier mouvement du pion, il peut avancer de deux cases.
3. **Capture** : Le pion capture une pièce adverse en se déplaçant en diagonale d'une case, vers la gauche ou la droite.
4. **En Passant** : Cette règle permet à un pion de capturer un autre pion adverse qui a avancé de deux cases depuis sa position initiale, comme si le pion adverse n'avait avancé que d'une seule case. Cette règle est complexe et a été un défi majeur à implémenter correctement.

## Difficultés Rencontrées
L'implémentation de la règle **en passant** a été particulièrement difficile en raison de la complexité du mouvement. Contrairement à un simple mouvement ou capture, **en passant** nécessite de prendre en compte l'historique du dernier mouvement effectué et les conditions spécifiques sous lesquelles il peut être appliqué. La gestion du timing et des cases affectées par ce mouvement spécial était un véritable défi.

De plus, j'ai cherché à utiliser les méthodes existantes dans les classes comme `MyChessBoard`, `MyChessSquare` et `MyChessGame` pour éviter de dupliquer du code et pour respecter la structure du jeu déjà en place. Par exemple, l'accès aux pièces sur le plateau et la mise à jour de leurs positions ont été gérés grâce aux méthodes de ces classes. Cela a permis une meilleure organisation du code, mais a également introduit des défis supplémentaires, notamment en ce qui concerne la gestion de l'état du jeu (par exemple, déterminer si un pion a déjà effectué son premier mouvement).

## Fonctionnalités Principales Implémentées
- **Mouvement du Pion** : Le pion peut avancer d'une case, avec la possibilité de se déplacer de deux cases lors de son premier mouvement.
- **Capture du Pion** : Le pion peut capturer une pièce adverse en diagonale.
- **En Passant** : La règle du en passant a été implémentée. Un pion peut capturer un autre pion qui a avancé de deux cases depuis sa position initiale, si toutes les conditions sont remplies.

## Pour Commencer
Pour commencer, clonez le dépôt et ouvrez le projet dans votre environnement Smalltalk préféré.

### Installation
```bash
git clone <(https://github.com/ikramleilahm/Chess.git)>
```

### Exécution des Tests
Des tests sont inclus pour vérifier la fonctionnalité des mouvements du pion et s'assurer que la logique est correcte. Les tests couvrent les cas suivants :
- Mouvement classique d'une case
- Premier mouvement avec avance de deux cases
- Captures en diagonale
- En Passant

## Défis & Débogage
Les principaux défis rencontrés lors du développement de ce projet étaient les suivants :
- **Gestion de la règle du en passant** : Implémenter correctement cette règle a nécessité de suivre l'historique des mouvements et de vérifier plusieurs conditions spécifiques pour savoir si ce mouvement était valide.
- **Utilisation des classes existantes** : Utiliser des méthodes déjà présentes dans les classes `MyChessBoard`, `MyChessSquare` et `MyChessGame` a été essentiel pour maintenir la cohérence du code. Cependant, cela a également rendu l'implémentation plus complexe car il fallait s'assurer que les interactions entre ces classes étaient correctement gérées.
- **Test et validation** : Tester les mouvements du pion, notamment avec les cas complexes comme "en passant", a demandé une couverture de tests étendue pour valider tous les scénarios possibles.

## Contribuer
N'hésitez pas à contribuer ! Si vous trouvez un bug ou avez une idée d'amélioration, ouvrez une issue ou soumettez une pull request.

---
