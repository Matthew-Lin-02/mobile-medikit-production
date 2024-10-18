import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:comp30022/pages/screening/Observations.dart';
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

  testWidgets('Observations page displays correctly',
      (WidgetTester tester) async {
    // Pump the Observations widget into the test environment.
    await tester.pumpWidget(buildConfig(
      title: "Observations",
      pageNum: 3,
      body: const Observations(),
    ));

    await tester.binding.setSurfaceSize(const Size(1920, 1080));

    // Check for the presence of the "General Appearance" subsection.
    expect(find.text("   General Appearance"), findsOneWidget);
    // // Check for the text field hint for "General Appearance".
    expect(find.text("Enter here..."), findsWidgets);

    // Check for the presence of the "Posture and mobility" subsection.
    expect(find.text("   Posture and mobility"), findsOneWidget);
    // // Check for the presence of the "Signs of Distress" subsection.
    expect(find.text("   Signs of Distress"), findsOneWidget);

    // // Check for the presence of the "Cognitive Function" subsection.
    expect(find.text("   Cognitive Function"), findsOneWidget);

    // // Check for the presence of the "Additional Notes" subsection.
    expect(find.text("   Additional Notes:"), findsOneWidget);

    // // Check if the RedActionButton exists with correct label.
    expect(find.text("Back to screening tools"), findsOneWidget);

    // // Check if the ChatBotButton and HelpButton are present.
    expect(find.byType(ChatBotButton), findsOneWidget);
    expect(find.byType(HelpButton), findsOneWidget);

    // // Check if the RedActionButton can be tapped.
    await tester.tap(warnIfMissed: false, find.text("Back to screening tools"));
    await tester.pump(); // Rebuild after the tap.

    // // Ensure all the text fields are functional (focusing, entering text).
    await tester.enterText(find.byType(TextField).first, 'Test input');
    expect(find.text('Test input'), findsOneWidget);
  });
}
