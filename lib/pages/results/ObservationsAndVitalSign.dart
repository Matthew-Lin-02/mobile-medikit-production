import 'package:comp30022/components/YellowBorderYellowCard.dart';
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
      const Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 60.0),
          // padding: EdgeInsets.fromLTRB(100, 50, 100, 150),
          // child: Expanded(
          child: FractionallySizedBox(
            widthFactor: 0.8,
            heightFactor: 0.8,
            child: YellowBorderWhiteCard(
              child: Padding(
                padding: EdgeInsets.all(30),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Key Observations',
                              style: TextStyle(
                                fontSize: largeFontSize,
                              )),
                          YellowBorderYellowCard(
                            height: 400,
                            width: 650,
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Heavy breathing',
                                      style:
                                          TextStyle(fontSize: mediumFontSize)),
                                  Text('Slightly hunched standing posture',
                                      style:
                                          TextStyle(fontSize: mediumFontSize)),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Spacer(flex: 3),
                          Text('Temperature',
                              style: TextStyle(fontSize: mediumFontSize)),
                          YellowBorderYellowCard(
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Text('36.4°C',
                                  style: TextStyle(fontSize: smallFontSize)),
                            ),
                          ),
                          Spacer(),
                          Text('Blood Pressure',
                              style: TextStyle(fontSize: mediumFontSize)),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Systolic',
                                        style:
                                            TextStyle(fontSize: smallFontSize)),
                                    YellowBorderYellowCard(
                                      child: Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Text('129 mmHg',
                                            style: TextStyle(
                                                fontSize: smallFontSize)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Diastolic',
                                        style:
                                            TextStyle(fontSize: smallFontSize)),
                                    YellowBorderYellowCard(
                                      child: Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Text('84 mmHg',
                                            style: TextStyle(
                                                fontSize: smallFontSize)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Text('Pulse',
                              style: TextStyle(fontSize: mediumFontSize)),
                          YellowBorderYellowCard(
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Text('68 bpm',
                                  style: TextStyle(fontSize: smallFontSize)),
                            ),
                          ),
                          Spacer(flex: 3),
                        ],
                      ),
                    ),
                  ],
                ),
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
