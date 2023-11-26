TODO (s'entendre sur les éléments à mettre dans ce fichier)

# PROPOSITIONS (peut-être améliorer, vu qu'on débute)

* on utilise getX pour la gestion des états
* les controllers sont dans le dossier lib/src/controller et servent à gérer les états des vues
* les services sont dans le dossier lib/src/service et servent à gérer les appels API ou traiter d'une logique métier
  spécifique
* Tout ce qui texte à afficher dans un widget est mis dans une variable finale et idéalement ajouté dans le fichier de
  traduction. Cela permet de modifier facilement le texte et de le traduire.
* Les couleurs sont ajoutés dans le fichier app_colors.dart et sont utilisés dans le code.
* Les tailles de polices sont ajoutés dans le fichier app_font_sizes.dart et sont utilisés dans le code.
* Une classe est créée pour chaque widget qui est utilisé plusieurs fois dans le code. Cela permet de modifier
  facilement le widget et de le traduire.
* Les images sont ajoutés dans le dossier assets/images et classés par catégorie.
* Les icônes sont ajoutés dans le dossier assets/icons et classés par catégorie.
* Les polices sont ajoutés dans le dossier assets/fonts et classés par catégorie. (Actuellement, il n'y a pas de
  polices, on utilise une police par défaut GoogleFonts.lato)
* Un fichier routes_configuration.dart (dossier lib/src/common/conf) contient toutes les routes de l'application. Chaque
  route correspond à une page. (Toute nouvelle page doit être ajoutée dans ce fichier).
* Le fichier app_dependencies_binding.dart (dossier lib/src/common/conf) contient toutes les injections de
  dépendances. (Toute nouvelle injection doit être ajoutée dans ce fichier). Il permet de gérer les injections de
  dépendances avec le package get_it.

### Sur android pour utiliser firebase et google sign in il faut ajouter la clé SHA-1 dans la console firebase.

Cette clé peut être obtenue en utilisant la commande suivante dans le terminal à la racine du projet :

```bash
keytool -list -v -alias androiddebugkey -keystore ~/.android/debug.keystore
```

(Le mot de passe par défaut est : android)
Il faut ensuite télécharger le fichier google-services.json depuis la console firebase et le placer dans le dossier
android/app.

Si vous rencontrez des problèmes avec l'authentification google, essayer de récupérer votre clé SHA1 depuis votre
dossier android
en lançant la commande suivante dans le terminal à la racine du projet :

```bash
./gradlew signingReport
```

https://stackoverflow.com/questions/54557479/flutter-and-google-sign-in-plugin-platformexceptionsign-in-failed-com-google

Cette commande va vous afficher toutes les clés SHA1 de votre dossier android. Il faut ensuite ajouter la SHA1
correspondant à votre clé de signature de debug dans la console firebase.



### Sur iOS pour utiliser firebase et google sign in il faut ajouter le fichier GoogleService-Info.plist dans le dossier
ios/Runner.

Ce fichier peut être téléchargé depuis la console firebase.

L'authentification apple nécessite de développer sur un mac et par défaut le bouton d'authentification apple n'est pas
affiché sur android. Voir les fichiers register_options_screen.dart et login_options_screen.dart pour plus de détails.

### Sur facebook, il faut créer un compte développeur et ajouter l'application dans la console facebook.

https://developers.facebook.com/

https://www.youtube.com/watch?v=AG_hO03Vyto : Pour configurer le compte développeur et la connexion facebook sur l'espace
de développement.

https://stackoverflow.com/questions/54657148/facebook-login-problem-with-hash-key-flutter-how-to-generate-facebook-hashk
: Pour générer la clé de hachage si vous rencontrez des problèmes avec la connexion facebook.

https://facebook.meedu.app/docs/6.x.x/android : Pour configurer la connexion facebook sur android.

https://facebook.meedu.app/docs/6.x.x/ios : Pour configurer la connexion facebook sur iOS.

C'est top, car nous pourrions le configurer avec notre compte facebook studadvice.