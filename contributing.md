TODO (s'entendre sur les éléments à mettre dans ce fichier)

# PROPOSITIONS (peut-être améliorer, vu qu'on débute)
* on utilise getX pour la gestion des états
* les controllers sont dans le dossier lib/src/controller et servent à gérer les états des vues
* les services sont dans le dossier lib/src/service et servent à gérer les appels API ou traiter d'une logique métier spécifique
* Tout ce qui texte à afficher dans un widget est mis dans une variable finale et idéalement ajouté dans le fichier de traduction. Cela permet de modifier facilement le texte et de le traduire.
* Les couleurs sont ajoutés dans le fichier app_colors.dart et sont utilisés dans le code.
* Les tailles de polices sont ajoutés dans le fichier app_font_sizes.dart et sont utilisés dans le code.
* Une classe est créée pour chaque widget qui est utilisé plusieurs fois dans le code. Cela permet de modifier facilement le widget et de le traduire.
* Les images sont ajoutés dans le dossier assets/images et classés par catégorie.
* Les icônes sont ajoutés dans le dossier assets/icons et classés par catégorie.
* Les polices sont ajoutés dans le dossier assets/fonts et classés par catégorie. (Actuellement, il n'y a pas de polices, on utilise une police par défaut GoogleFonts.lato)
* Un fichier routes_configuration.dart (dossier lib/src/common/conf) contient toutes les routes de l'application. Chaque route correspond à une page. (Toute nouvelle page doit être ajoutée dans ce fichier).
* Le fichier app_dependencies_binding.dart (dossier lib/src/common/conf) contient toutes les injections de dépendances. (Toute nouvelle injection doit être ajoutée dans ce fichier). Il permet de gérer les injections de dépendances avec le package get_it.
* Utiliser debugPrint pour debuger au lieu de print.
* Les traductions se trouvent dans le dossier `assets/i18n`. Chaque dossier doit être nommé en fonction de l'`navigatorId` de l'écran concerné. Par exemple, pour `settings_screen.dart`, le path sera `assets/i18n/settings_screen/`. Il ne faut pas oublier d'ajouter ce path dans le fichier `pubspec.yaml`.
