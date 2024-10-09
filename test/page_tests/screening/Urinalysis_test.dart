import 'package:comp30022/pages/screening/Urinalysis.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:comp30022/components/RedActionButton.dart';
import 'package:comp30022/components/ChatbotButton.dart';
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

  testWidgets('Urinalysis page displays correctly',
      (WidgetTester tester) async {
    // Pump the Temperature widget into the test environment
    await tester.pumpWidget(buildConfig(
      title: "Urinalysis",
      pageNum: 3,
      body: urinalysisBody,
    ));

    await tester.binding.setSurfaceSize(const Size(1920, 1080));

    // Check if the page title is correct
    expect(find.text("Urinalysis"), findsOneWidget);

    // Ensure the helper text is present.
    expect(
        find.text("Here are some tools to help with checkup"), findsOneWidget);

    // Check if the RedActionButton is present with the correct label.
    expect(find.text("Back to screening tools"), findsOneWidget);
    expect(find.byType(RedActionButton), findsOneWidget);

    // Check if the ChatBotButton is present.
    expect(find.byType(ChatBotButton), findsOneWidget);

    // Tap the RedActionButton and verify no error occurs.
    await tester.tap(find.text("Back to screening tools"));
    await tester.pump();
  });
}
