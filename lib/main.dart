// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:image_recognize/model_test_screen.dart';
// import 'package:image_recognize/splash_screen.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//       options: FirebaseOptions(
//           apiKey: "AIzaSyDq-wIcOAfnumixvDxPJCjwAZlA0nIsL4U",
//           appId: "1:563996206260:android:eb13778f1fe31e3b31a3e1",
//           messagingSenderId: "",
//           projectId: "alert-ai-8bbee",
//           storageBucket: "alert-ai-8bbee.firebasestorage.app"));
//           FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         body: ModelTestScreen(),
//         // SplashScreen(),
//       ),
//     );
//   }
// }

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:image_recognize/model_test_screen.dart';
import 'package:image_recognize/splash_screen.dart';

// Background Message Handler
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print("Handling background message: ${message.messageId}");
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyDq-wIcOAfnumixvDxPJCjwAZlA0nIsL4U",
      appId: "1:563996206260:android:eb13778f1fe31e3b31a3e1",
      messagingSenderId: "563996206260",
      projectId: "alert-ai-8bbee",
      storageBucket: "alert-ai-8bbee.firebasestorage.app",
    ),
  );

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ModelTestScreen(),
        // SplashScreen(),
      ),
    );
  }
}
