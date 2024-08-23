import 'package:flutter/material.dart';
import 'package:comp30022/color.dart';

import 'package:comp30022/components/StatusTray.dart';
import 'package:comp30022/components/StepIndicator.dart';
import 'package:comp30022/components/BackArrowTeal.dart';
import 'package:comp30022/pages/AbstractConsultationPage.dart';

Builder consultationBody = Builder(builder: (context) {
  return Container(
    color: AppColors.darkCream, // Matching cream background color
  );
});

class GuidedConsultation extends StatelessWidget {
  const GuidedConsultation({super.key});

  @override
  Widget build(BuildContext context) {
    return AbstractConsultationPage(
        title: "Guided Consultation", pageNum: 2, body: consultationBody);
  }
}
