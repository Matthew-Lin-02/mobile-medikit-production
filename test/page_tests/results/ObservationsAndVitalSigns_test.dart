import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:comp30022/components/YellowBorderYellowCard.dart';
import 'package:comp30022/components/YellowBorderWhiteCard.dart';
import 'package:comp30022/components/RedActionButton.dart';
import 'package:comp30022/components/HelpButton.dart';
import 'package:comp30022/components/ChatbotButton.dart';
import 'package:comp30022/pages/results/ObservationsAndVitalSign.dart';
import 'package:comp30022/pages/AbstractConsultationPage.dart';

void main() {
  Widget buildConfig({
    required String title,
    required int pageNum,
    required Widget body,
    Size size = const Size(1920, 1080),
    double devicePixelRatio = 1.0,
  }) {
    const testScreenSize = Size(1920, 1080);
    TestWidgetsFlutterBinding.ensureInitialized().window.physicalSizeTestValue =
        size;
    TestWidgetsFlutterBinding.ensureInitialized()
        .window
        .devicePixelRatioTestValue = devicePixelRatio;

    return MaterialApp(
      home: MediaQuery(
        data: const MediaQueryData(size: testScreenSize),
        child: AbstractConsultationPage(
          title: title,
          pageNum: pageNum,
          body: body,
        ),
      ),
    );
  }

  group('Observations and Vital Signs', () {
    testWidgets('displays the correct headers and sample data',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        buildConfig(
            title: "Results",
            pageNum: 4,
            body: const ObservationsAndVitalSign()),
      );

      // Verify header for Key Observations and sample data is present
      expect(find.text('Key Observations'), findsOneWidget);
      expect(find.text('Heavy breathing'), findsOneWidget);
      expect(find.text('Slightly hunched standing posture'), findsOneWidget);

      // Verify Temperature header and sample data is present
      expect(find.text('Temperature'), findsOneWidget);
      expect(find.text('36.4°C'), findsOneWidget);

      // Verify Blood Pressure headers and sample data are present
      expect(find.text('Blood Pressure'), findsOneWidget);
      expect(find.text('Systolic'), findsOneWidget);
      expect(find.text('129 mmHg'), findsOneWidget);
      expect(find.text('Diastolic'), findsOneWidget);
      expect(find.text('84 mmHg'), findsOneWidget);

      // Verify Pulse text header and sample data is present
      expect(find.text('Pulse'), findsOneWidget);
      expect(find.text('68 bpm'), findsOneWidget);
    });

    testWidgets('displays the correct number of boxes',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        buildConfig(
            title: "Results",
            pageNum: 4,
            body: const ObservationsAndVitalSign()),
      );
      expect(find.byType(YellowBorderYellowCard), findsNWidgets(5));
      expect(find.byType(YellowBorderWhiteCard), findsOneWidget);
    });

    testWidgets('displays chatbot and help buttons',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ObservationsAndVitalSign(),
          ),
        ),
      );

      expect(find.byType(ChatBotButton), findsOneWidget);
      expect(find.byType(HelpButton), findsOneWidget);
    });

    testWidgets('displays both red action buttons and they can be pressed',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        buildConfig(
            title: "Results",
            pageNum: 4,
            body: const ObservationsAndVitalSign()),
      );

      expect(find.byType(RedActionButton), findsNWidgets(2));

      // Tap the Back To Screening Tools button
      expect(find.text('Back to Screening Tools'), findsOneWidget);
      await tester.tap(find.text('Back to Screening Tools'));
      await tester.pumpAndSettle();

      // Tap the Continue to Patient Education button
      // expect(find.text('Continue to Patient Education'), findsOneWidget);
      // await tester.tap(find.text('Continue to Patient Education'));
      // await tester.pumpAndSettle();
    });
  });
}
