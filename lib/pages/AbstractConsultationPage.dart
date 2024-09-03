import 'package:flutter/material.dart';
import 'package:comp30022/color.dart';

import 'package:comp30022/components/StatusTray.dart';
import 'package:comp30022/components/StepIndicator.dart';
import 'package:comp30022/components/BackArrowTeal.dart';
import 'package:provider/provider.dart';
import 'package:comp30022/pages/GuidedConsultation.dart';

class AbstractConsultationPage extends StatelessWidget {
  final String title;
  final int pageNum;
  Widget body;

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
              child: Row(
                children: [
                  SizedBox(width: 12),
                  (guidedConsultationState.currentPageIndex == 0)
                      ? const BackArrowTeal()
                      : BackArrowTeal(
                          onPressed: guidedConsultationState.decrementPageNum),
                  const SizedBox(width: 48),
                  Expanded(
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 44,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Expanded(child: BuildPageIndicator(pageNum: pageNum)),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: StatusTray(),
                ),
              ],
            ),
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
