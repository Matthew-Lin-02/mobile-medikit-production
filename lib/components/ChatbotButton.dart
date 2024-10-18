import 'package:flutter/material.dart';
import 'package:comp30022/components/StandaloneFunctions.dart';
import 'package:comp30022/components/NurseEdBot.dart';

class ChatBotButton extends StatelessWidget {
  const ChatBotButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        // Define the action here
        showCustomModalRightCorner(context, const NurseEdBot());
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
