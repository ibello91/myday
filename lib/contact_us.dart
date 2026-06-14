import 'package:flutter/material.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contact Us'), backgroundColor: Colors.blue),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Card(
            color: Colors.lightBlue[50],
            child: ListTile(
              leading: Icon(Icons.location_on),
              title: Text('Office address'),
            ),
          ),
          Card(
            color: Colors.lightBlue[50],
            child: ListTile(leading: Icon(Icons.call), title: Text('call us')),
          ),
        ],
      ),
    );
  }
}
