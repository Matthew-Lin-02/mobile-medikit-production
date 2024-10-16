import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:comp30022/pages/AbstractConsultationPage.dart';
import 'package:comp30022/color.dart';
import 'package:comp30022/components/StatusTray.dart';
import 'package:comp30022/components/StepIndicator.dart';
import 'package:comp30022/components/BackArrowTeal.dart';

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

  group('AbstractConsultationPage', () {
    testWidgets('displays the correct title with custom page size',
        (WidgetTester tester) async {
      const title = 'Test Title';

      await tester.pumpWidget(buildConfig(
        title: title,
        pageNum: 1,
        body: Container(),
      ));

      expect(find.text(title), findsOneWidget);

      addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
      addTearDown(tester.binding.window.clearDevicePixelRatioTestValue);
    });

    testWidgets('displays the correct page indicator',
        (WidgetTester tester) async {
      const pageNum = 3;

      await tester.pumpWidget(buildConfig(
        title: 'Page Indicator Test',
        pageNum: pageNum,
        body: Container(),
      ));

      expect(find.byType(UpdatedIndicatorStep), findsOneWidget);
    });

    testWidgets('contains BackArrowTeal widget', (WidgetTester tester) async {
      await tester.pumpWidget(buildConfig(
        title: 'BackArrowTeal Test',
        pageNum: 1,
        body: Container(),
      ));

      expect(find.byType(BackArrowTeal), findsOneWidget);
    });

    testWidgets('contains StatusTray widget', (WidgetTester tester) async {
      await tester.pumpWidget(buildConfig(
        title: 'StatusTray Test',
        pageNum: 1,
        body: Container(),
      ));

      expect(find.byType(StatusTray), findsOneWidget);
    });

    testWidgets('AppBar has correct background color',
        (WidgetTester tester) async {
      await tester.pumpWidget(buildConfig(
        title: 'AppBar Color Test',
        pageNum: 1,
        body: Container(),
      ));

      final appBar = tester.widget<AppBar>(find.byType(AppBar));
      expect(appBar.backgroundColor, equals(AppColors.yellowCream));
    });

    testWidgets('AppBar does not imply leading', (WidgetTester tester) async {
      await tester.pumpWidget(buildConfig(
        title: 'Leading Test',
        pageNum: 1,
        body: Container(),
      ));

      final appBar = tester.widget<AppBar>(find.byType(AppBar));
      expect(appBar.automaticallyImplyLeading, isFalse);
    });
  });
}
