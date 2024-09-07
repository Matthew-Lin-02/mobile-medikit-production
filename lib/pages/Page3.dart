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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BackArrowBlack(),
              Spacer(flex: 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                      image: AssetImage('assets/images/person_add.png'),
                      height: 110,
                      width: 110),
                  SizedBox(width: 30),
                  LargePageButton(label: "New Patient", page: SignUp()),
                ],
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                      image: AssetImage('assets/images/person_search.png'),
                      height: 110,
                      width: 110),
                  SizedBox(width: 30),
                  LargePageButton(
                    label: "Existing Patient",
                    page: ExistingPatient(),
                  ),
                ],
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                      image: AssetImage('assets/images/shortcut.png'),
                      height: 110,
                      width: 110),
                  SizedBox(width: 30),
                  LargePageButton(
                      label: "Direct Functionality", page: SignUp()),
                ],
              ),
              Spacer(flex: 4),
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
          style: const TextStyle(color: Colors.white, fontSize: 40),
        ),
        style: ButtonStyle(
            iconColor: WidgetStateProperty.all(Colors.white),
            backgroundColor: WidgetStateProperty.all(AppColors.red),
            minimumSize: WidgetStateProperty.all<Size>(const Size(900, 130)),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            )));
  }
}
