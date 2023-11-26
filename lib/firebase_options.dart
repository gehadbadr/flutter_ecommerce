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
    apiKey: 'AIzaSyDl42yiWB5fsHxYmQaePRhkDUNHfStCCiI',
    appId: '1:125270717761:web:1ed1cb5ed9129e6a561dc0',
    messagingSenderId: '125270717761',
    projectId: 'buy-it-4b8a1',
    authDomain: 'buy-it-4b8a1.firebaseapp.com',
    storageBucket: 'buy-it-4b8a1.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCh5I0l3-WbFiOvCGOwGsIY9-VA1JHgBAI',
    appId: '1:125270717761:android:05bf313a9dd5b562561dc0',
    messagingSenderId: '125270717761',
    projectId: 'buy-it-4b8a1',
    storageBucket: 'buy-it-4b8a1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBNc-ox7Crh8RUJpq78IVFzNRm76BsmiyE',
    appId: '1:125270717761:ios:310e706a296fbd62561dc0',
    messagingSenderId: '125270717761',
    projectId: 'buy-it-4b8a1',
    storageBucket: 'buy-it-4b8a1.appspot.com',
    iosBundleId: 'com.example.ecommerce',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBNc-ox7Crh8RUJpq78IVFzNRm76BsmiyE',
    appId: '1:125270717761:ios:4acb0e2694d2894a561dc0',
    messagingSenderId: '125270717761',
    projectId: 'buy-it-4b8a1',
    storageBucket: 'buy-it-4b8a1.appspot.com',
    iosBundleId: 'com.example.ecommerce.RunnerTests',
  );
}