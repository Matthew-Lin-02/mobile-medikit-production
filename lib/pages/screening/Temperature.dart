import 'package:comp30022/components/screening/VitalsCard.dart';
import 'package:flutter/material.dart';
import 'package:comp30022/color.dart';
import 'package:comp30022/font.dart';
import 'package:comp30022/pages/AbstractConsultationPage.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:comp30022/components/ChatbotButton.dart';
import 'package:comp30022/components/HelpButton.dart';
import 'package:comp30022/components/RedActionButton.dart';

class Temperature extends StatelessWidget {
  const Temperature({super.key});

  @override
  Widget build(BuildContext context) {
    return AbstractConsultationPage(
        title: "Temperature", pageNum: 3, body: temperatureBody);
  }
}

Builder temperatureBody = Builder(builder: (context) {
  return Stack(fit: StackFit.expand, children: [
    Positioned(
      child: Container(
          color: AppColors.cream,
          child: Column(
            children: [
              Expanded(flex: 4, child: SizedBox.shrink()),
              FractionallySizedBox(
                  widthFactor: 0.5,
                  child: Text(
                    "Please follow the standard procedure for temperature testing and fill in the value below",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      fontSize: extraLargeFontSize,
                      fontWeight: FontWeight.w500,
                    ),
                  )),
              Expanded(flex: 1, child: SizedBox.shrink()),
              Text(
                "Press help button on the bottom corner to view standard procedure",
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                    fontSize: smallFontSize,
                    fontWeight: FontWeight.w500,
                    color: Colors.black.withOpacity(0.5)),
              ),
              Expanded(flex: 8, child: SizedBox.shrink()),
              VitalsCard(
                heading: 'Temperature (°C)',
                hintText: '36.4',
              ),
              Expanded(flex: 10, child: SizedBox.shrink()),
              RedActionButton(
                iconData: Icons.arrow_back,
                iconSize: extraLargeFontSize,
                label: "Back to screening tools",
                fontSize: largeFontSize,
                size: const Size(
                  450,
                  64,
                ),
              ),
              Expanded(flex: 8, child: SizedBox.shrink()),
            ],
          )),
    ),
    const Positioned(right: 30.0, top: 50.0, child: ChatBotButton()),
    const Positioned(right: 21.0, bottom: 70.0, child: HelpButton()),
  ]);
});
