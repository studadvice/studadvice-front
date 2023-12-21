import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../stud_advice.dart';

class AuthInterceptor extends Interceptor {
  var firebaseAuthInstance = AppDependenciesBinding.firebaseAuthInstance;

  Future<String?> getIdToken() async {
    User? currentUser = firebaseAuthInstance.currentUser;

    if (currentUser != null) {
      return await currentUser.getIdToken();
    }

    return null;
  }

  @override
  Future onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final String? token = await getIdToken();

    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    return handler.next(options);
  }
}
