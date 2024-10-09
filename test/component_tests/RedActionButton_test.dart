import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:comp30022/components/RedActionButton.dart';

void main() {
  group('RedActionButton', () {
    testWidgets('displays label', (WidgetTester tester) async {
      const testLabel = 'Test Button';

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: RedActionButton(label: testLabel),
          ),
        ),
      );

      expect(find.text(testLabel), findsOneWidget);
    });

    testWidgets('calls onPressed when tapped', (WidgetTester tester) async {
      bool wasPressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RedActionButton(
              label: 'Test Button',
              onPressed: () {
                wasPressed = true;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.byType(RedActionButton));
      await tester.pump();

      expect(wasPressed, isTrue);
    });

    testWidgets('displays icon when iconData is provided',
        (WidgetTester tester) async {
      const testIcon = Icons.add;

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: RedActionButton(
              label: 'Test Button',
              iconData: testIcon,
            ),
          ),
        ),
      );

      expect(find.byIcon(testIcon), findsOneWidget);
    });

    testWidgets('displays image when imagePath is provided',
        (WidgetTester tester) async {
      const testImagePath = 'assets/images/person_search_white.png';

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: RedActionButton(
              label: 'Test Button',
              imagePath: testImagePath,
            ),
          ),
        ),
      );

      expect(find.byType(Image), findsOneWidget);
    });

    testWidgets('uses default size when size is not provided',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: RedActionButton(label: 'Test Button'),
          ),
        ),
      );

      expect(find.byType(RedActionButton), findsOneWidget);

      final Size buttonSize = tester.getSize(find.byType(RedActionButton));
      expect(buttonSize, const Size(250, 80));
    });

    testWidgets('uses provided size', (WidgetTester tester) async {
      const testSize = Size(150, 50);

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: RedActionButton(
              label: 'Test Button',
              size: testSize,
            ),
          ),
        ),
      );

      expect(find.byType(RedActionButton), findsOneWidget);

      final Size buttonSize = tester.getSize(find.byType(RedActionButton));
      expect(buttonSize, testSize);
    });
  });
}
