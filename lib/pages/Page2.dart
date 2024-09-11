import 'package:comp30022/components/BackArrowTeal.dart';
import 'package:comp30022/pages/Pages.dart';
import 'package:flutter/material.dart';
import 'package:comp30022/components/BackArrowBlack.dart';
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
      body: Stack(children: [
        Padding(
          padding: const EdgeInsets.only(top: 50, left: 65, right: 75),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                const BackArrowTeal(),
                SizedBox(width: 50),
                Text("Welcome",
                    style: TextStyle(
                        fontSize: 50, color: Colors.black.withOpacity(0.7))),
                SizedBox(width: 20),
                Image(image: AssetImage('assets/images/yellow_art.png')),
              ]),
              Row(children: [
                SizedBox(width: 110),
                Text("Olivia", style: TextStyle(fontSize: 100))
              ]),
              SizedBox(height: 100),
              Center(
                child: const Text(
                  "How are you feeling today?",
                  style: TextStyle(
                    fontSize: 45,
                  ),
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              Center(child: FittedBox(child: WelcomeFaces())),
              const SizedBox(
                height: 20,
              ),
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
              )
            ],
          ),
        ),
        SizedBox(
            width: 1920,
            height: 1080,
            child: Row(children: [
              Align(
                  alignment: FractionalOffset.bottomLeft,
                  child: SizedBox(
                    width: 1200,
                    height: 400,
                    child: Image.asset('assets/images/Journey-Strip1.png',
                        fit: BoxFit.cover),
                  )),
              Align(
                  child: Text(
                    "     Pukurlarringu\n\"To become happy.\"\n",
                    style: TextStyle(
                        fontSize: 40,
                        color: Colors.black.withOpacity(0.6),
                        fontStyle: FontStyle.italic),
                  ),
                  alignment: FractionalOffset.bottomRight),
            ])),
      ]),
    );
  }
}

class WelcomeFaces extends StatefulWidget {
  const WelcomeFaces({super.key});

  @override
  State<WelcomeFaces> createState() => _WelcomeFacesState();
}

class _WelcomeFacesState extends State<WelcomeFaces> {
  String image = 'assets/images/Faces_empty.png';

  @override
  initState() {
    super.initState();
    image = 'assets/images/Faces_empty.png';
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
          Image(image: AssetImage(image)),
          Row(children: [
            GestureDetector(
                onTap: () {
                  setState(() {
                    image = 'assets/images/Faces_1.png';
                  });
                },
                child: Container(
                    width: 160,
                    height: 170,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromARGB(0, 0, 0, 0),
                            width: 2)))),
            SizedBox(width: 125),
            GestureDetector(
                onTap: () {
                  setState(() {
                    image = 'assets/images/Faces_2.png';
                  });
                },
                child: Container(
                    width: 160,
                    height: 170,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromARGB(0, 0, 0, 0),
                            width: 2)))),
            SizedBox(width: 125),
            GestureDetector(
                onTap: () {
                  setState(() {
                    image = 'assets/images/Faces_3.png';
                  });
                },
                child: Container(
                    width: 160,
                    height: 170,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromARGB(0, 0, 0, 0),
                            width: 2)))),
            SizedBox(width: 125),
            GestureDetector(
                onTap: () {
                  setState(() {
                    image = 'assets/images/Faces_4.png';
                  });
                },
                child: Container(
                    width: 160,
                    height: 170,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromARGB(0, 0, 0, 0),
                            width: 2)))),
            SizedBox(width: 120),
            GestureDetector(
                onTap: () {
                  setState(() {
                    image = 'assets/images/Faces_5.png';
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
