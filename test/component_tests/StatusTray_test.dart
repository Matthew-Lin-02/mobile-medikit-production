import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:comp30022/components/StatusTray.dart';

void main() {
  testWidgets('StatusTray renders all icons', (WidgetTester tester) async {
    // Arrange
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: StatusTray(),
        ),
      ),
    );

    // Act
    final wifiFinder = find.byWidgetPredicate(
      (widget) =>
          widget is Image && widget.image.toString().contains('wifi_figma.png'),
    );
    final globeFinder = find.byWidgetPredicate(
      (widget) =>
          widget is Image &&
          widget.image.toString().contains('globe_figma.png'),
    );
    final personFinder = find.byWidgetPredicate(
      (widget) =>
          widget is Image &&
          widget.image.toString().contains('person_figma.png'),
    );
    final settingsFinder = find.byWidgetPredicate(
      (widget) =>
          widget is Image &&
          widget.image.toString().contains('settings_figma.png'),
    );
    final phoneFinder = find.byWidgetPredicate(
      (widget) =>
          widget is Image &&
          widget.image.toString().contains('phone_figma.png'),
    );
    final ambulanceFinder = find.byWidgetPredicate(
      (widget) =>
          widget is Image &&
          widget.image.toString().contains('ambulance_figma.png'),
    );

    // Assert
    expect(wifiFinder, findsOneWidget);
    expect(globeFinder, findsOneWidget);
    expect(personFinder, findsOneWidget);
    expect(settingsFinder, findsOneWidget);
    expect(phoneFinder, findsOneWidget);
    expect(ambulanceFinder, findsOneWidget);
  });

  testWidgets('StatusIcon handles onPressed callback',
      (WidgetTester tester) async {
    // Arrange
    var pressed = false;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: StatusIcon(
            iconSize: 50.0,
            image: 'assets/images/status-tray/globe_figma.png',
            onPressed: () {
              pressed = true;
            },
          ),
        ),
      ),
    );

    // Act
    await tester.tap(find.byType(IconButton));
    await tester.pump();

    // Assert
    expect(pressed, true);
  });

  testWidgets('Custom modal is displayed when StatusIcon is pressed',
      (WidgetTester tester) async {
    // Arrange
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: StatusTray(),
        ),
      ),
    );

    // Act
    await tester.tap(find.byWidgetPredicate(
      (widget) =>
          widget is Image &&
          widget.image.toString().contains('globe_figma.png'),
    ));
    await tester.pump(); // Wait for the modal to open

    // Assert
    expect(find.byType(MachineTranslationOverlay), findsOneWidget);
  });

  testWidgets('Custom modal is dismissed when clicking outside',
      (WidgetTester tester) async {
    // Arrange
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: StatusTray(),
        ),
      ),
    );

    // Act
    await tester.tap(find.byWidgetPredicate(
      (widget) =>
          widget is Image &&
          widget.image.toString().contains('globe_figma.png'),
    ));
    await tester.pump(); // Wait for the modal to open

    // Tap outside the modal
    await tester.tapAt(Offset.zero);
    await tester.pumpAndSettle(); // Wait for the modal to close

    // Assert
    expect(find.byType(MachineTranslationOverlay), findsNothing);
  });

  testWidgets(
      'ContactHealthExpertWidget is displayed when phone icon is pressed',
      (WidgetTester tester) async {
    // Arrange
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: StatusTray(),
        ),
      ),
    );

    // Act
    await tester.tap(find.byWidgetPredicate(
      (widget) =>
          widget is Image &&
          widget.image.toString().contains('phone_figma.png'),
    ));
    await tester.pump(); // Wait for the modal to open

    // Assert
    expect(find.byType(ContactHealthExpertWidget), findsOneWidget);
  });

  testWidgets('WifiInfo is displayed when wifi icon is pressed',
      (WidgetTester tester) async {
    // Arrange
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: StatusTray(),
        ),
      ),
    );

    // Act
    await tester.tap(find.byWidgetPredicate(
      (widget) =>
          widget is Image && widget.image.toString().contains('wifi_figma.png'),
    ));
    await tester.pump(); // Wait for the modal to open

    // Assert
    expect(find.byType(WifiInfo), findsOneWidget);
  });
}
