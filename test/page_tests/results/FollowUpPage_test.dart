import 'package:comp30022/pages/results/FollowUpPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:comp30022/pages/AbstractConsultationPage.dart';

void main() {
  Widget buildConfig({
    required String title,
    required int pageNum,
    required Widget body,
  }) {
    return MaterialApp(
      home: AbstractConsultationPage(
        title: title,
        pageNum: pageNum,
        body: body,
      ),
    );
  }

  group('Follow Up Page Tests', () {
    testWidgets("", (WidgetTester tester) async {
      // Set the window size and device pixel ratio
      final TestWidgetsFlutterBinding binding =
          TestWidgetsFlutterBinding.ensureInitialized();

      // Set the test device size and pixel ratio (for a larger device simulation)
      tester.view.devicePixelRatio = 0.5;
      tester.view.physicalSize = const Size(1920, 1080);

      // Call pump after setting size to ensure changes take effect
      await tester.pumpWidget(buildConfig(
        title: "Follow-Up",
        pageNum: 5,
        body: followUpPageBody,
      ));

      // Verify that the title is displayed
      expect(find.text('Follow-Up'), findsOneWidget);

      // Verify the recommendations are displayed
      expect(
          find.text(
              'Select recommendations or create recommendations for Darlene'),
          findsOneWidget);
      expect(find.text('Pick low-fat or skim milk over full cream milk.'),
          findsOneWidget);
      expect(
          find.text(
              'Add a cup of frozen veggies to your meal. Balanced eating helps heal the heart.'),
          findsOneWidget);
      expect(
          find.text(
              'Have a bushwalk with family, look out for goanna and emu eggs.'),
          findsOneWidget);

      // Verify that action buttons are present
      expect(find.text('Generate more'), findsOneWidget);
      expect(find.text('Create Patient Plan'), findsOneWidget);

      // Verify the custom recommendations input is displayed
      expect(find.text('Enter your custom recommendations here...'),
          findsOneWidget);

      // Verify the floating action button
      expect(find.byIcon(Icons.add), findsOneWidget);
    });
  });
}
