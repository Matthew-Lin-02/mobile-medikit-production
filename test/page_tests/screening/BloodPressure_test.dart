import 'package:comp30022/pages/screening/BloodPressure.dart';
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

  testWidgets('BloodPressure page displays correctly',
      (WidgetTester tester) async {
    // Pump the BloodPressure widget into the test environment.
    await tester.pumpWidget(buildConfig(
      title: "BloodPressure",
      pageNum: 3,
      body: const BloodPressure(),
    ));

    // Ensure the instruction text is shown
    expect(
        find.text(
            'Please follow the standard procedure for Blood pressure tests and fill in the values below'),
        findsOneWidget);

    // Ensure the hint text for each vital is shown
    expect(find.text('Systolic\n(mmHg)'), findsOneWidget);
    expect(find.text('Diastolic\n(mmHg)'), findsOneWidget);
    expect(find.text('Pulse (min)'), findsOneWidget);

    // Ensure the hint values for VitalsCards are shown
    expect(find.text('36.4'), findsOneWidget);
    expect(find.text('84'), findsOneWidget);
    expect(find.text('68'), findsOneWidget);

    // // Check if the RedActionButton is present with the correct label
    expect(find.text("Back to screening tools"), findsOneWidget);

    // Check if the ChatBotButton and HelpButton are present
    expect(find.byType(ChatBotButton), findsOneWidget);
    expect(find.byType(HelpButton), findsOneWidget);

    // // Check that the RedActionButton can be tapped
    await tester.tap(find.text("Back to screening tools"));
    await tester.pump(); // Rebuild after the tap

    // // Check if the TextField in VitalsCard can be focused and entered text
    await tester.tap(warnIfMissed: false, find.text('36.4'));
    await tester.pump(); // Rebuild after focus
  });
}
