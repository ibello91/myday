import 'package:flutter/material.dart';
import 'dashboard.dart';
import 'login.dart';

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
