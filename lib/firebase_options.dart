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
    apiKey: 'AIzaSyB8bVbVSczhN9mmh0TuVj0waYD6UgDEvro',
    appId: '1:754477407649:web:3db2952722099044fcffe0',
    messagingSenderId: '754477407649',
    projectId: 'pomodoro-todo-app-4b5c2',
    authDomain: 'pomodoro-todo-app-4b5c2.firebaseapp.com',
    storageBucket: 'pomodoro-todo-app-4b5c2.firebasestorage.app',
    measurementId: 'G-HJFDL19CED',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCUomNa1H498Y0ufOqOc4a3nKrvhzBb9cA',
    appId: '1:754477407649:android:3442ce328d958cc6fcffe0',
    messagingSenderId: '754477407649',
    projectId: 'pomodoro-todo-app-4b5c2',
    storageBucket: 'pomodoro-todo-app-4b5c2.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD187QB-WbaYIabaPEwJTFFI6qHZwbrWpM',
    appId: '1:754477407649:ios:fc130515dce8861ffcffe0',
    messagingSenderId: '754477407649',
    projectId: 'pomodoro-todo-app-4b5c2',
    storageBucket: 'pomodoro-todo-app-4b5c2.firebasestorage.app',
    iosBundleId: 'com.example.pomodoroTodoApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD187QB-WbaYIabaPEwJTFFI6qHZwbrWpM',
    appId: '1:754477407649:ios:fc130515dce8861ffcffe0',
    messagingSenderId: '754477407649',
    projectId: 'pomodoro-todo-app-4b5c2',
    storageBucket: 'pomodoro-todo-app-4b5c2.firebasestorage.app',
    iosBundleId: 'com.example.pomodoroTodoApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyB8bVbVSczhN9mmh0TuVj0waYD6UgDEvro',
    appId: '1:754477407649:web:b3e01bc45b29bb57fcffe0',
    messagingSenderId: '754477407649',
    projectId: 'pomodoro-todo-app-4b5c2',
    authDomain: 'pomodoro-todo-app-4b5c2.firebaseapp.com',
    storageBucket: 'pomodoro-todo-app-4b5c2.firebasestorage.app',
    measurementId: 'G-S1PV08THPZ',
  );
}
