import 'package:flutter/material.dart';
import 'consult.dart';
import 'booking.dart';
import 'contact.dart';
import 'medicine.dart';
import 'payment.dart';
import 'profile.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quick Consult'),
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Profile()),
              );
            },
          ),
        ],
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Consult()),
              );
            },
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Consult()),
                );
              },
              child: Card(
                color: Colors.lightBlue[50],
                child: ListTile(
                  leading: Icon(Icons.local_hospital),
                  title: Text(
                    'Consult a doctor',
                    style: TextStyle(
                      color: Colors.orange,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text('Get quick advice from a doctor'),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Booking()),
              );
            },
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Booking()),
                );
              },
              child: Card(
                color: Colors.lightBlue[50],
                child: ListTile(
                  leading: Icon(Icons.book_online),
                  title: Text(
                    'Book an appointment',
                    style: TextStyle(
                      color: Colors.orange,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text('Book an appointment with a doctor'),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Medicine()),
              );
            },
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Medicine()),
                );
              },
              child: Card(
                color: Colors.lightBlue[50],
                child: ListTile(
                  leading: Icon(Icons.local_pharmacy),
                  title: Text(
                    'Order medicine online',
                    style: TextStyle(
                      color: Colors.orange,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text('Order medicine online'),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Payment()),
              );
            },
            child: Card(
              color: Colors.lightBlue[50],
              child: ListTile(
                leading: Icon(Icons.payment),
                title: Text(
                  'Pay hospital bills online',
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text('Pay hospital bills online'),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Contact()),
              );
            },
            child: Card(
              color: Colors.lightBlue[50],
              child: ListTile(
                leading: Icon(Icons.contact_mail),
                title: Text(
                  'Contact Us for more information',
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text('Contact Us for more information'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
