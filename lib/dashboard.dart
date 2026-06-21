import 'package:flutter/material.dart';
import 'consult.dart';
import 'booking.dart';
import 'order_medicine.dart';
import 'paybills.dart';
import 'contact.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quick Consult"),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Welcome 👋",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            const Text(
              "Choose a service below",
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 20),

            _buildCard(
              icon: Icons.medical_services,
              title: "Consult a Doctor",
              subtitle: "Talk to a qualified doctor online",
              onPress: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Consult()),
                );
              },
            ),

            _buildCard(
              icon: Icons.calendar_month,
              title: "Book Appointment",
              subtitle: "Schedule your hospital visit",
              onPress: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Booking()),
                );
              },
            ),

            _buildCard(
              icon: Icons.local_pharmacy,
              title: "Order Medicine",
              subtitle: "Buy medicines from trusted pharmacies",
              onPress: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const OrderMedicine(),
                  ),
                );
              },
            ),

            _buildCard(
              icon: Icons.payments,
              title: "Pay Hospital Bills",
              subtitle: "Pay your bills securely online",
              onPress: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Paybills()),
                );
              },
            ),

            _buildCard(
              icon: Icons.support_agent,
              title: "Contact Us",
              subtitle: "Reach our support team anytime",
              onPress: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Contact()),
                );
              },
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: "Appointments",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }

  Widget _buildCard({
    required IconData icon,
    required String title,
    required String subtitle,
    VoidCallback? onPress,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      elevation: 3,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.green.shade100,
          child: Icon(icon, color: Colors.green),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios, size: 18),
        onTap: onPress,
      ),
    );
  }
}
