import 'package:flutter/material.dart';
import 'package:comp30022/pages/AbstractConsultationPage.dart';
import 'package:provider/provider.dart';
import 'package:comp30022/guidedConsultationBodies/Bodies.dart';

class GuidedConsultation extends StatefulWidget {
  const GuidedConsultation({super.key});

  @override
  State<GuidedConsultation> createState() => _GuidedConsultationState();
}

class _GuidedConsultationState extends State<GuidedConsultation> {
  @override
  Widget build(BuildContext context) {
    var guidedConsultationState = context.watch<GuidedConsultationState>();
    return guidedConsultationState
        .pageBodies[guidedConsultationState.currentPageIndex];
  }
}

class GuidedConsultationState extends ChangeNotifier {
  var currentPageIndex = 0;
  var pageBodies = <Widget>[];

  GuidedConsultationState() {
    _initializePages();
  }

  void _initializePages() {
    // Initialize your pagebodies here
    pageBodies = [
      // page 1
      AbstractConsultationPage(
        title: "Guided Consultation",
        pageNum: 2,
        body: GuidedConsultationBody(),
      ),

      AbstractConsultationPage(
        title: " ScreeningTools",
        pageNum: 3,
        body: ScreeningTools(),
      )
    ];
    notifyListeners();
  }

  void incrementPageNum() {
    currentPageIndex++;
    notifyListeners();
  }

  void decrementPageNum() {
    currentPageIndex--;
    notifyListeners();
  }

  void setPageNum(int pageNumber) {
    currentPageIndex = pageNumber;
    notifyListeners();
  }

  int getPageNumber(int currentPageIndex) {
    return currentPageIndex += 2;
  }
}
