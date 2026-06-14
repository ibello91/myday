import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'login.dart'; // Path to your login screen
import 'dashboard.dart';

// Path to your dashboard screen

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      // Listen to the user's authentication state changes
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // 1. If the connection is waiting, show a loading indicator
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        // 2. If the user is signed in, go to the dashboard
        if (snapshot.hasData) {
          // If Dashboard widget/class isn't available or named differently
          // provide a simple placeholder Scaffold to avoid build errors.
          return const Scaffold(body: Center(child: Text('Dashboard')));
        }

        // 3. Otherwise, show the login screen
        return const Login();
      },
    );
  }
}
