import 'package:flutter/material.dart';
import 'dashboard.dart';
import 'login.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> signUp(String email, String password) async {
  try {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    // Sign-up successful, navigate to the dashboard or home screen
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
  } catch (e) {
    print(e.toString());
  }
}

class SignUp extends StatelessWidget {
  const SignUp({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create an Account'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Text('Full name'),
          SizedBox(height: 10),
          TextFormField(),
          SizedBox(height: 10),
          Text('Email address'),
          SizedBox(height: 10),
          TextFormField(),
          SizedBox(height: 10),
          Text('Phone number'),
          SizedBox(height: 10),
          TextFormField(),
          SizedBox(height: 10),
          Text('Password'),
          SizedBox(height: 10),
          TextFormField(obscureText: true),
          SizedBox(height: 10),
          Text('Confirm Password'),
          SizedBox(height: 10),
          TextFormField(obscureText: true),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Dashboard()),
              );
            },
            child: Text('Sign Up'),
          ),
          SizedBox(height: 10),
          GestureDetector(
            child: Text('Already have an account? Log in'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Login()),
              );
            },
          ),
        ],
      ),
    );
  }
}
