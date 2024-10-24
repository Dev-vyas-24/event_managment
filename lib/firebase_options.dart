// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
class DefaultFirebaseOptions {
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
        return macos;
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyBn4LNvDZyQuv0p9EOWCTiLiwSLMc7yNB8',
    appId: '1:863968975898:web:d1def9e2886077e5ca05a3',
    messagingSenderId: '863968975898',
    projectId: 'event-managment-7b015',
    authDomain: 'event-managment-7b015.firebaseapp.com',
    storageBucket: 'event-managment-7b015.appspot.com',
    measurementId: 'G-KWZB04H3K0',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD7NqzCXaysWtUa7WuXcehABTgmUkNSg3k',
    appId: '1:863968975898:android:4a0ec6836232b8fbca05a3',
    messagingSenderId: '863968975898',
    projectId: 'event-managment-7b015',
    storageBucket: 'event-managment-7b015.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyANkTOZJZsmQx8soNF73lbod2mlltOt-sE',
    appId: '1:863968975898:ios:708d030542a62a4eca05a3',
    messagingSenderId: '863968975898',
    projectId: 'event-managment-7b015',
    storageBucket: 'event-managment-7b015.appspot.com',
    iosBundleId: 'com.example.eventManagment',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyANkTOZJZsmQx8soNF73lbod2mlltOt-sE',
    appId: '1:863968975898:ios:708d030542a62a4eca05a3',
    messagingSenderId: '863968975898',
    projectId: 'event-managment-7b015',
    storageBucket: 'event-managment-7b015.appspot.com',
    iosBundleId: 'com.example.eventManagment',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBn4LNvDZyQuv0p9EOWCTiLiwSLMc7yNB8',
    appId: '1:863968975898:web:42955607582fb863ca05a3',
    messagingSenderId: '863968975898',
    projectId: 'event-managment-7b015',
    authDomain: 'event-managment-7b015.firebaseapp.com',
    storageBucket: 'event-managment-7b015.appspot.com',
    measurementId: 'G-4MR49ZDNMC',
  );
}
