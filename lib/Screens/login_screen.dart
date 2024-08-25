import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:we_chat/FirebaseProvider/firebase_provider.dart';
import 'package:we_chat/Helper/dialoges.dart';
import 'package:we_chat/screens/home_screen.dart';
import 'dart:developer';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome to we chat"),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
          ),
          Image.asset(
            "images/chat.png",
            height: 300,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
          ),
          ElevatedButton(
              onPressed: () {
                 Dialoge.showLoading(context);
                FirebaseProvider.signInWithGoogle(context).then((value) {
                  if (value != null) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()));
                  }
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "images/google_icon.png",
                    fit: BoxFit.cover,
                    height: 30,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  const Text("Signin with google")
                ],
              ))
        ],
      ),
    );
  }
}
