import 'package:flutter/material.dart';
import 'login.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _currentUser;
  String _displayName = "User";
  String _displayEmail = "No Email";

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  // Fetch data from Firebase Auth
  void _loadUserData() {
    _currentUser = _auth.currentUser;
    if (_currentUser != null) {
      setState(() {
        // If the user hasn't set a display name in Firebase yet, fall back to 'User'
        _displayName = _currentUser!.displayName ?? "User";
        _displayEmail = _currentUser!.email ?? "No Email";
      });
    }
  }

  // Logout Function
  Future<void> _logout() async {
    try {
      await _auth.signOut();
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error logging out: $e")));
    }
  }

  // Dialog to handle updating the name in Firebase
  void _showChangeNameDialog() {
    TextEditingController nameController = TextEditingController(
      text: _displayName,
    );

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Update Name"),
          content: TextField(
            controller: nameController,
            decoration: const InputDecoration(hintText: "Enter your full name"),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () async {
                if (nameController.text.trim().isNotEmpty &&
                    _currentUser != null) {
                  try {
                    // Update display name in Firebase Auth profile
                    await _currentUser!.updateDisplayName(
                      nameController.text.trim(),
                    );
                    setState(() {
                      _displayName = nameController.text.trim();
                    });
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Name updated successfully!"),
                      ),
                    );
                  } catch (e) {
                    print(e);
                  }
                }
              },
              child: const Text("Save"),
            ),
          ],
        );
      },
    );
  }

  // Dialog to handle updating the password in Firebase
  void _showChangePasswordDialog() {
    TextEditingController passwordController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Change Password"),
          content: TextField(
            controller: passwordController,
            obscureText: true,
            decoration: const InputDecoration(hintText: "Enter new password"),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () async {
                if (passwordController.text.trim().length >= 6 &&
                    _currentUser != null) {
                  try {
                    // Update password in Firebase Auth
                    await _currentUser!.updatePassword(
                      passwordController.text.trim(),
                    );
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Password updated successfully!"),
                      ),
                    );
                  } catch (e) {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Error: ${e.toString()}")),
                    );
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Password must be at least 6 characters."),
                    ),
                  );
                }
              },
              child: const Text("Update"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome Back'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        // Prevents bottom overflow on smaller screens
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            // --- User Info Header Section ---
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.blue,
                    child: Icon(Icons.person, size: 40, color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    _displayName,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    _displayEmail,
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),

            // --- Core App Settings ---
            Card(
              child: ListTile(
                leading: const Icon(Icons.history),
                title: const Text('Medical history'),
                onTap: () {},
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.calendar_today),
                title: const Text('My appointments'),
                onTap: () {},
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.shopping_cart),
                title: const Text('My orders'),
                onTap: () {},
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.payment),
                title: const Text('Payments history'),
                onTap: () {},
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.notifications),
                title: const Text('Notifications'),
                onTap: () {},
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.help),
                title: const Text('Help & support'),
                onTap: () {},
              ),
            ),

            // --- Account Management Section ---
            Card(
              child: ExpansionTile(
                leading: const Icon(Icons.settings),
                title: const Text('Account Settings'),
                children: [
                  ListTile(
                    leading: const Icon(Icons.edit, color: Colors.blue),
                    title: const Text('Change Name'),
                    onTap: _showChangeNameDialog,
                  ),
                  ListTile(
                    leading: const Icon(Icons.lock, color: Colors.blue),
                    title: const Text('Change Password'),
                    onTap: _showChangePasswordDialog,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // --- Logout ---
            ActionChip(
              backgroundColor: Colors.red.shade50,
              avatar: const Icon(Icons.logout, color: Colors.red, size: 18),
              label: const Text('Logout', style: TextStyle(color: Colors.red)),
              onPressed: () async {
                await _logout();
                if (mounted) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const Login()),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
