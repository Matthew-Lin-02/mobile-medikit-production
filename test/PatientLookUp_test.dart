import 'package:comp30022/components/RedActionButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:comp30022/pages/ExistingPatient.dart';
import 'package:comp30022/components/CustomInputFields.dart';
import 'package:comp30022/pages/PatientLookUp.dart';
import 'package:comp30022/pages/AbstractConsultationPage.dart';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:comp30022/pages/Pages.dart';
import 'package:comp30022/color.dart';

void main() {
  Widget buildConfig({
    required String title,
    required int pageNum,
    required Widget body,
    Size size = const Size(1920, 1080),
    double devicePixelRatio = 1.0,
  }) {
    TestWidgetsFlutterBinding.ensureInitialized()
        .window
        .physicalSizeTestValue = size;
    TestWidgetsFlutterBinding.ensureInitialized()
        .window
        .devicePixelRatioTestValue = devicePixelRatio;

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => GuidedConsultationState()),
      ],
      child: MaterialApp(
        home: AbstractConsultationPage(
          title: title,
          pageNum: pageNum,
          body: body,
        ),
      ),
    );
  }

  group('Existing Patient Tests', () {
    testWidgets('Displays the correct title', (WidgetTester tester) async {
      // Build the ExistingPatient widget with the necessary provider
      await tester.pumpWidget(
        buildConfig(
          title: 'Existing Patient',
          pageNum: 1,
          body: existingPatientBody,
        ),
      );

      // Check that the AbstractConsultationPage is displayed
      final abstractPage = find.byType(AbstractConsultationPage);
      expect(abstractPage, findsOneWidget);

      // Check that the title is correct
      final AbstractConsultationPage page = tester.widget(abstractPage);
      expect(page.title, equals('Existing Patient'));
    });

    testWidgets('Displays correct table headers', (WidgetTester tester) async {
      // Build the ExistingPatient widget
      await tester.pumpWidget(
        buildConfig(
          title: 'Existing Patient',
          pageNum: 1,
          body: existingPatientBody,
        ),
      );

      // Check that the correct table headers are present
      expect(find.text('Name 1'), findsOneWidget);
      expect(find.text('DoB 1'), findsOneWidget);
      expect(find.text('Phone 1'), findsOneWidget);
      expect(find.text('Next of\nKin 1'), findsOneWidget);
    });

    testWidgets('Search button navigates correctly', (WidgetTester tester) async {
      // Build the ExistingPatient widget
      await tester.pumpWidget(
        buildConfig(
          title: 'Existing Patient',
          pageNum: 1,
          body: existingPatientBody,
        ),
      );

      // Tap the 'Search' button
      final searchButton = find.text('Search');
      await tester.tap(searchButton);
      await tester.pumpAndSettle();

      // Check that it navigates to the correct page
      expect(find.byType(PatientLookUp), findsOneWidget);
    });
  });
}
