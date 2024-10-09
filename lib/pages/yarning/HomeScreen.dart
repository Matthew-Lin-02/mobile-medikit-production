import 'package:comp30022/components/RedActionButton.dart';
import 'package:comp30022/components/BackArrowTeal.dart';
import 'package:flutter/material.dart';
import 'package:comp30022/pages/Pages.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.only(top: 50, left: 65, right: 75),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const BackArrowWelcome(),
              const Spacer(flex: 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Image(
                      image: AssetImage('assets/images/person_add.png'),
                      height: 110,
                      width: 110),
                  const SizedBox(width: 30),
                  RedActionButton(
                      label: "New Patient",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUp()),
                        );
                      },
                      size: largeButtonSize,
                      fontSize: largeButtonFontSize),
                ],
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Image(
                      image: AssetImage('assets/images/person_search.png'),
                      height: 110,
                      width: 110),
                  const SizedBox(width: 30),
                  RedActionButton(
                      label: "Existing Patient",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ExistingPatient()),
                        );
                      },
                      size: largeButtonSize,
                      fontSize: largeButtonFontSize),
                ],
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Image(
                      image: AssetImage('assets/images/shortcut.png'),
                      height: 110,
                      width: 110),
                  const SizedBox(width: 30),
                  RedActionButton(
                      label: "Direct Functionality",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUp()),
                        );
                      },
                      size: largeButtonSize,
                      fontSize: largeButtonFontSize),
                ],
              ),
              const Spacer(flex: 4),
            ],
          )),
    );
  }
}
