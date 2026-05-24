import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'login_or_register_screen.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // Jika user ada di database dan statusnya login
          if (snapshot.hasData) {
            return const HomeScreen();
          } 
          // Jika user belum login
          else {
            return const LoginOrRegisterScreen();
          }
        },
      ),
    );
  }
}