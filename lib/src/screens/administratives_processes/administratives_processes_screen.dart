import 'package:flutter/material.dart';
import 'package:stud_advice/stud_advice.dart';

class AdministrativesProcessesScreen extends StatelessWidget {
  static const String navigatorId = '/administratives_processes_screen';

  const AdministrativesProcessesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.blue,
      // Bouton de retour à la page précédente AppBar
      // Icon en haut à gauche
      // Nom de la démarche à coté à droite en mode space between
      // Description de la démarche en mode légende avec trois points de suspension visible à l'expansion de la card ???
      // Bouton d'expansion de la card
      // Barre de progression de la démarche (visible et optionnel via un paramètre)
      // Bouton de mise en favoris de la démarche (coeur ou étoile) -- les démarches favorites peuvent êtres stockées via firebase et fetch au démarrage de l'application

      //
      body: Center(
        child: Text('AdministrativesProcessesScreen'),
      ),
    );
  }
}
