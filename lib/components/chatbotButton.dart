import 'package:flutter/material.dart';

class Chatbotbutton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        // Define the action here
      },
      style: TextButton.styleFrom(
        padding: const EdgeInsets.all(0), // Remove padding to fit the image
        minimumSize: const Size(0, 0), // Remove default size constraints
      ),
      child: Image.asset(
        'assets/images/chatbot-icon.png',
        height: 90, // Adjust the size of the image as needed
        width: 90,
      ),
    );
  }
}
