import 'package:get/get.dart';

class FirebaseAuth extends GetxService {
  static FirebaseAuth get to => Get.find();

  Future<void> signInWithEmailAndPassword(
      {required String email, required String password}) async {}
}
