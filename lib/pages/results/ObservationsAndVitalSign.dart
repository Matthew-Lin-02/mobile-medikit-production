import 'package:comp30022/components/YellowBorderYellowCard.dart';
import 'package:comp30022/components/YellowBorderWhiteCard.dart';
import 'package:comp30022/pages/results/ResultsExplanationPage.dart';
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
                          Spacer(),
                          YellowBorderYellowCard(
                            height: 400,
                            width: 700,
                            child: Padding(
                              padding: EdgeInsets.all(20),
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
                    SizedBox(width: 150),
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
                              Spacer(),
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
            children: [
              const Spacer(flex: 3),
              RedActionButton(
                onPressed: () => Navigator.pop(context),
                label: "Back to Screening Tools",
                iconData: Icons.arrow_back,
                iconSize: mediumIconSize,
                useCircleAvatar: true,
                size: mediumButtonSizeLong,
              ),
              const Spacer(),
              RedActionButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ResultsExplanationPage()),
                  );
                },
                label: "Continue to Patient Education",
                iconData: Icons.arrow_forward,
                iconSize: mediumIconSize,
                useCircleAvatar: true,
                size: mediumButtonSizeLong,
              ),
              const Spacer(flex: 3),
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
