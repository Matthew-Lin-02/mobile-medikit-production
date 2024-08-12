import 'package:comp30022/components/RedActionButton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'color.dart';

import 'package:comp30022/pages/PatientSignIn.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'medi_kit',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.cream),
          scaffoldBackgroundColor: AppColors.cream,
        ),
        home: const PatientSignIn(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var currentPageNum = 0;

  var pages = <Widget>[];

  MyAppState() {
    _initializePages();
  }

  void _initializePages() {
    // Initialize your pages here
    pages = [
      // page 1
      // page 2
      const Page2()
      // Add more pages as needed
    ];
    notifyListeners();
  }

  void incrementPageNum() {
    currentPageNum++;
    notifyListeners();
  }

  void decrementPageNum() {
    currentPageNum--;
    notifyListeners();
  }

  void setPageNum(pageNumber) {
    currentPageNum = pageNumber;
    notifyListeners();
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    // final theme = Theme.of(context);

    return Scaffold(
      body: appState.pages[appState.currentPageNum],
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 50, left: 65, right: 75),
      child: Column(
        children: [
          BackArrowWelcomeRow(),
          Text(
            "Wayiwa-n feeling today?",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 70,
          ),
          FittedBox(child: RowOfButtons()),
          SizedBox(
            height: 70,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child:
                RedActionButton(iconData: Icons.check_circle, label: "Submit"),
          ),
          // minimumSize: WidgetStateProperty.all<Size>(Size(95, 95)), // Width, Height
        ],
      ),
    );
  }
}

class BackArrowWelcomeRow extends StatelessWidget {
  const BackArrowWelcomeRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(
        bottom: 35,
      ),
      child: Row(children: [
        BackArrow(),
        WelcomeColumn(),
      ]),
    );
  }
}

class WelcomeColumn extends StatelessWidget {
  const WelcomeColumn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 85),
          child: ColoredWelcome(),
        ),
        Transform.translate(
          offset: const Offset(0, -20),
          child: const Text('Karratanyju Olivia!',
              style: TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
              )),
        ),
      ],
    );
  }
}

class BackArrow extends StatelessWidget {
  const BackArrow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 0,
        right: 20,
        left: 20,
        bottom: 25,
      ),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
              color: const Color.fromRGBO(15, 13, 11, 1.0), width: 2.5),
        ),
        child: IconButton(
          onPressed: () {
            // appState.placeHolde();
          },
          color: const Color.fromRGBO(15, 13, 11, 1.0),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
    );
  }
}

class ColoredWelcome extends StatelessWidget {
  const ColoredWelcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      RichText(
        text: TextSpan(
          text: 'Welcome',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.normal,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 3
              ..color = Colors.black,
          ),
        ),
      ),
      RichText(
        text: const TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: 'W',
              style: TextStyle(color: AppColors.red),
            ),
            TextSpan(
              text: 'e',
              style: TextStyle(color: AppColors.green),
            ),
            TextSpan(
              text: 'l',
              style: TextStyle(color: AppColors.orange),
            ),
            TextSpan(
              text: 'c',
              style: TextStyle(color: AppColors.blue),
            ),
            TextSpan(
              text: 'o',
              style: TextStyle(color: AppColors.red),
            ),
            TextSpan(
              text: 'm',
              style: TextStyle(color: AppColors.green),
            ),
            TextSpan(
              text: 'e',
              style: TextStyle(color: AppColors.orange),
            ),
          ],
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.normal),
        ),
      ),
    ]);
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
              // to remove the hover effect
              overlayColor: WidgetStateProperty.all(Colors.transparent),
              minimumSize: WidgetStateProperty.all<Size>(
                  const Size(95, 95)), // Width, Height
            ),
            child: const Text(''),
          ),
        ),
      );
    }

    return Container(
      width: 660,
      height: 95,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
              'assets/images/background.png'), // Replace with your image path
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
