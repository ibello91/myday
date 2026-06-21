import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: Colors.purple,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          const CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage("assets/profile.jpg"),
          ),
          const SizedBox(height: 10),
          const Text(
            "John Doe",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const Text("johndoe@gmail.com"),
          const SizedBox(height: 20),

          ListTile(
            leading: Icon(Icons.person),
            title: Text("Edit Profile"),
            trailing: Icon(Icons.arrow_forward_ios),
          ),

          ListTile(
            leading: Icon(Icons.history),
            title: Text("Medical History"),
            trailing: Icon(Icons.arrow_forward_ios),
          ),

          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Settings"),
            trailing: Icon(Icons.arrow_forward_ios),
          ),

          ListTile(
            leading: Icon(Icons.logout, color: Colors.red),
            title: Text("Logout"),
          ),
        ],
      ),
    );
  }
}
