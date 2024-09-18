import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:comp30022/components/YellowBorderYellowCard.dart';
import 'package:comp30022/components/YellowBorderWhiteCard.dart';
import 'package:comp30022/components/RedActionButton.dart';
import 'package:comp30022/components/HelpButton.dart';
import 'package:comp30022/components/ChatbotButton.dart';
import 'package:comp30022/pages/results/ObservationsAndVitalSign.dart';
import 'package:comp30022/guidedConsultationBodies/ScreeningTools.dart';

void main() {
  group('Observations and Vital Signs', () {
    testWidgets('displays the correct headers and sample data',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ObservationsAndVitalSign(),
          ),
        ),
      );

      // Verify header for Key Observations and sample data is present
      expect(find.text('Key Observations'), findsOneWidget);
      expect(find.text('Heavy breathing'), findsOneWidget);
      expect(find.text('Slightly hunched standing posture'), findsOneWidget);

      // Verify Temperature header and sample data is present
      expect(find.text('Temperature'), findsOneWidget);
      expect(find.text('36.4°C'), findsOneWidget);

      // Verify Blood Pressure headers and sample data are present
      expect(find.text('Blood Pressure'), findsOneWidget);
      expect(find.text('Systolic'), findsOneWidget);
      expect(find.text('129 mmHg'), findsOneWidget);
      expect(find.text('Diastolic'), findsOneWidget);
      expect(find.text('84 mmHg'), findsOneWidget);

      // Verify Pulse text header and sample data is present
      expect(find.text('Pulse'), findsOneWidget);
      expect(find.text('68 bpm'), findsOneWidget);
    });

    testWidgets('displays the correct number of boxes',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ObservationsAndVitalSign(),
          ),
        ),
      );
      expect(find.byType(YellowBorderYellowCard), findsNWidgets(5));
      expect(find.byType(YellowBorderWhiteCard), findsOneWidget);
    });

    testWidgets('displays chatbot, help and navigation buttons',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ObservationsAndVitalSign(),
          ),
        ),
      );

      expect(find.byType(ChatBotButton), findsOneWidget);
      expect(find.byType(HelpButton), findsOneWidget);
      expect(find.byType(RedActionButton), findsNWidgets(2));
    });

    testWidgets(
        'navigates to Screening Tools page when "Back To Screening Tools button" is pressed',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: const Scaffold(
            body: ObservationsAndVitalSign(),
          ),
          routes: {
            '/screening-tools': (context) => ScreeningTools(),
          },
        ),
      );

      expect(find.text('Back To Screening Tools'), findsOneWidget);

      // Tap the Back To Screening Tools button
      await tester.tap(find.text('Back To Screening Tools'));
      await tester.pumpAndSettle();

      // Verify navigation to Screening Tools page
      expect(find.byType(ScreeningTools), findsOneWidget);
    });

    // TODO: implement once the patient education page is complete
    // testWidgets(
    //     'navigates to PatientEducation page when "Back To Screening Tools button" is pressed',
    //     (WidgetTester tester) async {
    //   await tester.pumpWidget(
    //     MaterialApp(
    //       home: Scaffold(
    //         body: ObservationsAndVitalSign(),
    //       ),
    //       routes: {
    //         '/patient-education': (context) => PatientEducation(),
    //       },
    //     ),
    //   );

    //   // Verify button exists

    //   expect(find.text('Continue To Patient Education'), findsOneWidget);

    //   // Tap the Back To Screening Tools button
    //   await tester.tap(find.text('Continue To Patient Education'));
    //   await tester.pumpAndSettle();

    //   // Verify navigation to Screening Tools page
    //   expect(find.byType(PatientEducation), findsOneWidget);
    // });
  });
}
