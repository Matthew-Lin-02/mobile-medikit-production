import 'package:comp30022/pages/Pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:comp30022/components/YellowBorderWhiteCard.dart';
import 'package:comp30022/components/ChatbotButton.dart';

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

  group('Patient Profile Tests', () {
    testWidgets('Displays the correct title with abstract consultation page',
        (WidgetTester tester) async {
      // Make screen size slightly bigger cause testing is constrained
      await tester.binding.setSurfaceSize(const Size(2100, 1300));

      // Resets the screen to its original size after the test ends
      addTearDown(tester.binding.window.clearPhysicalSizeTestValue);

      const title = 'Test Title';

      await tester.pumpWidget(buildConfig(
        title: title,
        pageNum: 1,
        body: const PatientProfile(),
      ));

      // Wait for animations and UI updates to complete
      await tester.pumpAndSettle();

      // Check if the title text is displayed
      expect(find.text(title), findsOneWidget);
    });

    testWidgets('All components are displayed on the page',
        (WidgetTester tester) async {
      // Make screen size slightly bigger cause testing is constrained
      await tester.binding.setSurfaceSize(const Size(2100, 1300));
      // Resets the screen to its original size after the test ends
      addTearDown(tester.binding.window.clearPhysicalSizeTestValue);

      await tester.pumpWidget(buildConfig(
        title: 'PatientProfile',
        pageNum: 1,
        body: const PatientProfile(),
      ));

      // Wait for animations and UI updates to complete
      await tester.pumpAndSettle();
      expect(find.byType(YellowBorderWhiteCard), findsNWidgets(2));
      expect(find.byType(UserInfoCard), findsOneWidget);
      expect(find.byType(AllergiesCard), findsOneWidget);
      expect(find.byType(ChatBotButton), findsOneWidget);
    });
    testWidgets('Switches tabs when different tabs are tapped',
        (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(2100, 1300));
      // Resets the screen to its original size after the test ends
      addTearDown(tester.binding.window.clearPhysicalSizeTestValue);

      await tester.pumpWidget(buildConfig(
        title: 'PatientProfile',
        pageNum: 1,
        body: const PatientProfile(),
      ));

      expect(find.text('General'), findsOneWidget);
      expect(find.text('History'), findsOneWidget);
      expect(find.text('Family'), findsOneWidget);
      expect(find.text('Activity'), findsOneWidget);

      // Check that General tab content is displayed initially.
      expect(find.text('Personal details'), findsOneWidget);

      // Tap the Family tab.
      await tester.tap(find.text('Family'));
      await tester.pumpAndSettle();
      // Check that Family tab content is displayed.
      expect(find.text('Language Group'), findsOneWidget);
      expect(find.text('Next of Kin'), findsOneWidget);
    });
  });
}
