import 'package:comp30022/components/YellowBorderWhiteCard.dart';
import 'package:flutter/material.dart';
import 'package:comp30022/color.dart';
import 'package:comp30022/components/RedActionButton.dart';
import 'package:comp30022/components/HelpButton.dart';
import 'package:comp30022/components/ChatbotButton.dart';

class ObservationsAndVitalSign extends StatelessWidget {
  const ObservationsAndVitalSign({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: []),
      Align(
          alignment: Alignment.bottomCenter,
          child: Container(
              padding: const EdgeInsets.only(top: 20, bottom: 60),
              color: AppColors.cream,
              child: Row(children: [
                const Spacer(flex: 3),
                RedActionButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  label: "Back To Screening Tools",
                  iconData: Icons.arrow_forward,
                  useCircleAvatar: true,
                  size: mediumButtonSizeLong,
                ),
                const Spacer(),
                RedActionButton(
                  onPressed: () {},
                  label: "Continue To Patient Education",
                  iconData: Icons.arrow_forward,
                  useCircleAvatar: true,
                  size: mediumButtonSizeLong,
                ),
                const Spacer(flex: 3),
              ]))),
      const Positioned(right: 30.0, top: 50.0, child: ChatBotButton()),
      const Positioned(right: 21.0, bottom: 70.0, child: HelpButton()),
    ]);
  }
}
