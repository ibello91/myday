import 'package:flutter/material.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkout"),
        backgroundColor: Colors.purple,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: const [
                ListTile(
                  leading: Icon(Icons.medication),
                  title: Text("Paracetamol"),
                  subtitle: Text("Qty: 2"),
                  trailing: Text("₦1,000"),
                ),
                ListTile(
                  leading: Icon(Icons.medication),
                  title: Text("Vitamin C"),
                  subtitle: Text("Qty: 1"),
                  trailing: Text("₦500"),
                ),
              ],
            ),
          ),

          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "₦1,500",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                    ),
                    child: const Text("Proceed to Checkout"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
