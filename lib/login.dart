import 'package:flutter/material.dart';
import 'dashboard.dart';
import 'forgot_password.dart';
import 'sign_up.dart';

class Login extends StatelessWidget {
  const Login({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Welcome Back'), backgroundColor: Colors.blue),
      body: Column(
        children: [
          Text('Email or phone number'),
          SizedBox(height: 10),
          TextFormField(),
          SizedBox(height: 20),
          Text('Password'),
          SizedBox(height: 10),
          TextFormField(obscureText: true),
          SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ForgotPassword()),
              );
            },
            child: Text('Forgot password?'),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Dashboard()),
              );
            },
            child: Text('Login'),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignUp()),
              );
            },
            child: Text('Don\'t have an account? Sign up'),
          ),
        ],
      ),
    );
  }
}
