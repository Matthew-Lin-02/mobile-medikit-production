import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:comp30022/pages/AbstractConsultationPage.dart';
import 'package:comp30022/pages/yarning/GuidedConsultation.dart';
import 'package:comp30022/components/YellowCard.dart';

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

  group('GuidedConsultation Tests', () {
    testWidgets('Displays the correct title with abstract consultation page',
        (WidgetTester tester) async {
      const title = 'Test Title';

      await tester.pumpWidget(buildConfig(
        title: title,
        pageNum: 1,
        body: const GuidedConsultation(),
      ));

      expect(find.text(title), findsOneWidget);
    });

    testWidgets('GuidedConsultationBody displays guideline text',
        (WidgetTester tester) async {
      await tester.pumpWidget(buildConfig(
        title: 'Guided Consultation',
        pageNum: 1,
        body: const GuidedConsultation(),
      ));

      // Find the ChatbotButton
      expect(
          find.text(
              'This is a general guideline to a 715 Health Check-up. Please complete based on your judgment on what is relevant to the patient. (Not all need to be filled in, please tap arrow to expand section and enter information in light coloured boxes)'),
          findsOneWidget);
      expect(
          find.text(
              'Please tap the help icon on the bottom right for more information'),
          findsOneWidget);
    });

    testWidgets('GuidedConsultationBody displays a YellowCard',
        (WidgetTester tester) async {
      await tester.pumpWidget(buildConfig(
        title: 'Guided Consultation',
        pageNum: 1,
        body: const GuidedConsultation(),
      ));

      // Find the YellowCard widgets
      expect(find.byType(YellowCard), findsNWidgets(1));
    });
  });
}
