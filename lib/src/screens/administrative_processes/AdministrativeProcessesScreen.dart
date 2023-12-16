import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdministrativesProcessesScreen extends StatelessWidget {
  // Classe temporaire le temps de reprendre celle de Churchill
  static const String navigatorId = '/administratives_processes_screen';

  final Map<String, dynamic> args = Get.arguments;

  String _getCategoryId() {
    return args['categoryId'] ?? '';
  }

  String _getCategoryColor() {
    return args['categoryColor'] ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Administratives Processes'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Category ID: ${_getCategoryId()}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            Text(
              'Category Color: ${_getCategoryColor()}',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
