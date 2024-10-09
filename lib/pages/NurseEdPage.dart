import 'package:flutter/material.dart';
import 'package:comp30022/color.dart';
import 'package:comp30022/font.dart';
import 'package:comp30022/pages/AbstractConsultationPage.dart';
import 'package:comp30022/components/YellowBorderWhiteCard.dart';
import 'package:comp30022/components/ChatbotButton.dart';

Builder NurseEdPageBody = Builder(builder: (context) {
  return LargeNurseEdBot();
});

class NurseEdPage extends StatelessWidget {
  static const String routeName = '/NurseEdPage';
  const NurseEdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AbstractConsultationPage(
        title: "Nurse Ed Bot", pageNum: 1, body: NurseEdPageBody);
  }
}

class _LargeEdBotMessage extends StatelessWidget {
  final String msg;
  final bool isBot;

  const _LargeEdBotMessage({required this.msg, required this.isBot});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 25, top: 25),
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
                              color: Colors.white, fontSize: mediumFontSize)),
                    )))));
  }
}

class LargeNurseEdBot extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LargeNurseEdBot();
  }
}

class _LargeNurseEdBot extends State<LargeNurseEdBot> {
  final TextEditingController _controller = TextEditingController();

  List<Widget> messages = [
    const _LargeEdBotMessage(
        msg: "Hi Ed, Darlene has a fever and is dizzy. What should I do next?",
        isBot: false),
    const _LargeEdBotMessage(
        msg: "1. Get Darlene to sit down and loosen any tight clothing",
        isBot: true),
    const _LargeEdBotMessage(
        msg:
            "2. Assess if Darlene is currently experiencing any impediments:\n\tSpeech Disorders\n\tLoss of consciousness\n\tLoss of Mobility",
        isBot: true),
    const _LargeEdBotMessage(
        msg:
            "3. Take Darlene's blood pressure, temperature and monitor her pulse. Consider performing an ECG test if heart rate variability is high.",
        isBot: true),
    const SizedBox(height: 80),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppColors.cream,
        padding: const EdgeInsets.all(40),
        child: Stack(children: [
          Align(
              alignment: Alignment.topCenter,
              child: FractionallySizedBox(
                alignment: Alignment.topCenter,
                widthFactor: 0.9,
                heightFactor: 0.80,
                child: SingleChildScrollView(
                  child: Column(children: messages),
                ),
              )),
          Align(
            alignment: Alignment.bottomCenter,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 40),
                child: SizedBox(
                    width: 1200,
                    height: 100,
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Stack(children: [
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    spreadRadius: 3,
                                    blurRadius: 5,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: TextField(
                                controller: _controller,
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.white, width: 1),
                                        borderRadius:
                                            BorderRadius.circular(30.0)),
                                    hintText:
                                        "Enter patient responses and key points here..."),
                              ),
                            ),
                          ),
                          Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                  padding: EdgeInsets.only(right: 5),
                                  child: GestureDetector(
                                      child: Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: AppColors.turquoise),
                                        child: Align(
                                            alignment: Alignment.center,
                                            child: Icon(Icons.send,
                                                size: 30, color: Colors.white)),
                                      ),
                                      onTap: () {
                                        setState(() {
                                          /// Insert message as second last (There is a sizedbox to create a gap at the end)
                                          if (!_controller.text.isEmpty) {
                                            messages.insert(
                                                messages.length - 1,
                                                _LargeEdBotMessage(
                                                    msg: _controller.text,
                                                    isBot: false));
                                            _controller.clear();
                                          }
                                        });
                                      })))
                        ]),
                      ),
                    )),
              ),
            ),
          )
        ]));
  }
}
