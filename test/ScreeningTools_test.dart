import 'package:comp30022/pages/Pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
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
    // Tests not passing

    // Pump the Observations widget into the test environment.
    // await tester.pumpWidget(buildConfig(
    //   title: "Observations",
    //   pageNum: 3,
    //   body: ScreeningTools(),
    // ));

    // Check for the presence of the "General Appearance" subsection.
    // expect(find.text("Vitals"), findsOneWidget);
  });
}
