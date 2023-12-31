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
    apiKey: 'AIzaSyB45UL9JsSWrAOeQaMCfhG34mYSytW6w7k',
    appId: '1:592079414983:web:50301b370bb91a92a580e2',
    messagingSenderId: '592079414983',
    projectId: 'notemuse-3d9ab',
    authDomain: 'notemuse-3d9ab.firebaseapp.com',
    databaseURL: 'https://notemuse-3d9ab-default-rtdb.firebaseio.com',
    storageBucket: 'notemuse-3d9ab.appspot.com',
    measurementId: 'G-H776T76HS0',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBUb_mjj5z0keOMwORGASxF5FY2_qQXqEI',
    appId: '1:592079414983:android:5dbd2dfa2b95d4f0a580e2',
    messagingSenderId: '592079414983',
    projectId: 'notemuse-3d9ab',
    databaseURL: 'https://notemuse-3d9ab-default-rtdb.firebaseio.com',
    storageBucket: 'notemuse-3d9ab.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBWFWGmhILdUdU0UxnLJy7JF7lIXtJrD2M',
    appId: '1:592079414983:ios:1db29f14d5394738a580e2',
    messagingSenderId: '592079414983',
    projectId: 'notemuse-3d9ab',
    databaseURL: 'https://notemuse-3d9ab-default-rtdb.firebaseio.com',
    storageBucket: 'notemuse-3d9ab.appspot.com',
    iosBundleId: 'com.example.noteMuse',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBWFWGmhILdUdU0UxnLJy7JF7lIXtJrD2M',
    appId: '1:592079414983:ios:5380c022d2a2fc2ea580e2',
    messagingSenderId: '592079414983',
    projectId: 'notemuse-3d9ab',
    databaseURL: 'https://notemuse-3d9ab-default-rtdb.firebaseio.com',
    storageBucket: 'notemuse-3d9ab.appspot.com',
    iosBundleId: 'com.example.noteMuse.RunnerTests',
  );
}
