<h1 align="center">Stud'Advice Frontend</h1>

<div align="center">

<img src="docs/studadvice.png" height="120" alt="Stud'Advice Logo">

</div>


## Membres
- Churchill Atchedji
- Isidore Amevigbe
- Zakaria El Khayari
- Nada Zine

### Récupération du projet

Pour obtenir une copie du projet, suivez ces étapes simples dans votre terminal. Tout d'abord, positionnez-vous dans le répertoire où vous souhaitez enregistrer le projet, puis exécutez la commande correspondante à votre méthode de récupération préférée :

Pour récupérer le projet via *SSH*

```sh
git clone git@github.com:studadvice/studadvice-front.git
```

Pour récupérer le projet via *HTTPS*

```sh
git clone https://github.com/studadvice/studadvice-front.git
```

### Prérequis


Avant de débuter l'exécution de votre projet, veuillez vous assurer d'avoir correctement installé tous les composants nécessaires pour Flutter en suivant les instructions disponibles à l'adresse suivante : (https://docs.flutter.dev/get-started/install).
Ensuite, initiez le processus en créant un fichier .env à la racine du projet Stud'Advice. Ce fichier doit contenir les deux variables suivantes :

BACKEND_BASE_URL="http://localhost:8080"

SUPPORT_MAIL="studadvice.contact@gmail.com"

La première variable indique l'URL du backend de Stud'Advice.  À ce jour, il est nécessaire de démarrer le backend en suivant les étapes décrites ici : (https://github.com/studadvice/studadvice-back) et d'utiliser l'URL : http://localhost:8080.
Une fois le déploiement terminé, on aura plus besoin de lancer la backend en parallèle et il faudra utiliser directement l'URL suivante : http://studadvice.com/api

### Éxécution du projet

Une fois les prérequis installés, veuillez exécuter les commandes suivantes à la racine du projet:

```
flutter pub get; flutter run
```
