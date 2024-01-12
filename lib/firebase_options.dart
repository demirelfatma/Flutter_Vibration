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
    apiKey: 'AIzaSyA82025lujP8raE1AjAMMktTi-QaX0Pc2w',
    appId: '1:1084006248337:web:e21abcb7bec6e00e937430',
    messagingSenderId: '1084006248337',
    projectId: 'my-telefon-project',
    authDomain: 'my-telefon-project.firebaseapp.com',
    storageBucket: 'my-telefon-project.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAOGX26q0RyNej0B47Q6qHmRT4A3vvhR6s',
    appId: '1:1084006248337:android:2d5d909e5d0428ed937430',
    messagingSenderId: '1084006248337',
    projectId: 'my-telefon-project',
    storageBucket: 'my-telefon-project.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBhwADexlRtp_C2-5VbHrKDQ47-EKbxOB4',
    appId: '1:1084006248337:ios:8511eb1c5681e5be937430',
    messagingSenderId: '1084006248337',
    projectId: 'my-telefon-project',
    storageBucket: 'my-telefon-project.appspot.com',
    iosBundleId: 'com.example.vibrationAppp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBhwADexlRtp_C2-5VbHrKDQ47-EKbxOB4',
    appId: '1:1084006248337:ios:7b131486d74ff3d5937430',
    messagingSenderId: '1084006248337',
    projectId: 'my-telefon-project',
    storageBucket: 'my-telefon-project.appspot.com',
    iosBundleId: 'com.example.vibrationAppp.RunnerTests',
  );
}
