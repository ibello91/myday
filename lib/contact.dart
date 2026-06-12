import 'package:flutter/material.dart';

class Contact extends StatelessWidget {
  const Contact({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Us Through These Channels'),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Card(
            color: Colors.lightBlue[50],
            child: ListTile(
              leading: Icon(Icons.search),
              title: Text('Office address'),
              subtitle: Text('No. 23 Muhammad dikko road, Katsina state'),
            ),
          ),
          Card(
            color: Colors.lightBlue[50],
            child: ListTile(
              leading: Icon(Icons.upload_file),
              title: Text('Email address'),
              subtitle: Text('QuickConsult@gmail.com'),
            ),
          ),
          Card(
            color: Colors.lightBlue[50],
            child: ListTile(
              leading: Icon(Icons.add_location),
              title: Text('Phone numbers'),
              subtitle: Text('08130257827, 08012345678'),
            ),
          ),
        ],
      ),
    );
  }
}
