import 'package:comp30022/pages/screening/Electrocardiogram.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:comp30022/components/ChatbotButton.dart';
import 'package:comp30022/components/HelpButton.dart';
import 'package:comp30022/pages/AbstractConsultationPage.dart';

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

  testWidgets('Electrocardiogram page displays correctly',
      (WidgetTester tester) async {
    // Pump the Electrocardiogram widget into the test environment.
    await tester.pumpWidget(buildConfig(
      title: "ECG Test",
      pageNum: 3,
      body: electrocardiogramBody,
    ));
    await tester.binding.setSurfaceSize(const Size(1920, 1080));
    // Ensure the instruction text is shown
    expect(
        find.text(
            'Please follow the standard procedure for single lead ECG assessment'),
        findsOneWidget);

    // Ensure the prompt for the help button is shown
    expect(
        find.text(
            'Press help button on the bottom corner to view standard procedure'),
        findsOneWidget);

    // Ensure the 'Begin ECG test' button is present
    expect(find.text('  Begin ECG test'), findsOneWidget);

    // Ensure the 'Back to screening tools' button is present
    expect(find.text('Back to screening tools'), findsOneWidget);

    // Check if the ChatBotButton and HelpButton are present
    expect(find.byType(ChatBotButton), findsOneWidget);
    expect(find.byType(HelpButton), findsOneWidget);

    // Check that the 'Back to screening tools' RedActionButton can be tapped
    await tester.tap(find.text('Back to screening tools'));
    await tester.pump(); // Rebuild after the tap

    // Check that the timer text shows initially as "12 s"
    expect(find.text('12 s'), findsOneWidget);
  });
}
