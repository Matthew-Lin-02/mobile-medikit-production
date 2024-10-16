import 'package:flutter/material.dart';
import 'package:comp30022/color.dart';
import 'package:comp30022/font.dart';
import 'package:comp30022/pages/AbstractConsultationPage.dart';

Builder NurseEdPageBody = Builder(builder: (context) {
  return const LargeNurseEdBot();
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

/// The widget for the large text box
class _LargeEdBotMessage extends StatelessWidget {
  final String msg;
  final bool isBot;

  const _LargeEdBotMessage({required this.msg, required this.isBot});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(right: 25, top: 25),
        child: Align(
            alignment: Alignment.topRight,
            child: FractionallySizedBox(
                widthFactor: isBot ? 0.9 : 0.75,
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(28.0),

                        /// Change colour depending on whether the message was sent
                        /// by the bot or user
                        color: isBot
                            ? AppColors.diagnosticGreen
                            : AppColors.darkGrey),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(msg,
                          style: const TextStyle(
                              color: Colors.white, fontSize: mediumFontSize)),
                    )))));
  }
}

class LargeNurseEdBot extends StatefulWidget {
  const LargeNurseEdBot({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LargeNurseEdBot();
  }
}

/// The main body of the large nurse ed bot
class _LargeNurseEdBot extends State<LargeNurseEdBot> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  /// This is the list of messages, these are placeholders to match the Figma design
  /// When a new message is created it is added to this list
  List<Widget> messages = [
    /// This is the start of the conversation message
    const SizedBox(height: 20),
    Row(
      children: [
        const SizedBox(width: 10),
        Expanded(
          child: Container(
            height: 2,
            color: AppColors.darkGrey,
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text("This is the start of the conversation"),
        ),
        Expanded(
          child: Container(
            height: 2,
            color: AppColors.darkGrey,
          ),
        ),
        const SizedBox(width: 10),
      ],
    ),

    const _LargeEdBotMessage(
        msg: "Hi Ed, Darlene has a fever and is dizzy. What should I do next?",
        isBot: false),

    const SuggestionsMessage(),

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

    /// This box at the bottom helps ensure that all of the messages can be read
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
                  /// Where the messages are displayed
                  controller: _scrollController,
                  child: Column(children: messages),
                ),
              )),
          Align(
            alignment: Alignment.bottomCenter,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: SizedBox(
                    width: 1200,
                    height: 100,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
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
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),

                              /// The text box that the user inputs their message into
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
                                        "\tEnter patient responses and key points here..."),
                              ),
                            ),
                          ),

                          /// The send button
                          Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                  padding: const EdgeInsets.only(right: 8),
                                  child: GestureDetector(
                                      child: Container(
                                        height: 35,
                                        width: 35,
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: AppColors.turquoise),
                                        child: const Align(
                                            alignment: Alignment.center,
                                            child: Icon(Icons.send,
                                                size: 20, color: Colors.white)),
                                      ),
                                      onTap: () {
                                        setState(() {
                                          /// Check that there is text to display
                                          /// Don't want to display lots of empty boxes
                                          if (_controller.text.isNotEmpty) {
                                            /// Insert message as second last (There is a sizedbox to create a gap at the end)
                                            messages.insert(
                                                messages.length - 1,

                                                /// Create the new message box
                                                _LargeEdBotMessage(
                                                    msg: _controller.text,
                                                    isBot: false));

                                            /// Here is where the call to the nurse bot would be made
                                            /// To get the question use _controller.text
                                            /// A new message with the result would be created using:
                                            ///
                                            /// messages.insert(
                                            ///   messages.length - 1,
                                            ///
                                            ///   _LargeEdBotMessage(
                                            ///   msg: 'nurseEdModel'(question: _controller.text),
                                            ///   isBot: true));

                                            /// Wait until the list is updated then scroll the list down
                                            Future.delayed(
                                                const Duration(
                                                    milliseconds: 100), () {
                                              _scrollController.jumpTo(
                                                  _scrollController.position
                                                      .maxScrollExtent);
                                            });

                                            /// Empty the box to enter the message
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

/// This creates the "Here are some suggestions widget"
/// /// This should be displayed before any response from the bot
class SuggestionsMessage extends StatelessWidget {
  const SuggestionsMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(Icons.medical_information, color: AppColors.diagnosticGreen),
        Text("\tHere are some suggestions",
            style: TextStyle(
                color: AppColors.diagnosticGreen, fontSize: mediumFontSize))
      ],
    );
  }
}
