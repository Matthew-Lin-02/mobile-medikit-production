import 'package:flutter/material.dart';
import 'package:comp30022/color.dart';

import 'package:comp30022/components/StatusTray.dart';
import 'package:comp30022/components/StepIndicator.dart';
import 'package:comp30022/components/BackArrowTeal.dart';

const double verticalSpacing = 16;
const double pageHeadingFontSize = 44.0;

class AbstractConsultationPage extends StatelessWidget {
  final String title;
  final int pageNum;
  final VoidCallback? tealBackArrowOnPressed;
  final Widget body;

  const AbstractConsultationPage({
    super.key,
    required this.title,
    required this.pageNum,
    required this.body,
    this.tealBackArrowOnPressed,
  });

  AppBar _buildAppBar(BuildContext context) {
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
              child: Column(children: [
                const SizedBox(height: 11),
                Row(children: [
                  const SizedBox(width: 115),
                  UpdatedIndicatorStep(
                    pageNum: pageNum,
                  ),
                ]),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const SizedBox(width: 12),
                    BackArrowTeal(onPressed: tealBackArrowOnPressed),
                    const SizedBox(width: 48),
                    Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontSize: pageHeadingFontSize,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.only(right: 16.0),
                          child: const StatusTray()),
                    )
                    //Expanded(child: BuildPageIndicator(pageNum: pageNum)),
                  ],
                ),
              ]),
            ),
            const SizedBox(height: 16),
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
    return Scaffold(appBar: _buildAppBar(context), body: body);
  }
}
