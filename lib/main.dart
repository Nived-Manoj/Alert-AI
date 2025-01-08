import 'package:camera_detection_app/view/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyD_ROdbsS_C4QMsOWMH8AfscLLBoA1ABwQ",
          appId: "1:715025489798:android:4353ad2ae951b2068c1607",
          messagingSenderId: "",
          projectId: "alert-vision-ai-5744b",
          storageBucket: "alert-vision-ai-5744b.firebasestorage.app"));
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
