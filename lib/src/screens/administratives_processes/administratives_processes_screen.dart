import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stud_advice/src/common/chore.dart';

class AdministrativesProcessesScreen extends StatelessWidget {
  static const String navigatorId = '/administratives_processes_screen';

  const AdministrativesProcessesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Santé'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
      ),

      // Nom de la démarche à coté à droite en mode space between
      // Description de la démarche en mode légende avec trois points de suspension visible à l'expansion de la card ???
      // Bouton d'expansion de la card
      // Barre de progression de la démarche (visible et optionnel via un paramètre)
      // Bouton de mise en favoris de la démarche (coeur ou étoile) -- les démarches favorites peuvent êtres stockées via firebase et fetch au démarrage de l'application

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Administratives Processes Screen',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
