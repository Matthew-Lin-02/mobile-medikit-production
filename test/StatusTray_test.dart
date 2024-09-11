import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:comp30022/components/StatusTray.dart';

void main() {
  testWidgets('StatusTray renders all icons', (WidgetTester tester) async {
    // Arrange
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: StatusTray(),
        ),
      ),
    );

    // Act
    final wifiFinder = find.byWidgetPredicate(
      (widget) =>
          widget is Image &&
          widget.image.toString().contains('wifi-connection.png'),
    );
    final globeFinder = find.byWidgetPredicate(
      (widget) =>
          widget is Image && widget.image.toString().contains('globe.png'),
    );
    final personFinder = find.byWidgetPredicate(
      (widget) =>
          widget is Image &&
          widget.image.toString().contains('person-outline.png'),
    );
    final settingsFinder = find.byWidgetPredicate(
      (widget) =>
          widget is Image && widget.image.toString().contains('settings.png'),
    );
    final phoneFinder = find.byWidgetPredicate(
      (widget) =>
          widget is Image && widget.image.toString().contains('phone.png'),
    );
    final ambulanceFinder = find.byWidgetPredicate(
      (widget) =>
          widget is Image && widget.image.toString().contains('ambulance.png'),
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
            image: 'assets/images/globe.png',
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
      MaterialApp(
        home: Scaffold(
          body: StatusTray(),
        ),
      ),
    );

    // Act
    await tester.tap(find.byWidgetPredicate(
      (widget) =>
          widget is Image && widget.image.toString().contains('globe.png'),
    ));
    await tester.pump(); // Wait for the modal to open

    // Assert
    expect(find.byType(MachineTranslationOverlay), findsOneWidget);
  });

  testWidgets('Custom modal is dismissed when clicking outside',
      (WidgetTester tester) async {
    // Arrange
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: StatusTray(),
        ),
      ),
    );

    // Act
    await tester.tap(find.byWidgetPredicate(
      (widget) =>
          widget is Image && widget.image.toString().contains('globe.png'),
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
      MaterialApp(
        home: Scaffold(
          body: StatusTray(),
        ),
      ),
    );

    // Act
    await tester.tap(find.byWidgetPredicate(
      (widget) =>
          widget is Image && widget.image.toString().contains('phone.png'),
    ));
    await tester.pump(); // Wait for the modal to open

    // Assert
    expect(find.byType(ContactHealthExpertWidget), findsOneWidget);
  });

  testWidgets('WifiInfo is displayed when wifi icon is pressed',
      (WidgetTester tester) async {
    // Arrange
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: StatusTray(),
        ),
      ),
    );

    // Act
    await tester.tap(find.byWidgetPredicate(
      (widget) =>
          widget is Image &&
          widget.image.toString().contains('wifi-connection.png'),
    ));
    await tester.pump(); // Wait for the modal to open

    // Assert
    expect(find.byType(WifiInfo), findsOneWidget);
  });
}
