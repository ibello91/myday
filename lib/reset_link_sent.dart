import 'package:flutter/material.dart';

class ResetLinkSent extends StatelessWidget {
  const ResetLinkSent({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Card(
            child: ListTile(
              title: Text('Check your email'),
              subtitle: Text(
                'We\'ve sent a password reset link to your email address.',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
