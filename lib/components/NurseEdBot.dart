import 'package:flutter/material.dart';
import 'package:comp30022/color.dart';
import 'package:comp30022/font.dart';

class NurseEdBot extends StatefulWidget {
  const NurseEdBot({super.key});

  @override
  State<StatefulWidget> createState() {
    return _NurseEdBot();
  }
}

/// The main body of the nurseEdBot that displays on the side of the screen
class _NurseEdBot extends State<NurseEdBot> {
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

    const _EdBotMessage(
        msg: "Hi Ed, Darlene has a fever and is dizzy. What should I do next?",
        isBot: false),

    const SuggestionsMessage(),

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

    /// This box helps ensure all of the messages cna be read
    const SizedBox(height: 120),
  ];

  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 3,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: SizedBox(
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
                        padding: const EdgeInsets.only(
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

                                    /// Where the messages are displayed
                                    controller: _scrollController,
                                    child: Column(children: messages)))))),

                /// Bar at bottom to enter message
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 40),
                    child: FractionallySizedBox(
                        widthFactor: 0.95,
                        heightFactor: 0.1,
                        child: Container(
                          decoration: BoxDecoration(
                              color: AppColors.turquoise,
                              borderRadius: BorderRadius.circular(20.0)),
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: AppColors.turquoise),
                                child: Row(children: [
                                  Flexible(
                                    flex: 5,
                                    child: Scaffold(
                                      backgroundColor: AppColors.turquoise,

                                      /// The text box that the user inputs their message into
                                      body: TextField(
                                        controller: _controller,
                                        decoration: InputDecoration(
                                            filled: true,
                                            fillColor: Colors.white,
                                            border: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: Colors.white,
                                                    width: 1),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        30.0)),
                                            hintText: "Enter Here..."),
                                      ),
                                    ),
                                  ),

                                  /// The send button
                                  Flexible(
                                      flex: 1,
                                      child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 15),
                                          child: GestureDetector(
                                              child: const Icon(Icons.send,
                                                  size: 30,
                                                  color: Colors.white),
                                              onTap: () {
                                                setState(() {
                                                  /// Check that there is text to display
                                                  /// Don't want to display lots of empty boxes
                                                  if (_controller
                                                      .text.isNotEmpty) {
                                                    /// Insert message as second last (There is a sizedbox to create a gap at the end)
                                                    messages.insert(
                                                        messages.length - 1,

                                                        /// Create the new message box
                                                        _EdBotMessage(
                                                            msg: _controller
                                                                .text,
                                                            isBot: false));

                                                    /// Empty the box to enter the message
                                                    _controller.clear();

                                                    /// Here is where the call to the nurse bot would be made
                                                    /// /// To get the question use _controller.text
                                                    /// A new message with the result would be created using:
                                                    ///
                                                    /// messages.insert(
                                                    ///   messages.length - 1,
                                                    ///
                                                    ///   _EdBotMessage(
                                                    ///   msg: 'nurseEdModel'(question: _controller.text),
                                                    ///   isBot: true));

                                                    /// Wait until the list is updated then scroll the list down
                                                    Future.delayed(
                                                        const Duration(
                                                            milliseconds: 100),
                                                        () {
                                                      _scrollController.jumpTo(
                                                          _scrollController
                                                              .position
                                                              .maxScrollExtent);
                                                    });
                                                  }
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
                        padding: const EdgeInsets.all(18),
                        child: GestureDetector(
                            child: const Icon(Icons.cancel,
                                color: AppColors.turquoise, size: 50),
                            onTap: () {
                              Navigator.of(context).pop();
                            }))),

                /// Expand icon
                Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                        padding: const EdgeInsets.all(18),
                        child: GestureDetector(
                            child: const Icon(Icons.expand,
                                color: AppColors.turquoise, size: 50),
                            onTap: () {
                              Navigator.pushNamed(context, '/NurseEdPage');
                            })))
              ],
            ),
          ),
        ));
  }
}

/// The widget for the message
class _EdBotMessage extends StatelessWidget {
  final String msg;
  final bool isBot;

  const _EdBotMessage({required this.msg, required this.isBot});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(right: 15, top: 25),
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
                      padding: const EdgeInsets.all(15.0),
                      child: Text(msg,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: extraSmallFontSize)),
                    )))));
  }
}

/// This creates the "Here are some suggestions widget"
/// This should be displayed before any response from the bot
class SuggestionsMessage extends StatelessWidget {
  const SuggestionsMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
        padding: EdgeInsets.only(left: 10, top: 10),
        child: Row(
          children: [
            Icon(Icons.medical_information, color: AppColors.diagnosticGreen),
            Text("\tHere are some suggestions",
                style: TextStyle(color: AppColors.diagnosticGreen))
          ],
        ));
  }
}
