import 'package:comp30022/components/RedActionButton.dart';
import 'package:comp30022/pages/AbstractConsultationPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:comp30022/pages/results/ECGResults.dart';

void main() {
  Widget buildConfig({
    required String title,
    required int pageNum,
    required Widget body,
    Size size = const Size(1920, 1080),
    double devicePixelRatio = 1.0,
  }) {
    TestWidgetsFlutterBinding.ensureInitialized().window.physicalSizeTestValue =
        size;
    TestWidgetsFlutterBinding.ensureInitialized()
        .window
        .devicePixelRatioTestValue = devicePixelRatio;

    return MaterialApp(
      home: AbstractConsultationPage(
        title: title,
        pageNum: pageNum,
        body: body,
      ),
    );
  }

  testWidgets("ECG Results renders all components",
      (WidgetTester tester) async {
    await tester.pumpWidget(buildConfig(
      title: "BloodPressure",
      pageNum: 3,
      body: const ECGResults(),
    ));

    // Find tab description
    expect(find.text("Below are the results of the ECG Test"), findsOneWidget);

    // Find Graph Section Title
    expect(find.text("Patient's graph and normal graph for comparison"),
        findsOneWidget);

    // Find Normal ECG image
    final normalEcgImage = find.byWidgetPredicate((widget) =>
        widget is Image &&
        widget.image is AssetImage &&
        (widget.image as AssetImage).assetName ==
            "assets/images/results/Normal_ECG.png");
    expect(normalEcgImage, findsOneWidget);

    // Find Patient ECG image
    final patientsEcgImage = find.byWidgetPredicate((widget) =>
        widget is Image &&
        widget.image is AssetImage &&
        (widget.image as AssetImage).assetName ==
            "assets/images/results/Patients_ECG.png");
    expect(patientsEcgImage, findsOneWidget);

    // Find Analysis Button Section Title
    expect(find.text("ECG AI Analysis Results"), findsOneWidget);

    // Find Analysis Buttons
    expect(find.byType(ClassAnalysisButton), findsExactly(2));

    // Find Red Action Button
    expect(find.byType(RedActionButton), findsOneWidget);
  });

  testWidgets("Class Analysis Buttons display overlay when clicked",
      (WidgetTester tester) async {
    await tester.pumpWidget(buildConfig(
      title: "BloodPressure",
      pageNum: 3,
      body: const ECGResults(),
    ));

    await tester.drag(find.byType(ListView), const Offset(0, -800));
    await tester.pumpAndSettle();

    await tester.tap(find.text("Diagnostic Classes"));
    await tester.pump();

    // Check that diagnostic overlay is displayed
    expect(find.byType(DiagnosticOverlay), findsOneWidget);

    await tester.tapAt(const Offset(0, 0));
    await tester.pump();

    // Checks that overlay closes when tapping outside
    expect(find.byType(DiagnosticOverlay), findsNothing);

    await tester.tap(find.text("Rhythm Classes"));
    await tester.pump();

    // Check that rhythm overlay is displayed
    expect(find.byType(RhythmOverlay), findsOneWidget);

    await tester.tapAt(const Offset(0, 0));
    await tester.pump();

    // Checks that overlay closes when tapping outside
    expect(find.byType(RhythmOverlay), findsNothing);
  });
}
