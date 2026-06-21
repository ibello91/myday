import 'package:flutter/material.dart';

class OrderMedicine extends StatelessWidget {
  const OrderMedicine({super.key});

  @override
  Widget build(BuildContext context) {
    final medicines = [
      {"name": "Paracetamol", "price": "₦1,500", "icon": Icons.medication},
      {"name": "Amoxicillin", "price": "₦3,200", "icon": Icons.local_pharmacy},
      {"name": "Vitamin C", "price": "₦2,000", "icon": Icons.health_and_safety},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Order Medicine"),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search medicine...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: medicines.length,
              itemBuilder: (context, index) {
                final medicine = medicines[index];

                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.green.shade100,
                      child: Icon(
                        medicine["icon"] as IconData,
                        color: Colors.green,
                      ),
                    ),
                    title: Text(medicine["name"] as String),
                    subtitle: Text("Price: ${medicine["price"]}"),
                    trailing: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("${medicine["name"]} added to cart"),
                          ),
                        );
                      },
                      child: const Text(
                        "Add",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
