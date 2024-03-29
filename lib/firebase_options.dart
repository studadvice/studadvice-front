// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions { // TODO : use .env 
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBY5cutguthlkIAc_M83sGixy3OZoIZbLs',
    appId: '1:398344471697:web:ff3b14fc5b20ee095b2b30',
    messagingSenderId: '398344471697',
    projectId: 'fir-platine-front',
    authDomain: 'fir-platine-front.firebaseapp.com',
    storageBucket: 'fir-platine-front.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAnKm5Zqae8nVcPhAC6E4M8Qcfiqgln_mo',
    appId: '1:398344471697:android:22d8299ce9e679a75b2b30',
    messagingSenderId: '398344471697',
    projectId: 'fir-platine-front',
    storageBucket: 'fir-platine-front.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDDVGXvaorAcfocVPgROBtdF08xItWd_uo',
    appId: '1:398344471697:ios:4a44a8cffb997b805b2b30',
    messagingSenderId: '398344471697',
    projectId: 'fir-platine-front',
    storageBucket: 'fir-platine-front.appspot.com',
    iosBundleId: 'com.stud.studadviceFront',
  );
}
