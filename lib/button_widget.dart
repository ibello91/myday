import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String label;
  final VoidCallback callback;

  const ButtonWidget({super.key, required this.label, required this.callback});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, // Stretches wide to match his screen
      height: 50.0,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blueAccent,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        onPressed: callback,
        child: Text(
          label,
          style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
