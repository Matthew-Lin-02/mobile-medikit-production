import 'package:flutter/material.dart';
import 'package:comp30022/color.dart';
import 'package:comp30022/components/BackArrowBlack.dart';
import 'package:comp30022/main.dart';
import 'package:provider/provider.dart';
import 'package:comp30022/pages/Pages.dart';

class Page3 extends StatelessWidget {
  const Page3({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
          padding: EdgeInsets.only(top: 50, left: 65, right: 75),
          child: Column(
            children: [
              BackArrowBlack(),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                      image: AssetImage('assets/images/person_add.png'),
                      height: 90),
                  SizedBox(width: 30),
                  LargePageButton(label: "New Patient", page: SignUp()),
                ],
              ),
              SizedBox(height: 60),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                      image: AssetImage('assets/images/person_search.png'),
                      height: 90),
                  SizedBox(width: 30),
                  LargePageButton(
                    label: "Existing Patient",
                    page: ExistingPatient(),
                  ),
                ],
              ),
              SizedBox(height: 60),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                      image: AssetImage('assets/images/shortcut.png'),
                      height: 90),
                  SizedBox(width: 30),
                  LargePageButton(
                      label: "Direct Functionality", page: SignUp()),
                ],
              ),
            ],
          )),
    );
  }
}

class LargePageButton extends StatelessWidget {
  const LargePageButton({
    super.key,
    this.debugStatement = "Button Pressed",
    required this.label,
    required this.page,
  });

  final String debugStatement;
  final String label;
  final StatelessWidget page;

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    return ElevatedButton.icon(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        },
        label: Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 30),
        ),
        style: ButtonStyle(
            iconColor: WidgetStateProperty.all(Colors.white),
            backgroundColor: WidgetStateProperty.all(AppColors.red),
            minimumSize: WidgetStateProperty.all<Size>(const Size(500, 90)),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            )));
  }
}
