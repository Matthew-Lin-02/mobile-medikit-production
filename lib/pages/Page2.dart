import 'package:comp30022/pages/Pages.dart';
import 'package:flutter/material.dart';
import 'package:comp30022/components/BackArrowTeal.dart';
import 'package:comp30022/components/RedActionButton.dart';
import 'package:comp30022/main.dart';
import 'package:provider/provider.dart';

class Page2 extends StatelessWidget {
  const Page2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(top: 50, left: 70, right: 70, bottom: 50),
        child: Column(
          children: [
            const BackArrowWelcome(),
            const Spacer(),
            const Text(
              "How are you feeling today?",
              style: TextStyle(
                fontSize: 56,
              ),
            ),
            const SizedBox(height: 50),
            const FittedBox(alignment: Alignment.center, child: RowOfButtons()),
            const Spacer(flex: 2),
            Align(
              alignment: Alignment.bottomRight,
              child: RedActionButton(
                iconData: Icons.check_circle,
                label: "Submit",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Page3()),
                  );
                },
              ),
            ) // minimumSize: WidgetStateProperty.all<Size>(Size(95, 95)), // Width, Height
          ],
        ),
      ),
    );
  }
}

class RowOfButtons extends StatelessWidget {
  const RowOfButtons({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> buttons = []; // Create an empty list of widgets

    for (int i = 0; i < 5; i++) {
      buttons.add(
        Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: TextButton(
            onPressed: () {
              print('Button $i pressed');
            },
            style: ButtonStyle(
              // uncomment below to remove hover effect
              // overlayColor: WidgetStateProperty.all(Colors.transparent),
              minimumSize: WidgetStateProperty.all<Size>(
                  const Size(158, 158)), // Width, Height
            ),
            child: const Text(''),
          ),
        ),
      );
    }

    return Container(
      width: 1200,
      height: 160,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
              'assets/images/wellbeing_check.png'), // Background image
          fit: BoxFit
              .contain, // This fits the image to cover the entire container
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: buttons, // Pass the list to the Row widget
      ),
    );
  }
}
