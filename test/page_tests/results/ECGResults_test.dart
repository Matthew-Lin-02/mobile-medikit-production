import 'dart:async';
import 'dart:developer';

import 'package:comp30022/components/RedActionButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:comp30022/pages/results/ECGResults.dart';

void main() {
  testWidgets("ECG Results renders all components",
      (WidgetTester tester) async {
    tester.view.devicePixelRatio = 1;
    tester.view.physicalSize = const Size(1920, 1080);
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: ECGResults(),
      ),
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

  testWidgets("ListView scrolls through components as expected",
      (WidgetTester tester) async {
    tester.view.devicePixelRatio = 1;
    tester.view.physicalSize = const Size(1920, 500);
    await tester.pumpWidget(const MaterialApp(
        home: Scaffold(
      body: ECGResults(),
    )));

    // Checks Top widget is rendered and bottom is not
    expect(find.text("Below are the results of the ECG Test"), findsOneWidget);
    expect(find.text("ECG AI Analysis Results"), findsNothing);

    // Checks for persitent widget
    expect(find.byType(RedActionButton), findsOneWidget);

    await tester.drag(find.byType(ListView), const Offset(0, -700));
    await tester.pump();

    // Checks Top widget is not rendered and bottom widget is
    expect(find.text("Below are the results of the ECG Test"), findsNothing);
    expect(find.text("ECG AI Analysis Results"), findsOneWidget);

    // Checks for persitent widget
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
