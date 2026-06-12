import 'package:flutter/material.dart';

class Consult extends StatelessWidget {
  const Consult({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Consult a Doctor'),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Card(
            color: Colors.lightBlue[50],
            child: ListTile(
              leading: Icon(Icons.search),
              title: Text('Search a doctor'),
            ),
          ),
          Card(
            color: Colors.lightBlue[50],
            child: ListTile(
              leading: Icon(Icons.category),
              title: Text('Doctors categories'),
            ),
          ),
        ],
      ),
    );
  }
}
