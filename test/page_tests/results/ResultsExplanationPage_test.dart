import 'package:comp30022/pages/results/ResultsExplanationPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:comp30022/pages/AbstractConsultationPage.dart';

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

  group('ResultsExplanationPage Tests', () {
    testWidgets("ECG Results renders all components",
        (WidgetTester tester) async {
      // Set the window size and device pixel ratio
      final TestWidgetsFlutterBinding binding =
          TestWidgetsFlutterBinding.ensureInitialized();

      // Set the test device size and pixel ratio (for a larger device simulation)
      tester.view.devicePixelRatio = 0.5;
      tester.view.physicalSize = const Size(1920, 1080);

      // Call pump after setting size to ensure changes take effect
      await tester.pumpWidget(buildConfig(
        title: "BloodPressure",
        pageNum: 4,
        body: resultsExplanationBody,
      ));

      // Pump to render the widget tree
      await tester.pump();
      expect(find.text('Results'), findsOneWidget);
      // Add your tests here (for example, checking for specific widgets or content)

      // Reset the window size and pixel ratio to avoid affecting other tests
      addTearDown(tester.view.resetPhysicalSize);
    });

    testWidgets('Tapping the blood pressure risk card shows a popup',
        (WidgetTester tester) async {
      final TestWidgetsFlutterBinding binding =
          TestWidgetsFlutterBinding.ensureInitialized();

      // Set the test device size and pixel ratio (for a larger device simulation)
      tester.view.devicePixelRatio = 0.5;
      tester.view.physicalSize = const Size(1920, 1080);

      // Call pump after setting size to ensure changes take effect
      await tester.pumpWidget(buildConfig(
        title: "BloodPressure",
        pageNum: 4,
        body: resultsExplanationBody,
      ));

      // Find the RiskLevelCard for blood pressure by text 'Medium'
      final bloodPressureCard = find.widgetWithText(RiskLevelCard, 'Medium');

      // Verify that the card is present
      expect(bloodPressureCard, findsOneWidget);

      // Tap the card
      await tester.tap(bloodPressureCard);
      await tester.pumpAndSettle();

      // Verify that the blood pressure modal/popup appears (assuming 'Blood Pressure Chart' is a text in the modal)
      expect(find.text('Blood Pressure Chart'), findsOneWidget);
    });

    testWidgets('Tapping the blood glucose risk card shows a popup',
        (WidgetTester tester) async {
      final TestWidgetsFlutterBinding binding =
          TestWidgetsFlutterBinding.ensureInitialized();

      // Set the test device size and pixel ratio (for a larger device simulation)
      tester.view.devicePixelRatio = 0.5;
      tester.view.physicalSize = const Size(1920, 1080);

      // Call pump after setting size to ensure changes take effect
      await tester.pumpWidget(buildConfig(
        title: "BloodPressure",
        pageNum: 4,
        body: resultsExplanationBody,
      ));
      // Find the RiskLevelCard for blood glucose by text 'Healthy'
      final bloodGlucoseCard = find.widgetWithText(RiskLevelCard, 'Healthy');

      // Verify that the card is present
      expect(bloodGlucoseCard, findsOneWidget);

      // Tap the card
      await tester.tap(bloodGlucoseCard);
      await tester.pumpAndSettle();

      // Verify that the blood glucose modal/popup appears (assuming 'Blood Glucose Chart' is a text in the modal)
      expect(find.text('Blood Glucose Chart'), findsOneWidget);
    });
  });
}
