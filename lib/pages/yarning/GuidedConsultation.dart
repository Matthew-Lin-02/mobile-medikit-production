import 'package:comp30022/pages/Pages.dart';
import 'package:comp30022/pages/screening/ScreeningTools.dart';
import 'package:flutter/material.dart';
import 'package:comp30022/color.dart';
import 'package:comp30022/config.dart';
import 'package:comp30022/font.dart';
import 'package:comp30022/components/YellowCard.dart';
import 'package:comp30022/components/yarningCards/SocialYarningExpanded.dart';
import 'package:comp30022/components/yarningCards/ClinicalDiagnosticYarningExpanded.dart';
import 'package:comp30022/components/RedActionButton.dart';
import 'package:comp30022/components/ChatbotButton.dart';
import 'package:comp30022/components/HelpButton.dart';

Builder guidedConsultationBody = Builder(builder: (context) {
  return Container(
    color: AppColors.cream,
    child: Stack(children: [
      Align(
        alignment: Alignment.topCenter,
        // Matching cream background color
        // This is the part that needs to be abstracted of course remove padding
        child: SizedBox(
          width: 1540,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ListView(
                  children: [
                    const SizedBox(height: 30),
                    const Text(
                      'This is a general guideline to a 715 Health Check-up. Please complete based on your judgment on what is relevant to the patient. '
                      '(Not all need to be filled in, please tap arrow to expand section and enter information in light coloured boxes)',
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Please tap the help icon on the bottom right for more information',
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        color: Colors.black.withOpacity(0.5),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    YellowCard(
                      cardData: socialYarningCardData,
                      cardContentExpanded: const SocialYarningCardContent(),
                    ),
                    const SizedBox(height: 20),
                    YellowCard(
                      cardData: clinicalDiagnosticYarningCardData,
                      cardContentExpanded:
                          const ClinicalDiagnosisYarningCardExpanded(),
                    ),
                    const SizedBox(height: 40),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: RedActionButton(
                          iconData: Icons.arrow_forward,
                          label: "Continue to Screening Tools",
                          fontSize: largeFontSize,
                          size: mediumButtonSizeLong,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ScreeningTools()),
                            );
                          }),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      const Positioned(right: 30.0, top: 16.0, child: ChatBotButton()),
      const Positioned(
        right: 21.0,
        bottom: 70,
        child: HelpButton(),
      ),
    ]),
  );
});

class GuidedConsultation extends StatelessWidget {
  const GuidedConsultation({super.key});

  @override
  Widget build(BuildContext context) {
    return AbstractConsultationPage(
        title: "Guided Consultation", pageNum: 2, body: guidedConsultationBody);
  }
}
