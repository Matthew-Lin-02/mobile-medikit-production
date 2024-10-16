import 'package:flutter/material.dart';
import 'package:comp30022/color.dart';
import 'package:comp30022/font.dart';
import 'package:comp30022/pages/AbstractConsultationPage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:comp30022/components/ChatbotButton.dart';
import 'package:comp30022/components/RedActionButton.dart';

class Urinalysis extends StatelessWidget {
  const Urinalysis({super.key});

  @override
  Widget build(BuildContext context) {
    return AbstractConsultationPage(
        title: "Urinalysis", pageNum: 3, body: urinalysisBody);
  }
}

Builder urinalysisBody = Builder(builder: (context) {
  return Stack(fit: StackFit.expand, children: [
    Positioned(
      child: Container(
          color: AppColors.cream,
          child: Column(
            children: [
              const Expanded(flex: 1, child: SizedBox.shrink()),
              Text(
                "Here are some tools to help with checkup",
                style: GoogleFonts.inter(
                    fontSize: mediumFontSize, fontWeight: FontWeight.w600),
              ),
              const Expanded(flex: 20, child: SizedBox.shrink()),
              const RedActionButton(
                iconData: Icons.arrow_back,
                iconSize: largeFontSize,
                label: "Back to screening tools",
                fontSize: largeFontSize,
                size: Size(
                  450,
                  64,
                ),
              ),
              const Expanded(flex: 2, child: SizedBox.shrink()),
            ],
          )),
    ),
    const Positioned(right: 30.0, top: 50.0, child: ChatBotButton()),
    const Positioned(
        bottom: 0,
        child: Image(image: AssetImage('assets/images/art/footer-strip.png'))),
  ]);
});
