import 'package:comp30022/pages/AbstractConsultationPage.dart';
import 'package:comp30022/pages/results/ResultsPage.dart';
import 'package:comp30022/pages/screening/BloodPressure.dart';
import 'package:comp30022/pages/screening/Electrocardiogram.dart';
import 'package:comp30022/pages/screening/Temperature.dart';
import 'package:comp30022/pages/screening/Urinalysis.dart';
import 'package:comp30022/pages/screening/Images.dart';
import 'package:flutter/material.dart';
import 'package:comp30022/color.dart';
import 'package:comp30022/styles.dart';
import 'package:comp30022/components/RedActionButton.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:comp30022/components/BaseCustomCard.dart';
import 'package:comp30022/pages/screening/Observations.dart';
import 'package:comp30022/components/ChatbotButton.dart';
import 'package:comp30022/components/HelpButton.dart';
import 'package:comp30022/components/MultiPurposeCarousel.dart';

Builder screeningToolsBody = Builder(builder: (context) {
  return const Stack(children: [
    Positioned(right: 30.0, top: 50.0, child: ChatBotButton()),
    Positioned(right: 21.0, bottom: 70.0, child: HelpButton()),
    Positioned(child: ScreeningToolsMainContent())
  ]);
});

class ScreeningTools extends StatelessWidget {
  const ScreeningTools({super.key});

  @override
  Widget build(BuildContext context) {
    return AbstractConsultationPage(
        title: "Screening", pageNum: 3, body: screeningToolsBody);
  }
}

class ScreeningToolsMainContent extends StatelessWidget {
  const ScreeningToolsMainContent({
    super.key,
  });

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
              const Expanded(
                flex: 3,
                child: Center(
                  child: Text(
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
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 75,
                  mainAxisSpacing: 35,
                  childAspectRatio: 2.5,
                  children: const [
                    // Vitals Section
                    SectionCard(
                      sectionTitle: "Vitals",
                      tools: [
                        MultiPurposeCarousel(widgets: [
                          ToolCard(
                            imagePath:
                                'assets/images/screening-tools/search.png',
                            label: "Observations",
                            destinationPage: Observations(),
                          ),
                          ToolCard(
                            imagePath:
                                'assets/images/screening-tools/temperature.png',
                            label: "Temperature",
                            destinationPage: Temperature(),
                          ),
                          ToolCard(
                            imagePath:
                                'assets/images/screening-tools/blood-pressure.png',
                            label: "Blood Pressure",
                            destinationPage: BloodPressure(),
                          ),
                          ToolCard(
                            imagePath:
                                'assets/images/screening-tools/camera.png',
                            label: "Image",
                            destinationPage: Images(),
                          ),
                        ]),
                      ],
                    ),
                    // Cardiovascular Section
                    SectionCard(
                      sectionTitle: "Cardiovascular",
                      tools: [
                        MultiPurposeCarousel(
                          widgets: [
                            ToolCard(
                              imagePath:
                                  'assets/images/screening-tools/CVD-risk-assessment.png',
                              label: "CVD Risk Assessment",
                            ),
                            ToolCard(
                              imagePath:
                                  'assets/images/screening-tools/ECG-test.png',
                              label: "ECG Test",
                              destinationPage: Electrocardiogram(),
                            ),
                            ToolCard(
                              imagePath:
                                  'assets/images/screening-tools/ankle.png',
                              label: "Ankle Brachial Index",
                            ),
                          ],
                        )
                      ],
                    ),
                    // Renal Section
                    SectionCard(
                      sectionTitle: "Renal",
                      tools: [
                        MultiPurposeCarousel(
                          widgets: [
                            ToolCard(
                              imagePath:
                                  'assets/images/screening-tools/urinalysis.png',
                              label: "Urinalysis",
                              destinationPage: Urinalysis(),
                            ),
                          ],
                        )
                      ],
                    ),
                    // Endocrine Section
                    SectionCard(
                      sectionTitle: "Endocrine",
                      tools: [
                        MultiPurposeCarousel(
                          widgets: [
                            ToolCard(
                              imagePath:
                                  'assets/images/screening-tools/blood-glucose.png',
                              label: "Blood Glucose",
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),

              // Continue Button
              const Expanded(flex: 1, child: SizedBox.shrink()),
              RedActionButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Results()),
                  );
                },
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
              const Expanded(flex: 2, child: SizedBox.shrink())
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
    super.key,
    required this.sectionTitle,
    required this.tools,
  });

  @override
  Widget build(BuildContext context) {
    final toolCardWidth = MediaQuery.of(context).size.width * 0.078;
    final toolCardHeight = MediaQuery.of(context).size.height * 0.133;

    // Create a list of tool cards ensuring there are at least 3 by adding invisible placeholders
    final paddedTools = List<Widget>.from(tools);

    /// No longer need to add extra blank tools
    /*
    while (paddedTools.length < 3) {
      paddedTools.add(_buildInvisibleToolCard(toolCardWidth, toolCardHeight));
    }
    */

    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(14)),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          border: Border.all(width: 1),
          boxShadow: const [
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
            const Expanded(flex: 1, child: SizedBox.shrink()),
            Expanded(
              flex: 30,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Expanded(flex: 1, child: SizedBox.shrink()),
                  Text(
                    sectionTitle,
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w700,
                      fontSize: 28,
                    ),
                  ),
                  const Expanded(flex: 1, child: SizedBox.shrink()),
                  Expanded(
                    flex: 5,
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: paddedTools,
                    ),
                  ),
                  const Expanded(flex: 2, child: SizedBox.shrink()),
                ],
              ),
            ),
            const Expanded(flex: 1, child: SizedBox.shrink()),
          ],
        ),
      ),
    );
  }

  // Invisible placeholder ToolCard
  Widget _buildInvisibleToolCard(double width, double height) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.transparent),
      ),
    );
  }
}

class ToolCard extends StatefulWidget {
  final String imagePath;
  final String label;
  final Widget? destinationPage;

  const ToolCard({
    super.key,
    required this.imagePath,
    required this.label,
    this.destinationPage,
  });

  @override
  _ToolCardState createState() => _ToolCardState();
}

class _ToolCardState extends State<ToolCard> {
  bool complete = false;

  @override
  Widget build(BuildContext context) {
    final toolCardWidth = MediaQuery.of(context).size.width * 0.078;
    final toolCardHeight = MediaQuery.of(context).size.height * 0.133;

    return Padding(
        padding: const EdgeInsets.only(right: 20, left: 20),
        child: BaseCustomCard(
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
                      const Expanded(flex: 1, child: SizedBox.shrink()),
                      Expanded(
                        flex: 30,
                        child: Column(
                          children: [
                            const Expanded(flex: 1, child: SizedBox.shrink()),
                            Image(
                                image: AssetImage(widget.imagePath),
                                height: 70,
                                width: 70),
                            // Label text
                            const Expanded(flex: 1, child: SizedBox.shrink()),
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
                      const Expanded(flex: 1, child: SizedBox.shrink()),
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
                    borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(16)),
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
        ));
  }
}
