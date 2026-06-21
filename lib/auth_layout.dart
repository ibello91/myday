import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'app_loading_page.dart';
import 'dashboard.dart';
import 'login.dart';

class AuthLayout extends StatelessWidget {
  const AuthLayout({super.key, this.widgetIfNotConnected});
  final Widget? widgetIfNotConnected;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const AppLoadingPage();
        } else if (snapshot.hasData) {
          return const Dashboard();
        } else {
          return widgetIfNotConnected ?? Login();
        }
      },
    );
  }
}
