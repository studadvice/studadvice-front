import 'package:flutter/material.dart';
import 'package:stud_advice/src/common/chore/app_colors.dart';
import 'package:stud_advice/src/common/chore/app_fonts_sizes.dart';

class ConnectivityDialog extends StatelessWidget {
  final String refreshText = "Rafraichir";
  final String noInternetText = "Pas de connexion internet";
  final String checkConnectionText =
      "Vérifiez votre connexion, puis rafraîchissez la page.";

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.wifi_off,
            size: 100,
            color: AppColors.dangerColor,
          ),
          Container(
            margin: const EdgeInsets.only(top: 20, bottom: 10),
            child: Text(
              noInternetText,
              style: const TextStyle(fontSize: AppFontSizes.large25),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: Text(
              checkConnectionText,
              style: const TextStyle(fontSize: AppFontSizes.medium),
            ),
          ),
          // ElevatedButton(
          //   style: ButtonStyle(
          //     backgroundColor: MaterialStateProperty.all(AppColors.blue),
          //   ),
          //   onPressed: () async {
          //     Navigator.pop(context); // Fermer la boîte de dialogue
          //     ConnectivityResult result =
          //         await Connectivity().checkConnectivity();
          //     // Vous pouvez ajouter une logique de rafraîchissement ici si nécessaire
          //   },
          //   child: Text(
          //     refreshText,
          //     style: const TextStyle(
          //       fontSize: AppFontSizes.medium,
          //       color: AppColors.white,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
