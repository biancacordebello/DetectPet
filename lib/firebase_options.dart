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
    apiKey: 'AIzaSyDG54vD4tAxEI7cBewDQRabHYn1Dzhy2kU',
    appId: '1:176277383962:web:7409adaa4ecf20dd059aa3',
    messagingSenderId: '176277383962',
    projectId: 'detectpet-d0f12',
    authDomain: 'detectpet-d0f12.firebaseapp.com',
    databaseURL: 'https://detectpet-d0f12-default-rtdb.firebaseio.com',
    storageBucket: 'detectpet-d0f12.appspot.com',
    measurementId: 'G-ZN5V55M6XQ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAptX8IEInYB8xF-xhaYJ7eYwHpp3rSmr8',
    appId: '1:176277383962:android:f649c6ac9f91baf4059aa3',
    messagingSenderId: '176277383962',
    projectId: 'detectpet-d0f12',
    databaseURL: 'https://detectpet-d0f12-default-rtdb.firebaseio.com',
    storageBucket: 'detectpet-d0f12.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDdRWYWXCG9Ecc-qeNwZ_i8U63x0Tl9Fx4',
    appId: '1:176277383962:ios:5b0b2b9607991898059aa3',
    messagingSenderId: '176277383962',
    projectId: 'detectpet-d0f12',
    databaseURL: 'https://detectpet-d0f12-default-rtdb.firebaseio.com',
    storageBucket: 'detectpet-d0f12.appspot.com',
    iosClientId: '176277383962-pipbbokv4ipm6gfc135pf9k0iof1j6vc.apps.googleusercontent.com',
    iosBundleId: 'com.example.tcc',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDdRWYWXCG9Ecc-qeNwZ_i8U63x0Tl9Fx4',
    appId: '1:176277383962:ios:5b0b2b9607991898059aa3',
    messagingSenderId: '176277383962',
    projectId: 'detectpet-d0f12',
    databaseURL: 'https://detectpet-d0f12-default-rtdb.firebaseio.com',
    storageBucket: 'detectpet-d0f12.appspot.com',
    iosClientId: '176277383962-pipbbokv4ipm6gfc135pf9k0iof1j6vc.apps.googleusercontent.com',
    iosBundleId: 'com.example.tcc',
  );
}