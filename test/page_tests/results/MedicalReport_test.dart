import 'package:comp30022/components/RedActionButton.dart';
import 'package:comp30022/pages/AbstractConsultationPage.dart';
import 'package:comp30022/pages/results/MedicalReport.dart';
import 'package:comp30022/pages/results/PatientPlan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget buildConfig({
    required String title,
    required int pageNum,
    required Widget body,
  }) {
    return MaterialApp(
      home: AbstractConsultationPage(
        title: title,
        pageNum: pageNum,
        body: body,
      ),
    );
  }

  testWidgets("Test all page content loads", (WidgetTester tester) async {
    // Set the test device size and pixel ratio (for a larger device simulation)
    tester.view.devicePixelRatio = 1;
    tester.view.physicalSize = const Size(1920, 1080);

    // Call pump after setting size to ensure changes take effect
    await tester.pumpWidget(buildConfig(
      title: "Medical Report",
      pageNum: 6,
      body: medicalReportBody,
    ));

    // Check that generated fields have loaded
    expect(find.byType(GeneratedField), findsExactly(11));

    // Check that entry fields have loaded
    expect(find.byType(EntryField), findsExactly(3));

    // Find navigation button to next page
    final navigationButton = find.byWidgetPredicate((widget) =>
        widget is RedActionButton &&
        widget.label == "Submit report and complete checkup");
    expect(navigationButton, findsOne);
  });

  testWidgets("Test page can be navigated to", (WidgetTester tester) async {
    // Set the test device size and pixel ratio (for a larger device simulation)
    tester.view.devicePixelRatio = 0.5;
    tester.view.physicalSize = const Size(1920, 1080);

    // Call pump after setting size to ensure changes take effect
    await tester.pumpWidget(buildConfig(
      title: "Patient Plan",
      pageNum: 6,
      body: patientPlanBody,
    ));

    final navigationButton = find.byWidgetPredicate((widget) =>
        widget is RedActionButton &&
        widget.label == "Submit Patient Plan and Generate Medical Report");
    await tester.tap(navigationButton);
    await tester.pumpAndSettle();

    // Check that page title has updated
    expect(find.text("Medical Report"), findsOne);
  });
}
