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
    apiKey: 'AIzaSyB5_RSqA1KOEnDiluOyClEQhRh04Puhaio',
    appId: '1:376331286192:web:bcf4dbc7bcbc394e906d75',
    messagingSenderId: '376331286192',
    projectId: 'fir-auth-94509',
    authDomain: 'fir-auth-94509.firebaseapp.com',
    storageBucket: 'fir-auth-94509.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBz5T7vlDparwJF6qYjbggEp-_esamBFu0',
    appId: '1:376331286192:android:27ccbe5b9a15bcab906d75',
    messagingSenderId: '376331286192',
    projectId: 'fir-auth-94509',
    storageBucket: 'fir-auth-94509.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyChCFJvc2cydgr0GEOf2MASTGVDkJo1wTE',
    appId: '1:376331286192:ios:b50400edab73fe06906d75',
    messagingSenderId: '376331286192',
    projectId: 'fir-auth-94509',
    storageBucket: 'fir-auth-94509.appspot.com',
    iosClientId:
        '376331286192-p511c5kpm96v3rb1mun1bpfrd6r6t19d.apps.googleusercontent.com',
    iosBundleId: 'com.example.textgram',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyChCFJvc2cydgr0GEOf2MASTGVDkJo1wTE',
    appId: '1:376331286192:ios:b50400edab73fe06906d75',
    messagingSenderId: '376331286192',
    projectId: 'fir-auth-94509',
    storageBucket: 'fir-auth-94509.appspot.com',
    iosClientId:
        '376331286192-p511c5kpm96v3rb1mun1bpfrd6r6t19d.apps.googleusercontent.com',
    iosBundleId: 'com.example.textgram',
  );
}
