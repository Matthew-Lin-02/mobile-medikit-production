import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:comp30022/components/RedActionButton.dart';
import 'package:comp30022/pages/yarning/HomeScreen.dart';
import 'package:comp30022/pages/yarning/SignIn.dart';
import 'package:comp30022/pages/ConsulationComplete.dart';

void main() {
  group('Consultation Complete', () {
    Size size = const Size(1920, 1080);
    double devicePixelRatio = 1.0;
    TestWidgetsFlutterBinding.ensureInitialized().window.physicalSizeTestValue =
        size;
    TestWidgetsFlutterBinding.ensureInitialized()
        .window
        .devicePixelRatioTestValue = devicePixelRatio;

    testWidgets('displays text and images correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ConsulationComplete(),
          ),
        ),
      );

      // Verify that the text and icon are displayed
      expect(find.text('Consultation Complete '), findsOneWidget);
      expect(find.byIcon(Icons.check_circle_outline), findsOneWidget);

      // Verify that the images are displayed
      expect(find.byType(Image), findsNWidgets(4));
    });

    testWidgets('Next Patient button displays and navigates to HomeScreen',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: const Scaffold(
            body: ConsulationComplete(),
          ),
          routes: {
            '/home': (context) => const HomeScreen(),
          },
        ),
      );

      // Tap the New Patient button
      expect(find.byType(RedActionButton), findsWidgets);
      expect(find.text('Next Patient'), findsOneWidget);
      await tester.tap(find.text('Next Patient'));
      await tester.pumpAndSettle();

      // Verify that the HomeScreen is displayed
      expect(find.byType(HomeScreen), findsOneWidget);
    });

    testWidgets('Logout button navigates to SignIn',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: const Scaffold(
            body: ConsulationComplete(),
          ),
          routes: {
            '/signin': (context) => const SignIn(),
          },
        ),
      );

      // Tap the "Logout" button
      expect(find.byType(RedActionButton), findsWidgets);
      expect(find.text('Logout'), findsOneWidget);
      await tester.tap(find.text('Logout'));
      await tester.pumpAndSettle();

      // Verify that the SignIn screen is displayed
      expect(find.byType(SignIn), findsOneWidget);
    });
  });
}
