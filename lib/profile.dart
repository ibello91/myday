import 'package:flutter/material.dart';
import 'login.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Welcome Back'), backgroundColor: Colors.blue),
      body: Column(
        children: [
          Card(
            child: ListTile(
              title: Text('Medical history'),
              leading: Icon(Icons.history),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('My appointments'),
              leading: Icon(Icons.calendar_today),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('My orders'),
              leading: Icon(Icons.shopping_cart),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Payments history'),
              leading: Icon(Icons.payment),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Notifications'),
              leading: Icon(Icons.notifications),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Help & support'),
              leading: Icon(Icons.help),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Settings'),
              leading: Icon(Icons.settings),
            ),
          ),
          ActionChip(
            label: Text('Logout'),
            onPressed: () {
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
