import 'package:comp30022/components/screening/VitalsCard.dart';
import 'package:flutter/material.dart';
import 'package:comp30022/color.dart';
import 'package:comp30022/font.dart';
import 'package:comp30022/pages/AbstractConsultationPage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:comp30022/components/ChatbotButton.dart';
import 'package:comp30022/components/HelpButton.dart';
import 'package:comp30022/components/RedActionButton.dart';

const double bodyFontSize = 28;

class BloodPressure extends StatelessWidget {
  const BloodPressure({super.key});

  @override
  Widget build(BuildContext context) {
    return AbstractConsultationPage(
        title: "Blood Pressure", pageNum: 3, body: bloodPressureBody);
  }
}

Builder bloodPressureBody = Builder(builder: (context) {
  return Stack(fit: StackFit.expand, children: [
    Positioned(
      child: Container(
          color: AppColors.cream,
          child: Column(
            children: [
              const Expanded(flex: 1, child: SizedBox.shrink()),
              Expanded(
                flex: 3,
                child: FractionallySizedBox(
                    widthFactor: 0.5,
                    child: Text(
                      "Please follow the standard procedure for Blood pressure tests and fill in the values below",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        fontSize: extraLargeFontSize,
                        fontWeight: FontWeight.w500,
                      ),
                    )),
              ),
              Expanded(
                flex: 4,
                child: Text(
                  "Press help button on the bottom corner to view standard procedure",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                      fontSize: smallFontSize,
                      fontWeight: FontWeight.w500,
                      color: Colors.black.withOpacity(0.6)),
                ),
              ),
              const Expanded(
                flex: 9,
                child: FractionallySizedBox(
                  widthFactor: 0.7,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      VitalsCard(
                        heading: 'Systolic\n(mmHg)',
                        hintText: '36.4',
                      ),
                      VitalsCard(
                        heading: 'Diastolic\n(mmHg)',
                        hintText: '84',
                      ),
                      VitalsCard(
                        heading: 'Pulse (min)',
                        hintText: '68',
                      ),
                    ],
                  ),
                ),
              ),
              const Expanded(flex: 1, child: SizedBox.shrink()),
              const Expanded(
                flex: 2,
                child: RedActionButton(
                  iconData: Icons.arrow_back,
                  iconSize: extraLargeFontSize,
                  label: "Back to screening tools",
                  fontSize: largeFontSize,
                  size: Size(
                    450,
                    64,
                  ),
                ),
              ),
              const Expanded(flex: 3, child: SizedBox.shrink()),
            ],
          )),
    ),
    const Positioned(right: 30.0, top: 50.0, child: ChatBotButton()),
    const Positioned(right: 21.0, bottom: 70.0, child: HelpButton()),
    const Positioned(
        bottom: 0,
        child: Image(image: AssetImage('assets/images/art/footer-strip.png'))),
    const Positioned(
        top: -114,
        left: -104,
        child: Image(
            width: 450,
            height: 450,
            fit: BoxFit.cover,
            image: AssetImage(
                'assets/images/art/big-symbols/kangaroo-footprint-circle.png'))),
  ]);
});
