import 'package:flutter/material.dart';

class Booking extends StatelessWidget {
  const Booking({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('book an appointment'),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Card(
            color: Colors.lightBlue[50],
            child: ListTile(
              leading: Icon(Icons.local_hospital),
              title: Text('Select Hospital'),
            ),
          ),
          Card(
            color: Colors.lightBlue[50],
            child: ListTile(
              leading: Icon(Icons.person),
              title: Text('Select Doctor'),
            ),
          ),
          Card(
            color: Colors.lightBlue[50],
            child: ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text('Select date'),
            ),
          ),
          Card(
            color: Colors.lightBlue[50],
            child: ListTile(
              leading: Icon(Icons.time_to_leave),
              title: Text('Select time'),
            ),
          ),
        ],
      ),
    );
  }
}
