import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:comp30022/pages/screening/Temperature.dart';
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

  testWidgets('Temperature page displays correctly',
      (WidgetTester tester) async {
    // Pump the Temperature widget into the test environment
    await tester.pumpWidget(buildConfig(
      title: "Temperature",
      pageNum: 3,
      body: temperatureBody,
    ));

    await tester.binding.setSurfaceSize(const Size(1920, 1080));

    // Check if the page title is correct
    expect(find.text("Temperature"), findsOneWidget);

    // Check if the instruction text is displayed
    expect(
        find.textContaining(
            "Please follow the standard procedure for temperature testing"),
        findsOneWidget);

    // Check if the help button instruction text is displayed
    expect(find.textContaining("Press help button"), findsOneWidget);

    // Check if the temperature vitals card is present
    expect(find.text("Temperature (°C)"), findsOneWidget);
    expect(find.text("36.4"), findsOneWidget);

    // Check if the RedActionButton with the correct label is present
    expect(find.text("Back to screening tools"), findsOneWidget);

    // Check if ChatBotButton and HelpButton are present
    expect(find.byType(ChatBotButton), findsOneWidget);
    expect(find.byType(HelpButton), findsOneWidget);

    // Tap the back button and check if it's tappable
    await tester.tap(find.text("Back to screening tools"));
    await tester.pump(); // Rebuild after tap
  });
}
