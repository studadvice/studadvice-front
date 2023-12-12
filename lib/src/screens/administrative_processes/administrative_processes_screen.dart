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
      // icone de la démarche à coté à gauche
      // Description de la démarche en mode légende avec trois points de suspension visible à l'expansion de la card ???
      // Bouton d'expansion de la card
      // Barre de progression de la démarche (visible et optionnel via un paramètre)
      // Bouton de mise en favoris de la démarche (coeur ou étoile) -- les démarches favorites peuvent êtres stockées via firebase et fetch au démarrage de l'application

      body: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        child: Container(
          padding: const EdgeInsets.all(5.0),
          decoration: const BoxDecoration(color: AppColors.grey50),
          child: ListView(
            children: [
              administrativeListTile(
                  context,
                  'Nom de la démarche',
                  null,
                  'Description de la démarche en mode légenda démarche en mode légenda démarche en mode légende',
                  true),
              administrativeListTile(context, 'Nom de la démarche', null,
                  'Description de la démarche en mode légende', false),
            ],
          ),
        ),
      ),
    );
  }

  Widget administrativeListTile(BuildContext context, String name,
      String? imageSrc, String description, bool showProgressBar) {
    return GestureDetector(
      onTap: () {
        // TODO : add navigation to the administrative process screen
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width - 16.0,
        ),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: const [
            BoxShadow(
              color: AppColors.black26,
              offset: Offset(0, 2),
              blurRadius: 4.0,
            ),
          ],
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.all(10.0),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Container(
              padding: const EdgeInsets.all(5.0),
              color: AppColors.grey,
              child: imageSrc != null
                  ? Image.asset(
                      imageSrc,
                      width: 50.0,
                      height: 50.0,
                    )
                  : const Icon(
                      Icons.notes,
                      color: AppColors.white,
                      size: 50.0,
                    ),
            ),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: AppFontSizes.large18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 5.0),
              Text(
                description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
                style: const TextStyle(
                  color: AppColors.grey,
                  fontSize: AppFontSizes.medium,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          subtitle: showProgressBar
              ? const Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: LinearProgressIndicator(
                    value: 0.5,
                    backgroundColor: AppColors.grey,
                    valueColor: AlwaysStoppedAnimation<Color>(AppColors.blue),
                  ),
                )
              : null,
          trailing: Container(
            padding: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(color: AppColors.grey),
            ),
            child: const Icon(
              Icons.favorite,
              color: AppColors.black,
              size: 20.0,
            ),
          ),
        ),
      ),
    );
  }
}
