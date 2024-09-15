import 'package:flutter/material.dart';
import 'package:comp30022/color.dart';

import 'package:comp30022/components/StatusTray.dart';
import 'package:comp30022/components/StepIndicator.dart';
import 'package:comp30022/components/BackArrowTeal.dart';
import 'package:provider/provider.dart';
import 'package:comp30022/pages/yarning/GuidedConsultation.dart';

const double verticalSpacing = 16;
const double pageHeadingFontSize = 44.0;

class AbstractConsultationPage extends StatelessWidget {
  final String title;
  final int pageNum;
  final Widget body;

  AbstractConsultationPage({
    Key? key,
    required this.title,
    required this.pageNum,
    required this.body,
  }) : super(key: key);

  AppBar _buildAppBar(BuildContext context) {
    var guidedConsultationState = context.watch<GuidedConsultationState>();
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
                SizedBox(height: 11),
                Row(children: [
                  SizedBox(width: 115),
                  UpdatedIndicatorStep(
                    pageNum: pageNum,
                  ),
                ]),
                SizedBox(height: 6),
                Row(
                  children: [
                    SizedBox(width: 12),
                    (guidedConsultationState.currentPageIndex == 0 ||
                            this.title == "Patient Profile")
                        ? const BackArrowTeal()
                        : BackArrowTeal(
                            onPressed:
                                guidedConsultationState.decrementPageNum),
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
                        child: const StatusTray(),
                      ),
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
