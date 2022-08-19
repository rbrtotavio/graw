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
    apiKey: 'AIzaSyBGIkanraJ64YQ_bSTVsN4FhDzXma9j6pc',
    appId: '1:872425861590:web:f07f36f0b835dff3a93477',
    messagingSenderId: '872425861590',
    projectId: 'ciw-20393',
    authDomain: 'ciw-20393.firebaseapp.com',
    storageBucket: 'ciw-20393.appspot.com',
    measurementId: 'G-4WDZWRMG3M',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD5UHYv1bd3CJOKWrfHeze6N4waApDXEks',
    appId: '1:872425861590:android:62b2febce18947dca93477',
    messagingSenderId: '872425861590',
    projectId: 'ciw-20393',
    storageBucket: 'ciw-20393.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBNE91Mvp_M-tLwYz__h0pg8NcXs6V8lJ0',
    appId: '1:872425861590:ios:14963bd8c386c2dfa93477',
    messagingSenderId: '872425861590',
    projectId: 'ciw-20393',
    storageBucket: 'ciw-20393.appspot.com',
    iosClientId: '872425861590-j9urvhis5qnn52nck0u7vuplqdkf3gll.apps.googleusercontent.com',
    iosBundleId: 'com.example.cinegrawApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBNE91Mvp_M-tLwYz__h0pg8NcXs6V8lJ0',
    appId: '1:872425861590:ios:14963bd8c386c2dfa93477',
    messagingSenderId: '872425861590',
    projectId: 'ciw-20393',
    storageBucket: 'ciw-20393.appspot.com',
    iosClientId: '872425861590-j9urvhis5qnn52nck0u7vuplqdkf3gll.apps.googleusercontent.com',
    iosBundleId: 'com.example.cinegrawApp',
  );
}