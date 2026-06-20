import 'package:flutter/material.dart';
import 'button_widget.dart';
import 'database_service.dart';

class FirebaseDbButtons extends StatefulWidget {
  const FirebaseDbButtons({super.key});

  @override
  State<FirebaseDbButtons> createState() => _FirebaseDbButtonsState();
}

class _FirebaseDbButtonsState extends State<FirebaseDbButtons> {
  // Creating a dedicated instance that cannot be nullified
  late final DatabaseService _databaseService;

  @override
  void initState() {
    super.initState();
    _databaseService =
        DatabaseService(); // Safe initialization when screen loads
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Firebase DB Testing",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blueAccent,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // 1. CREATE BUTTON
              ButtonWidget(
                label: 'Create',
                callback: () async {
                  try {
                    await _databaseService.create(
                      path: 'dashboard_services/test_service',
                      data: {'title': 'Test Service', 'iconKey': 'phone'},
                    );
                    _showSnackBar("Created successfully! Check your console.");
                  } catch (e) {
                    _showSnackBar("Create Error: $e");
                  }
                },
              ),
              const SizedBox(height: 10.0),

              // 2. READ BUTTON
              ButtonWidget(
                label: 'Read',
                callback: () async {
                  try {
                    final data = await _databaseService.read(
                      path: 'dashboard_services/test_service',
                    );
                    if (data != null) {
                      _showSnackBar(
                        "Read Data successfully! Check your terminal.",
                      );
                      print("Database Data Value: $data");
                    } else {
                      _showSnackBar("Read completed: Node does not exist.");
                    }
                  } catch (e) {
                    _showSnackBar("Read Error: $e");
                  }
                },
              ),
              const SizedBox(height: 10.0),

              // 3. UPDATE BUTTON
              ButtonWidget(
                label: 'Update',
                callback: () async {
                  try {
                    await _databaseService.update(
                      path: 'dashboard_services/test_service',
                      data: {
                        'title': 'Updated Service Name',
                        'iconKey': 'local_hospital',
                      },
                    );
                    _showSnackBar(
                      "Updated successfully! Watch your console change.",
                    );
                  } catch (e) {
                    _showSnackBar("Update Error: $e");
                  }
                },
              ),
              const SizedBox(height: 10.0),

              // 4. DELETE BUTTON
              ButtonWidget(
                label: 'Delete',
                callback: () async {
                  try {
                    await _databaseService.delete(
                      path: 'dashboard_services/test_service',
                    );
                    _showSnackBar("Deleted successfully from your console!");
                  } catch (e) {
                    _showSnackBar("Delete Error: $e");
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showSnackBar(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), duration: const Duration(seconds: 2)),
    );
  }
}
