import 'package:flutter/material.dart';
import 'package:comp30022/color.dart';
import 'package:comp30022/styles.dart';
import 'package:comp30022/components/RedActionButton.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:comp30022/components/BaseCustomCard.dart';
import 'package:comp30022/pages/Pages.dart';

class ScreeningTools extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final containerWidth = context.screenWidth * 0.80;
    return Center(
      child: Container(
        width: containerWidth,
        color: AppColors.cream,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Center(
                  child: const Text(
                    "Here are some tools to assist with the checkup.",
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ),

              Expanded(
                flex: 23,
                child: GridView.count(
                  shrinkWrap:
                      true, // Stops the GridView from expanding unnecessarily
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 75,
                  mainAxisSpacing: 35,
                  childAspectRatio: 2.5,
                  children: const [
                    // Vitals Section
                    SectionCard(
                      sectionTitle: "Vitals",
                      tools: [
                        ToolCard(
                          imagePath:
                              '../assets/images/screening-tools/search.png',
                          label: "Observations",
                          destinationPage: SignIn(),
                        ),
                        ToolCard(
                          imagePath:
                              '../assets/images/screening-tools/temperature.png',
                          label: "Temperature",
                        ),
                        ToolCard(
                          imagePath:
                              '../assets/images/screening-tools/blood-pressure.png',
                          label: "Blood Pressure",
                        ),
                        // ToolCard(
                        //   imagePath: '../assets/images/screening-tools/camera.png',
                        //   label: "Image",
                        // ),
                      ],
                    ),
                    // Cardiovascular Section
                    SectionCard(
                      sectionTitle: "Cardiovascular",
                      tools: [
                        ToolCard(
                          imagePath:
                              '../assets/images/screening-tools/CVD-risk-assessment.png',
                          label: "CVD Risk Assessment",
                        ),
                        ToolCard(
                          imagePath:
                              '../assets/images/screening-tools/ECG-test.png',
                          label: "ECG Test",
                        ),
                        ToolCard(
                          imagePath:
                              '../assets/images/screening-tools/ankle.png',
                          label: "Ankle Brachial Index",
                        ),
                      ],
                    ),
                    // Renal Section
                    SectionCard(
                      sectionTitle: "Renal",
                      tools: [
                        ToolCard(
                          imagePath:
                              '../assets/images/screening-tools/urinalysis.png',
                          label: "Urinalysis",
                        ),
                      ],
                    ),
                    // Endocrine Section
                    SectionCard(
                      sectionTitle: "Endocrine",
                      tools: [
                        ToolCard(
                          imagePath:
                              '../assets/images/screening-tools/blood-glucose.png',
                          label: "Blood Glucose",
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Continue Button
              Expanded(flex: 1, child: SizedBox.shrink()),
              RedActionButton(
                iconData: Icons.arrow_forward,
                iconSize: 32,
                label: "Continue to Results",
                fontSize: 32,
                size: Size(
                  context.screenWidth * 0.21,
                  context.screenHeight * 0.06,
                ),
                useCircleAvatar: true,
              ),
              Expanded(flex: 2, child: SizedBox.shrink())
            ],
          ),
        ),
      ),
    );
  }
}

class SectionCard extends StatelessWidget {
  final String sectionTitle;
  final List<Widget> tools;

  const SectionCard({
    Key? key,
    required this.sectionTitle,
    required this.tools,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(14)),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          border: Border.all(width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
            ),
            BoxShadow(
              color: Colors.white,
              offset: Offset(-4, 4),
              spreadRadius: -2,
              blurRadius: 2,
            ),
            BoxShadow(
              color: Colors.white,
              offset: Offset(4, 4),
              spreadRadius: -2,
              blurRadius: 2,
            ),
            BoxShadow(
              spreadRadius: -4.0,
              blurRadius: 4,
              color: Colors.white,
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(flex: 1, child: SizedBox.shrink()),
            Expanded(
              flex: 30,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(flex: 1, child: SizedBox.shrink()),
                  Text(
                    sectionTitle,
                    style: GoogleFonts.inter(
                      fontWeight:
                          FontWeight.w700, // Controls the weight (wght axis)
                      fontSize:
                          28, // This affects the appearance for the opsz axis
                    ),
                  ),
                  Expanded(flex: 1, child: SizedBox.shrink()),
                  // Expanded(flex: 1, child: SizedBox.shrink()),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: tools,
                  ),
                  Expanded(flex: 3, child: SizedBox.shrink()),
                ],
              ),
            ),
            Expanded(flex: 1, child: SizedBox.shrink()),
          ],
        ),
      ),
    );
  }
}

class ToolCard extends StatefulWidget {
  final String imagePath;
  final String label;
  final Widget? destinationPage;

  const ToolCard({
    Key? key,
    required this.imagePath,
    required this.label,
    this.destinationPage,
  }) : super(key: key);

  @override
  _ToolCardState createState() => _ToolCardState();
}

class _ToolCardState extends State<ToolCard> {
  bool complete = false;

  @override
  Widget build(BuildContext context) {
    final toolCardWidth = MediaQuery.of(context).size.width * 0.078;
    final toolCardHeight = MediaQuery.of(context).size.height * 0.133;

    return BaseCustomCard(
      borderColor: Colors.black,
      backgroundColor: AppColors.yellowCream,
      borderWidth: 1,
      width: toolCardWidth,
      height: toolCardHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch, // Ensure full width
        children: [
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                if (widget.destinationPage != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => widget.destinationPage!),
                  );
                }
              },
              child: Row(
                children: [
                  Expanded(flex: 1, child: SizedBox.shrink()),
                  Expanded(
                    flex: 30,
                    child: Column(
                      children: [
                        Expanded(flex: 1, child: SizedBox.shrink()),
                        Image(
                            image: AssetImage(widget.imagePath),
                            height: 70,
                            width: 70),
                        // Label text
                        Expanded(flex: 1, child: SizedBox.shrink()),
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            widget.label,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(flex: 1, child: SizedBox.shrink()),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                complete =
                    !complete; // Flip the complete state and rebuild the widget
              });
            },
            child: Container(
              height: toolCardHeight * 0.21,
              width: toolCardWidth,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(16)),
                color: complete
                    ? AppColors
                        .complete // Change color based on completion state
                    : AppColors.incomplete,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    complete ? 'Complete' : 'Incomplete',
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
