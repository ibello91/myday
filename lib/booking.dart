import 'package:flutter/material.dart';

class Booking extends StatefulWidget {
  const Booking({super.key});

  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  String? selectedDoctor;
  String? selectedTime;

  final List<String> doctors = [
    "Dr. Sarah Johnson",
    "Dr. Michael Lee",
    "Dr. Amina Yusuf",
  ];

  final List<String> timeSlots = [
    "09:00 AM",
    "10:00 AM",
    "11:30 AM",
    "02:00 PM",
    "04:00 PM",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Book Appointment"),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: "Select Doctor",
                border: OutlineInputBorder(),
              ),
              items: doctors.map((doctor) {
                return DropdownMenuItem(value: doctor, child: Text(doctor));
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedDoctor = value;
                });
              },
            ),

            const SizedBox(height: 20),

            TextField(
              readOnly: true,
              decoration: InputDecoration(
                labelText: "Appointment Date",
                hintText: "Tap to choose a date",
                prefixIcon: const Icon(Icons.calendar_today),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onTap: () {
                // Add showDatePicker() here later
              },
            ),

            const SizedBox(height: 20),

            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: "Select Time",
                border: OutlineInputBorder(),
              ),
              items: timeSlots.map((time) {
                return DropdownMenuItem(value: time, child: Text(time));
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedTime = value;
                });
              },
            ),

            const SizedBox(height: 20),

            TextField(
              maxLines: 4,
              decoration: InputDecoration(
                labelText: "Reason for Visit",
                hintText: "Describe your symptoms or reason...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Appointment booked successfully!"),
                    ),
                  );
                },
                child: const Text(
                  "Book Appointment",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
