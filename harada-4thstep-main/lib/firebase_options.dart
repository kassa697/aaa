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
    apiKey: 'AIzaSyDIzN_LF-gasLr5-3OuEIOquVVokXTJuWs',
    appId: '1:1033598528043:web:c158512cc585cb6339186e',
    messagingSenderId: '1033598528043',
    projectId: 'parts-finder-data',
    authDomain: 'parts-finder-data.firebaseapp.com',
    storageBucket: 'parts-finder-data.appspot.com',
    measurementId: 'G-01338DDW2M',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCQJ5wzP_Ha3ysvr8_eERhzr-QV1A3Y0jM',
    appId: '1:1033598528043:android:6faaaf97a7ef152239186e',
    messagingSenderId: '1033598528043',
    projectId: 'parts-finder-data',
    storageBucket: 'parts-finder-data.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDCmazrrtBfcx10gkwVd-pzU0IxDCqUVK4',
    appId: '1:1033598528043:ios:98b3d64e6fce6fa339186e',
    messagingSenderId: '1033598528043',
    projectId: 'parts-finder-data',
    storageBucket: 'parts-finder-data.appspot.com',
    iosClientId: '1033598528043-83nsf9lmcevmb3fua2eg87j9gn1kek9g.apps.googleusercontent.com',
    iosBundleId: 'com.example.partsfinderApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDCmazrrtBfcx10gkwVd-pzU0IxDCqUVK4',
    appId: '1:1033598528043:ios:98b3d64e6fce6fa339186e',
    messagingSenderId: '1033598528043',
    projectId: 'parts-finder-data',
    storageBucket: 'parts-finder-data.appspot.com',
    iosClientId: '1033598528043-83nsf9lmcevmb3fua2eg87j9gn1kek9g.apps.googleusercontent.com',
    iosBundleId: 'com.example.partsfinderApp',
  );
}
