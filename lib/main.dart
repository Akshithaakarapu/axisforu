import 'package:axisforu/chat_profiles.dart';
import 'package:axisforu/forgotpassword.dart';
import 'package:axisforu/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyBWfFyb6-2xstigI5WYws1YI-v3W5a2rM4",
      appId: "1:162090886386:android:deeb16f5ad553268309c6b",
      messagingSenderId: "162090886386",
      projectId: "chatapp-2ecd9",
    ),
    );
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Chat_profile_page(),
    );
  }
}
