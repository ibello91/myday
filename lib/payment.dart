import 'package:flutter/material.dart';

class Payment extends StatelessWidget {
  const Payment({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pay your bill'),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Card(
            color: Colors.lightBlue[50],
            child: ListTile(
              leading: Icon(Icons.atm),
              title: Text('pay with card'),
            ),
          ),
          Card(
            color: Colors.lightBlue[50],
            child: ListTile(
              leading: Icon(Icons.mobile_friendly),
              title: Text('pay with transfer'),
            ),
          ),
        ],
      ),
    );
  }
}
