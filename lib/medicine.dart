import 'package:flutter/material.dart';

class Medicine extends StatelessWidget {
  const Medicine({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Medicine'),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Card(
            color: Colors.lightBlue[50],
            child: ListTile(
              leading: Icon(Icons.search),
              title: Text('Search a medicine'),
            ),
          ),
          Card(
            color: Colors.lightBlue[50],
            child: ListTile(
              leading: Icon(Icons.upload_file),
              title: Text('upload prescription'),
            ),
          ),
          Card(
            color: Colors.lightBlue[50],
            child: ListTile(
              leading: Icon(Icons.add_location),
              title: Text('Delivery address'),
            ),
          ),
        ],
      ),
    );
  }
}
