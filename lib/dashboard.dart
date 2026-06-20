import 'package:flutter/material.dart';
import 'database_service.dart';
import 'profile.dart';
import 'Consult.dart';
import 'Medicine.dart';
import 'Payment.dart';
import 'Contact_us.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final DatabaseService _databaseService = DatabaseService();

  IconData _getIcon(String? iconKey) {
    final cleanKey = (iconKey ?? '').trim().toLowerCase().replaceAll('_', ' ');

    switch (cleanKey) {
      case 'calendar today':
      case 'calendartoday':
        return Icons.calendar_today;

      case 'receipt long':
      case 'receiptlong':
        return Icons.receipt_long;

      case 'local hospital':
      case 'localhospital':
      case 'consult doctor':
      case 'consult_doctor':
        return Icons.local_hospital;

      case 'phone':
      case 'contact':
        return Icons.phone;

      case 'medical services':
      case 'medicalservices':
      case 'medicine':
        return Icons.medical_services;

      default:
        return Icons.medical_services;
    }
  }

  void _handleNavigation(String title) {
    final cleanTitle = title.trim().toLowerCase().replaceAll(' ', '_');

    switch (cleanTitle) {
      case 'appointment':
        print("Navigating to Appointment Screen");
        break;

      case 'bills':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Payment()),
        );
        break;

      case 'consult_doctor':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Consult()),
        );
        break;

      case 'medicine':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Medicine()),
        );
        break;

      case 'contact':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ContactUs()),
        );
        break;

      default:
        print("No route defined for database key: $cleanTitle");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          "Dashboard",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
        elevation: 2,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.account_circle,
              color: Colors.white,
              size: 28,
            ),
            tooltip: 'Profile',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Profile()),
              );
            },
          ),
        ],
      ),
      body: FutureBuilder<dynamic>(
        future: _databaseService.read(path: 'dashboard_services'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.blueAccent),
            );
          }

          if (snapshot.hasError || !snapshot.hasData || snapshot.data == null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error_outline, size: 60, color: Colors.red[300]),
                  const SizedBox(height: 12),
                  const Text(
                    "Unable to load dashboard options.\nPlease check your database rules.",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black54, fontSize: 16),
                  ),
                ],
              ),
            );
          }

          final snapshotData = snapshot.data.value;
          if (snapshotData == null) {
            return const Center(child: Text("No data found at this path."));
          }

          final List<Map<String, dynamic>> dashboardItems = [];
          if (snapshotData is Map) {
            snapshotData.forEach((key, value) {
              if (value is Map) {
                dashboardItems.add({
                  'id': key,
                  'title':
                      value['title'] ??
                      key, // Fallback to node key name if title is empty
                  'iconKey': value['iconKey'] ?? '',
                });
              }
            });
          }

          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 20.0,
            ),
            child: GridView.builder(
              itemCount: dashboardItems.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1.15,
              ),
              itemBuilder: (context, index) {
                final item = dashboardItems[index];
                final String title = item['title'];
                final String iconKey = item['iconKey'];

                return Card(
                  elevation: 2,
                  shadowColor: Colors.black12,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: () => _handleNavigation(item['id']),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.blue[50],
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              _getIcon(iconKey.isEmpty ? item['id'] : iconKey),
                              size: 36,
                              color: Colors.blueAccent,
                            ),
                          ),
                          const SizedBox(height: 14),
                          Text(
                            title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
