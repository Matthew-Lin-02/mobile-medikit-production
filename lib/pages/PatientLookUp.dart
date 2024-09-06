import 'package:comp30022/components/YellowBorderWhiteCard.dart';
import 'package:comp30022/pages/Pages.dart';
import 'package:flutter/material.dart';
import 'package:comp30022/color.dart';

Builder patientLookUpBody = Builder(builder: (context) {
  return Container(
    color: AppColors.cream,
    child: const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            YellowBorderWhiteCard(
              isShadowOn: true,
              width: 1718,
              height: 600,
            ),
          ],
        ),
      ],
    ),
  );
});

class PatientLookUp extends StatelessWidget {
  const PatientLookUp({super.key});

  @override
  Widget build(BuildContext context) {
    return AbstractConsultationPage(
        title: "Existing Patient", pageNum: 1, body: patientLookUpBody);
  }
}
