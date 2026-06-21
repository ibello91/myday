import 'package:flutter/material.dart';

class Contact extends StatelessWidget {
  const Contact({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact Us"),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: const [
            ListTile(
              leading: Icon(Icons.phone, color: Colors.purple),
              title: Text("+234 800 000 0000"),
            ),
            ListTile(
              leading: Icon(Icons.email, color: Colors.purple),
              title: Text("support@hospital.com"),
            ),
            ListTile(
              leading: Icon(Icons.location_on, color: Colors.purple),
              title: Text("Abuja, Nigeria"),
            ),
          ],
        ),
      ),
    );
  }
}
