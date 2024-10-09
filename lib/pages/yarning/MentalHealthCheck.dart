import 'package:comp30022/components/BackArrowTeal.dart';
import 'package:comp30022/pages/Pages.dart';
import 'package:flutter/material.dart';
import 'package:comp30022/components/RedActionButton.dart';
import 'package:comp30022/font.dart';

/// MentalHealthCheck is the welcome page that asks the user how they are feeling.
/// The user is able to respond using a series of coloured faces that
/// colour themselves depending on which is selected.

class MentalHealthCheck extends StatelessWidget {
  const MentalHealthCheck({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// A stack is used to allow the art in the corner to be overlayed
      body: Stack(children: [
        /// Corner art
        SizedBox(
            width: 1920,
            height: 1080,
            child: Row(children: [
              Align(
                  alignment: FractionalOffset.bottomLeft,
                  child: SizedBox(
                    width: 1200,
                    height: 400,
                    child: Image.asset('assets/images/art/journey-strip2.png',
                        fit: BoxFit.cover),
                  )),
              Align(
                  alignment: FractionalOffset.bottomRight,
                  child: Text(
                    "     Pukurlarringu\n\"To become happy.\"\n",
                    style: TextStyle(
                        fontSize: extraLargeFontSize,
                        color: Colors.black.withOpacity(0.6),
                        fontStyle: FontStyle.italic),
                  )),
            ])),

        /// Main part of page
        Padding(
          padding: const EdgeInsets.only(top: 50, left: 65, right: 75),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BackArrowWelcome(),

              const SizedBox(height: 100),

              const Center(
                child: Text(
                  "How are you feeling today?",
                  style: TextStyle(
                    fontSize: 45,
                  ),
                ),
              ),

              const SizedBox(
                height: 70,
              ),

              /// Welcome faces with colouring
              const Center(child: FittedBox(child: WelcomeFaces())),

              const SizedBox(
                height: 20,
              ),

              Align(
                alignment: Alignment.bottomRight,
                child: RedActionButton(
                  iconData: Icons.check_circle,
                  size: smallButtonSize,
                  fontSize: largeFontSize,
                  label: "Submit",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}

/// The welcome faces that change colour to show which is selected
class WelcomeFaces extends StatefulWidget {
  const WelcomeFaces({super.key});

  @override
  State<WelcomeFaces> createState() => _WelcomeFacesState();
}

class _WelcomeFacesState extends State<WelcomeFaces> {
  String image = 'assets/images/mental-health-check/Faces_empty.png';

  @override
  initState() {
    super.initState();
    image = 'assets/images/mental-health-check/Faces_empty.png';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1300,
      height: 200,
      decoration: BoxDecoration(
          border:
              Border.all(color: const Color.fromARGB(0, 0, 0, 0), width: 2)),
      child: Stack(
        children: [
          /// Display the current image (which face is currently selected)
          Image(image: AssetImage(image)),

          /// Row of boxes above image to detect presses and change the image.
          Row(children: [
            GestureDetector(
                onTap: () {
                  /// Face 1 has been selected (worst)
                  setState(() {
                    image = 'assets/images/mental-health-check/Faces_1.png';
                  });
                },
                child: Container(
                    width: 160,
                    height: 170,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromARGB(0, 0, 0, 0),

                            /// Make sure the box cannot be seen
                            width: 2)))),
            const SizedBox(width: 125),
            GestureDetector(
                onTap: () {
                  /// Face 2 has been selected
                  setState(() {
                    image = 'assets/images/mental-health-check/Faces_2.png';
                  });
                },
                child: Container(
                    width: 160,
                    height: 170,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromARGB(0, 0, 0, 0),
                            width: 2)))),
            const SizedBox(width: 125),
            GestureDetector(
                onTap: () {
                  /// Face 3 has been selected
                  setState(() {
                    image = 'assets/images/mental-health-check/Faces_3.png';
                  });
                },
                child: Container(
                    width: 160,
                    height: 170,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromARGB(0, 0, 0, 0),
                            width: 2)))),
            const SizedBox(width: 125),
            GestureDetector(
                onTap: () {
                  /// Face 4 has been selected
                  setState(() {
                    image = 'assets/images/mental-health-check/Faces_4.png';
                  });
                },
                child: Container(
                    width: 160,
                    height: 170,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromARGB(0, 0, 0, 0),
                            width: 2)))),
            const SizedBox(width: 120),
            GestureDetector(
                onTap: () {
                  /// Face 5 has been selected (best)
                  setState(() {
                    image = 'assets/images/mental-health-check/Faces_5.png';
                  });
                },
                child: Container(
                    width: 160,
                    height: 170,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromARGB(0, 0, 0, 0),
                            width: 2)))),
          ]),
        ],
      ),
    );
  }
}

/// Old row of buttons for welcome faces
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
