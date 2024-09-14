import 'package:comp30022/components/YellowBorderWhiteCard.dart';
import 'package:comp30022/styles.dart';
import 'package:flutter/material.dart';
import 'package:comp30022/color.dart';
import 'package:comp30022/font.dart';
import 'package:comp30022/pages/AbstractConsultationPage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:comp30022/components/ChatbotButton.dart';
import 'package:comp30022/components/HelpButton.dart';
import 'package:comp30022/components/RedActionButton.dart';

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
  return Stack(children: [
    Positioned(
        child: ScrollConfiguration(
      behavior: const ScrollBehavior().copyWith(scrollbars: false),
      child: ListView(children: [
        Container(
          color: AppColors.cream,
          child: Center(
              child: FractionallySizedBox(
            widthFactor: 0.8,
            child: Column(children: [
              const ObservationsSubsection(
                  heading: "General Appearance",
                  hintText: "Enter here...",
                  maxLines: 3),
              const SizedBox(height: mediumFontSize),
              const Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: ObservationsSubsection(
                        heading: "Posture and mobility",
                        hintText: "How the patient sits, stands and moves.",
                        maxLines: 5),
                  ),
                  Expanded(flex: 1, child: SizedBox.shrink()),
                  Expanded(
                    flex: 4,
                    child: ObservationsSubsection(
                        heading: "Signs of Distress",
                        hintText: "Signs of discomfort, pain, distress etc",
                        maxLines: 5),
                  ),
                ],
              ),
              const SizedBox(height: mediumFontSize),
              const ObservationsSubsection(
                  heading: "Cognitive Function",
                  hintText: "Behaviour, speech, responsiveness etc.",
                  maxLines: 4),
              const SizedBox(height: 64),
              const ObservationsSubsection(
                  heading: "Additional Notes:",
                  hintText: "Enter here...",
                  maxLines: 8),
              const SizedBox(height: 64),
              RedActionButton(
                iconData: Icons.arrow_back,
                iconSize: largeFontSize,
                label: "Back to screening tools",
                fontSize: largeFontSize,
                size: const Size(
                  500,
                  64,
                ),
              ),
              const SizedBox(height: 64),
            ]),
          )),
        ),
      ]),
    )),
    const Positioned(right: 30.0, top: 50.0, child: ChatBotButton()),
    const Positioned(right: 21.0, bottom: 70.0, child: HelpButton()),
  ]);
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
