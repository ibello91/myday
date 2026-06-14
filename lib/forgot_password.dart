import 'package:flutter/material.dart';
import 'forget_password_sent.dart';
import 'auth_services.dart';
import 'reset_link_sent.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Forget Password')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Enter your email to reset your password',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            const TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ResetLinkSent(),
                  ),
                );
                // Call the password reset function from AuthServices
                ('beeahmadahmad@gmail.com');
              },
              child: const Text('Send Reset Link'),
            ),
          ],
        ),
      ),
    );
  }
}
