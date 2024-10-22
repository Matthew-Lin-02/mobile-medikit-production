import 'package:comp30022/components/BaseCustomCard.dart';
import 'package:comp30022/components/checkBoxTickTheme.dart';
import 'package:comp30022/pages/results/PatientPlan.dart';

import 'package:flutter/material.dart';
import 'package:comp30022/color.dart';
import 'package:comp30022/font.dart';
import 'package:comp30022/pages/AbstractConsultationPage.dart';
import 'package:comp30022/components/ChatbotButton.dart';

import 'package:comp30022/components/RedActionButton.dart';

const double bodyFontSize = 28;
const Size generateMoreSize = Size(298, 55);
const Size createPatientPlanSize = Size(353, 70);
const Size plusIconButtonSize = Size(46, 46);

class FollowUpPage extends StatelessWidget {
  const FollowUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AbstractConsultationPage(
        title: "Follow-Up", pageNum: 5, body: followUpPageBody);
  }
}

Builder followUpPageBody = Builder(builder: (context) {
  return Stack(fit: StackFit.expand, children: [
    Positioned(
      child: Container(
        color: AppColors.cream,
        child: FractionallySizedBox(
            widthFactor: 0.8,
            child: Column(
              children: [
                const Expanded(flex: 1, child: SizedBox.shrink()),
                const Text(
                  "Select recommendations or create recommendations for Darlene",
                  style: TextStyle(fontSize: subHeadingFontSize),
                ),
                const Expanded(flex: 1, child: SizedBox.shrink()),
                const RecommendationCard(
                  text: "Pick low-fat or skim milk over full cream milk.",
                  backgroundColor: AppColors.genai,
                  borderColor: AppColors.resultsDarkGreen,
                  textColor: Colors.white,
                ),
                const Expanded(flex: 1, child: SizedBox.shrink()),
                const RecommendationCard(
                  text:
                      "Add a cup of frozen veggies to your meal. Balanced eating helps heal the heart.",
                  backgroundColor: AppColors.genai,
                  borderColor: AppColors.resultsDarkGreen,
                  textColor: Colors.white,
                ),
                const Expanded(flex: 1, child: SizedBox.shrink()),
                const RecommendationCard(
                  text:
                      "Have a bushwalk with family, look out for goanna and emu eggs.",
                  backgroundColor: AppColors.genai,
                  borderColor: AppColors.resultsDarkGreen,
                  textColor: Colors.white,
                ),
                const Expanded(flex: 1, child: SizedBox.shrink()),
                RedActionButton(
                    onPressed: () {},
                    label: "Generate more",
                    iconData: Icons.cached,
                    iconSize: 40,
                    size: generateMoreSize,
                    fontSize: biggishFontSize),
                const Expanded(flex: 2, child: SizedBox.shrink()),
                Row(
                  children: [
                    Container(
                        // width: 50,
                        // height: 50,
                        decoration: const BoxDecoration(
                            color: AppColors.red, shape: BoxShape.circle),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.add,
                            size: 30,
                            color: Colors.white,
                          ),
                        )),
                    const SizedBox(
                      width: 50,
                    ),
                    Expanded(
                      child: RecommendationCard(
                        text: "Enter your custom recommendations here...",
                        backgroundColor: Colors.white,
                        borderColor: AppColors.yellowCream,
                        textColor: AppColors.black.withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
                const Expanded(flex: 6, child: SizedBox.shrink()),
                RedActionButton(
                  label: "Create Patient Plan",
                  useCircleAvatar: true,
                  iconData: Icons.check,
                  iconSize: 40,
                  size: createPatientPlanSize,
                  fontSize: biggishFontSize,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PatientPlanPage(),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 80,
                )
              ],
            )),
      ),
    ),
    const Positioned(right: 30.0, top: 50.0, child: ChatBotButton()),
    const Positioned(
        bottom: 0,
        child: Image(image: AssetImage('assets/images/art/footer-strip.png'))),
  ]);
});

class RecommendationCard extends StatefulWidget {
  const RecommendationCard({
    required this.text,
    required this.backgroundColor,
    required this.borderColor,
    required this.textColor,
    super.key,
  });

  final String text;
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;

  @override
  State<RecommendationCard> createState() => _RecommendationCardState();
}

class _RecommendationCardState extends State<RecommendationCard> {
  bool checkboxState = false;

  void updateCheckbox(String key, bool? value) {
    setState(() {
      checkboxState = !checkboxState;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: BaseCustomCard(
            backgroundColor: widget.backgroundColor,
            borderColor: widget.borderColor,
            borderWidth: 6,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 40),
                      child: CheckboxTheme(
                        data: checkBoxTickTheme,
                        child: Transform.scale(
                          scale:
                              1.5, // Adjust the scale value to change the size
                          child: Checkbox(
                            checkColor: Colors.white,
                            activeColor: Colors.black,
                            value: checkboxState,
                            onChanged: (bool? value) {
                              updateCheckbox('medicalCheckbox1', value);
                            },
                          ),
                        ),
                      )),
                  Text(
                    widget.text,
                    style: TextStyle(
                        fontSize: largeFontSize, color: widget.textColor),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
