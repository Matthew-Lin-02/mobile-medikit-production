import 'package:flutter/material.dart';
import 'package:comp30022/color.dart';
import 'package:comp30022/components/StatusTray.dart';
import 'package:comp30022/components/StepIndicator.dart';
import 'package:comp30022/components/BackArrowTeal.dart';
import 'package:comp30022/pages/AbstractConsultationPage.dart';
import 'package:comp30022/guidedConsultationBodies/GuidedConsultationBody.dart';
import 'package:provider/provider.dart';
import 'package:comp30022/guidedConsultationBodies/Bodies.dart';

class GuidedConsultation extends StatefulWidget {
  const GuidedConsultation({super.key});

  @override
  State<GuidedConsultation> createState() => _GuidedConsultationState();
}

class _GuidedConsultationState extends State<GuidedConsultation> {
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
                  Expanded(child: BuildPageIndicator(pageNum: 2)),
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
    var guidedConsultationState = context.watch<GuidedConsultationState>();
    return AbstractConsultationPage(
        title: "Guided Consultation",
        pageNum: 2,
        body: guidedConsultationState
            .pageBodies[guidedConsultationState.currentPageNum]);
  }
}

class GuidedConsultationState extends ChangeNotifier {
  var currentPageNum = 0;
  var pageBodies = <Widget>[];

  GuidedConsultationState() {
    _initializePageBodies();
  }

  void _initializePageBodies() {
    // Initialize your pagebodies here
    pageBodies = [
      // page 1
      GuidedConsultationBody(),
      ScreeningTools(),
    ];
    notifyListeners();
  }

  void incrementPageNum() {
    currentPageNum++;
    notifyListeners();
  }

  void decrementPageNum() {
    currentPageNum--;
    notifyListeners();
  }

  void setPageNum(pageNumber) {
    currentPageNum = pageNumber;
    notifyListeners();
  }
}
