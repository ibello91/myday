import 'package:flutter/material.dart';
// These must match your exact file names in the lib/ folder
import 'booking.dart';
import 'consult.dart';
import 'medicine.dart';
import 'contact_us.dart';
import 'profile.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quick Consult'),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              // Navigate to the profile page when the profile icon is tapped
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Profile()),
              );
            },
          ),
        ],
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // 1. Consult Card
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Consult()),
            ),
            child: const Card(
              child: ListTile(
                leading: Icon(Icons.local_hospital),
                title: Text('Consult a doctor'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
