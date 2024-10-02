import 'package:comp30022/main.dart';
import 'package:flutter/material.dart';
import 'package:comp30022/color.dart';
import 'package:comp30022/font.dart';

class NurseEdBot extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NurseEdBot();
  }
}

class _NurseEdBot extends State<NurseEdBot> {
  List<Widget> messages = [
    const _EdBotMessage(
        msg: "Hi Ed, Darlene has a fever and is dizzy. What should I do next?",
        isBot: false),
    const _EdBotMessage(
        msg: "1. Get Darlene to sit down and loosen any tight clothing",
        isBot: true),
    const _EdBotMessage(
        msg:
            "2. Assess if Darlene is currently experiencing any impediments: Speech Disorders\nLoss of consciousness\nLoss of Mobility",
        isBot: true),
    const _EdBotMessage(
        msg:
            "3. Take Darlene's blood pressure, temperature and monitor her pulse. Consider performing an ECG test if heart rate variability is high.",
        isBot: true),
    const SizedBox(height: 80),
  ];

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 425,
      height: 777,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40.0),
          color: AppColors.cream,
        ),
        child: Stack(
          children: [
            const Align(
              alignment: Alignment.topCenter,
              child: Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text("Nurse Ed",
                      style: TextStyle(
                          fontSize: 40, fontWeight: FontWeight.bold))),
            ),
            Align(
                alignment: Alignment.topCenter,
                child: Padding(
                    padding: EdgeInsets.only(
                      top: 80,
                    ),
                    child: FractionallySizedBox(
                        alignment: Alignment.topCenter,
                        widthFactor: 0.95,
                        heightFactor: 0.90,
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                border: Border.all(
                                    color: AppColors.turquoise, width: 5),
                                color: AppColors.yellowCream),
                            child: SingleChildScrollView(
                                child: Column(children: messages)))))),

            /// Bar at bottom to enter message
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 40),
                child: FractionallySizedBox(
                    widthFactor: 0.95,
                    heightFactor: 0.1,
                    child: Container(
                      decoration: BoxDecoration(
                          color: AppColors.turquoise,
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Padding(
                        padding: EdgeInsets.all(15),
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: AppColors.turquoise),
                            child: Row(children: [
                              Flexible(
                                flex: 5,
                                child: Scaffold(
                                  backgroundColor: AppColors.turquoise,
                                  body: TextField(
                                    controller: _controller,
                                    decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        border: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.white, width: 1),
                                            borderRadius:
                                                BorderRadius.circular(30.0)),
                                        hintText: "Enter Here..."),
                                  ),
                                ),
                              ),
                              Flexible(
                                  flex: 1,
                                  child: Padding(
                                      padding: EdgeInsets.only(left: 15),
                                      child: GestureDetector(
                                          child: const Icon(Icons.send,
                                              size: 30, color: Colors.white),
                                          onTap: () {
                                            setState(() {
                                              /// Insert message as second last (There is a sizedbox to create a gap at the end)
                                              messages.insert(
                                                  messages.length - 1,
                                                  _EdBotMessage(
                                                      msg: _controller.text,
                                                      isBot: false));
                                              _controller.clear();
                                            });
                                          })))
                            ])),
                      ),
                    )),
              ),
            ),

            /// Exit cross in corner
            Align(
                alignment: Alignment.topLeft,
                child: Padding(
                    padding: EdgeInsets.all(18),
                    child: GestureDetector(
                        child: Icon(Icons.cancel,
                            color: AppColors.turquoise, size: 50),
                        onTap: () {
                          Navigator.of(context).pop();
                        }))),

            /// Expand icon
            Align(
                alignment: Alignment.topRight,
                child: Padding(
                    padding: EdgeInsets.all(18),
                    child: GestureDetector(
                        child: Icon(Icons.expand,
                            color: AppColors.turquoise, size: 50))))
          ],
        ),
      ),
    );
  }
}

class _EdBotMessage extends StatelessWidget {
  final String msg;
  final bool isBot;

  const _EdBotMessage({required this.msg, required this.isBot});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 15, top: 25),
        child: Align(
            alignment: Alignment.topRight,
            child: FractionallySizedBox(
                widthFactor: isBot ? 0.9 : 0.75,
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(28.0),
                        color: isBot
                            ? AppColors.diagnosticGreen
                            : AppColors.darkGrey),
                    child: Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(msg,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: extraSmallFontSize)),
                    )))));
  }
}
