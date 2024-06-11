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
    apiKey: 'AIzaSyB1Kvq-u32lHX1i0Sdgo81iMGE9IN8K0Z8',
    appId: '1:681432995103:web:d69c9d39740659753d8c2a',
    messagingSenderId: '681432995103',
    projectId: 'kanban-task-management-fee54',
    authDomain: 'kanban-task-management-fee54.firebaseapp.com',
    storageBucket: 'kanban-task-management-fee54.appspot.com',
    measurementId: 'G-SV9X5PZBNJ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB7fYJsvVYlrj64h38E7q2nCMkxSIsM64g',
    appId: '1:681432995103:android:6c24fd4fac921b5f3d8c2a',
    messagingSenderId: '681432995103',
    projectId: 'kanban-task-management-fee54',
    storageBucket: 'kanban-task-management-fee54.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDM7acldq2JbP8vlE457h7YvcrQg1602Tk',
    appId: '1:681432995103:ios:d023dae976760a1d3d8c2a',
    messagingSenderId: '681432995103',
    projectId: 'kanban-task-management-fee54',
    storageBucket: 'kanban-task-management-fee54.appspot.com',
    iosBundleId: 'com.devaxiss.homechallenge.homeChallengeKanbanTask',
  );
}
