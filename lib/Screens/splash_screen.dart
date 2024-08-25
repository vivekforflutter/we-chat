import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:we_chat/FirebaseProvider/firebase_provider.dart';
import 'package:we_chat/screens/home_screen.dart';
import 'package:we_chat/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 1500), () {
      if (FirebaseProvider.auth.currentUser != null) {
        log("User---${FirebaseProvider.auth.currentUser}");
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const HomeScreen()));
      } else {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const LoginScreen()));
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Welcome to Splash Screen"),
      ),
    );
  }
}
