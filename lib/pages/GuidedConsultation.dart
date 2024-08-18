import 'package:flutter/material.dart';
import 'package:comp30022/color.dart';

import 'package:comp30022/components/StatusTray.dart';
import 'package:comp30022/components/StepIndicator.dart';
import 'package:comp30022/components/BackArrowTeal.dart';

Builder consultationBody = Builder(builder: (context) {
  return Container(
    color: AppColors.darkCream, // Matching cream background color
  );
});

class GuidedConsultation extends StatelessWidget {
  const GuidedConsultation({super.key});
  final int pageNum = 7;

  AppBar _buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.yellowCream,
      elevation: 0,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(160.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(12.0, 16.0, 0, 0),
              child: Row(
                children: [
                  SizedBox(width: 12),
                  const BackArrowTeal(),
                  const SizedBox(width: 48),
                  const Expanded(
                    child: Text(
                      'Guided Consultation',
                      style: TextStyle(
                        fontSize: 44,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Expanded(child: BuildPageIndicator(pageNum: 1)),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: StatusTray(),
              ),
            ]),
            const SizedBox(height: 16),
            Container(
              height: 1,
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buildAppBar(), body: consultationBody);
  }
}
