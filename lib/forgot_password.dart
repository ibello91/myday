import 'package:flutter/material.dart';
import 'reset_link_sent.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Card(
            color: Colors.lightBlue[50],
            child: ListTile(
              title: Text(
                'Forgot Password',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'Enter your email address to receive a password reset link.',
              ),
            ),
          ),
          Text('Email address'),
          SizedBox(height: 10),
          TextFormField(),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ResetLinkSent()),
              );
            },
            child: Text('Send reset link'),
          ),
        ],
      ),
    );
  }
}
