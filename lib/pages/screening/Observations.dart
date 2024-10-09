import 'package:comp30022/components/YellowBorderWhiteCard.dart';
import 'package:flutter/material.dart';
import 'package:comp30022/font.dart';
import 'package:comp30022/pages/AbstractConsultationPage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:comp30022/components/ChatbotButton.dart';
import 'package:comp30022/components/HelpButton.dart';
import 'package:comp30022/components/RedActionButton.dart';
import 'dart:math';

const double bodyFontSize = 28;

class Observations extends StatelessWidget {
  const Observations({super.key});

  @override
  Widget build(BuildContext context) {
    return AbstractConsultationPage(
        title: "Observations", pageNum: 3, body: observationsBody);
  }
}

Builder observationsBody = Builder(builder: (context) {
  return Stack(
    children: [
      // Positioned the "journey strip" in the background
      Positioned(
        bottom: 0,
        left: -500,
        child: Transform.rotate(
          angle: 36 * pi / 180,
          child: const Image(
            image: AssetImage('assets/images/art/journey-strip.png'),
            fit: BoxFit.cover, // Ensure it covers the area
          ),
        ),
      ),
      // Main container with YellowBorderWhiteCard sections
      Positioned(
        child: ScrollConfiguration(
          behavior: const ScrollBehavior().copyWith(scrollbars: false),
          child: ListView(
            children: [
              Container(
                color:
                    Colors.transparent, // Transparent to reveal the background
                child: Center(
                  child: FractionallySizedBox(
                    widthFactor: 0.90,
                    child: Stack(children: [
                      Positioned(
                          top: 260,
                          right: -30,
                          child: Transform.flip(
                            flipX: true,
                            child: const Image(
                                width: 141,
                                height: 141,
                                image: AssetImage(
                                    'assets/images/art/animals/cockatoo.png')),
                          )),
                      const Padding(
                        padding: EdgeInsets.only(
                            left: 30.0, right: 30.0, top: 10, bottom: 50),
                        child: Column(
                          children: [
                            ObservationsSubsection(
                              heading: "General Appearance",
                              hintText: "Enter here...",
                              maxLines: 3,
                            ),
                            SizedBox(height: mediumFontSize),
                            Row(
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: ObservationsSubsection(
                                    heading: "Posture and mobility",
                                    hintText:
                                        "How the patient sits, stands and moves.",
                                    maxLines: 5,
                                  ),
                                ),
                                Expanded(flex: 1, child: SizedBox.shrink()),
                                Expanded(
                                  flex: 4,
                                  child: ObservationsSubsection(
                                    heading: "Signs of Distress",
                                    hintText:
                                        "Signs of discomfort, pain, distress etc",
                                    maxLines: 5,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: mediumFontSize),
                            ObservationsSubsection(
                              heading: "Cognitive Function",
                              hintText:
                                  "Behaviour, speech, responsiveness etc.",
                              maxLines: 4,
                            ),
                            SizedBox(height: 64),
                            ObservationsSubsection(
                              heading: "Additional Notes:",
                              hintText: "Enter here...",
                              maxLines: 8,
                            ),
                            SizedBox(height: 64),
                            RedActionButton(
                              iconData: Icons.arrow_back,
                              iconSize: largeFontSize,
                              label: "Back to screening tools",
                              fontSize: largeFontSize,
                              size: Size(500, 64),
                            ),
                            SizedBox(height: 64),
                          ],
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      // UI elements like chatbot and help buttons
      const Positioned(right: 30.0, top: 50.0, child: ChatBotButton()),
      const Positioned(right: 21.0, bottom: 70.0, child: HelpButton()),
      const Positioned(
          bottom: 0,
          child:
              Image(image: AssetImage('assets/images/art/footer-strip.png'))),
    ],
  );
});

class ObservationsSubsection extends StatelessWidget {
  const ObservationsSubsection({
    super.key,
    required this.heading,
    required this.hintText,
    required this.maxLines,
  });

  final String heading;
  final String hintText;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: tinyFontSize),
        Text(
          "   $heading",
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w600, // Controls the weight (wght axis)
            fontSize:
                bodyFontSize, // This affects the appearance for the opsz axis
          ),
        ),
        const SizedBox(height: tinyFontSize),
        YellowBorderWhiteCard(
            borderRadius: 32,
            isShadowOn: false,
            child: TextField(
              style: GoogleFonts.inter(fontSize: mediumFontSize),
              maxLines: maxLines,
              decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: GoogleFonts.inter(
                    fontSize: bodyFontSize,
                    color: Colors.black.withOpacity(0.5),
                    fontWeight: FontWeight.w600,
                  ),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.all(bodyFontSize)
                  // Cream background color
                  ),
            ))
      ],
    );
  }
}
