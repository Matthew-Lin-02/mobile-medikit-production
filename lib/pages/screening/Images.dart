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

class Images extends StatelessWidget {
  const Images({super.key});

  @override
  Widget build(BuildContext context) {
    return AbstractConsultationPage(
        title: "Images", pageNum: 3, body: imagesBody);
  }
}

Builder imagesBody = Builder(builder: (context) {
  return Stack(fit: StackFit.expand, children: [
    Positioned(
      child: Container(
          color: AppColors.cream,
          child: Column(
            children: [
              // const Expanded(flex: 1, child: SizedBox.shrink()),
              // RedActionButton(
              //   iconData: Icons.arrow_back,
              //   iconSize: largeFontSize,
              //   label: "Back to screening tools",
              //   fontSize: largeFontSize,
              //   // change the size below to be constant
              //   size: const Size(
              //     450,
              //     64,
              //   ),
              // ),
              // const Expanded(flex: 1, child: SizedBox.shrink()),
            ],
          )),
    ),
    const Positioned(right: 30.0, top: 50.0, child: ChatBotButton()),
    const Positioned(right: 21.0, bottom: 70.0, child: HelpButton()),
    const Positioned(
        bottom: 0,
        child: Image(image: AssetImage('assets/images/art/footer-strip.png'))),
  ]);
});
