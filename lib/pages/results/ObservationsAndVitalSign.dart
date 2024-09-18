import 'package:comp30022/color.dart';
import 'package:comp30022/components/YellowBorderWhiteCard.dart';
import 'package:flutter/material.dart';
import 'package:comp30022/font.dart';
import 'package:comp30022/components/RedActionButton.dart';
import 'package:comp30022/components/HelpButton.dart';
import 'package:comp30022/components/ChatbotButton.dart';

class ObservationsAndVitalSign extends StatelessWidget {
  const ObservationsAndVitalSign({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      // Key Observations card
      Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 60.0),
          child: FractionallySizedBox(
            widthFactor: 0.8,
            heightFactor: 0.8,
            child: YellowBorderWhiteCard(
              child: Padding(
                padding: const EdgeInsets.all(20),
              ),
            ),
          ),
        ),
      ),

      // Red navigation buttons
      Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 60.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RedActionButton(
                onPressed: () => Navigator.pop(context),
                label: "Back To Screening Tools",
                iconData: Icons.arrow_back,
                iconSize: mediumIconSize,
                useCircleAvatar: true,
                size: mediumButtonSizeLong,
              ),
              RedActionButton(
                onPressed: () {},
                label: "Continue To Patient Education",
                iconData: Icons.arrow_forward,
                iconSize: mediumIconSize,
                useCircleAvatar: true,
                size: mediumButtonSizeLong,
              ),
            ],
          ),
        ),
      ),

      // Chatbot and help buttons
      const Positioned(right: 30.0, top: 50.0, child: ChatBotButton()),
      const Positioned(right: 21.0, bottom: 70.0, child: HelpButton()),
    ]);
  }
}
