import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:image_recognize/model_test_screen.dart';
import 'package:image_recognize/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyDq-wIcOAfnumixvDxPJCjwAZlA0nIsL4U",
          appId: "1:563996206260:android:eb13778f1fe31e3b31a3e1",
          messagingSenderId: "",
          projectId: "alert-ai-8bbee",
          storageBucket: "alert-ai-8bbee.firebasestorage.app"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SplashScreen(),
      ),
    );
  }
}
