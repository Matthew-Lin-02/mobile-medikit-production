import 'dart:async';
import 'dart:developer';

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
      body: ECGResults(),
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
            "assets/images/Normal_ECG.png");
    expect(normalEcgImage, findsOneWidget);

    // Find Patient ECG image
    final patientsEcgImage = find.byWidgetPredicate((widget) =>
        widget is Image &&
        widget.image is AssetImage &&
        (widget.image as AssetImage).assetName ==
            "assets/images/Patients_ECG.png");
    expect(patientsEcgImage, findsOneWidget);

    // Find Analysis Button Section Title
    expect(find.text("ECG AI Analysis Results"), findsOneWidget);

    // Find Analysis Buttons
    expect(find.byType(ClassAnalysisButton), findsExactly(2));

    // Find Red Action Button
    expect(find.byType(RedActionButton), findsOneWidget);
  });

  testWidgets("Class Analysis Button is clickable",
      (WidgetTester tester) async {
    bool wasPressed = false;
    await tester.pumpWidget(MaterialApp(
        home: Scaffold(
      body: ClassAnalysisButton(
          imagePath: "assets/images/Touch_Icon.png",
          iconSpacing: 20,
          label: "Test",
          onPressed: () {
            wasPressed = true;
          }),
    )));
    await tester.tap(find.text("Test"));
    await tester.pump();

    expect(wasPressed, isTrue);
  });
}
