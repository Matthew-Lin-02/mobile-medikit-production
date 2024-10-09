import 'package:comp30022/color.dart';
import 'package:comp30022/components/BaseCustomCard.dart';
import 'package:comp30022/components/HelpButton.dart';
import 'package:comp30022/components/RedActionButton.dart';
import 'package:comp30022/components/StandaloneFunctions.dart';
import 'package:comp30022/components/YellowBorderWhiteCard.dart';
import 'package:comp30022/pages/results/FollowUpPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:comp30022/pages/AbstractConsultationPage.dart';
import 'package:comp30022/font.dart';

const Size actionButtonSize = Size(400, 63);
const double cardPadding = 30;
Builder resultsExplanationBody = Builder(builder: (context) {
  return Stack(
    children: [
      // Positioned the "journey strip" in the background

      Positioned(
        child: ScrollConfiguration(
          behavior: const ScrollBehavior().copyWith(scrollbars: false),
          child: ListView(
            children: [
              Container(
                color: Colors.transparent,
                child: FractionallySizedBox(
                  widthFactor: 0.9,
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 110,
                            child: Column(
                              children: [
                                const SizedBox(height: 60),
                                Row(
                                  children: [
                                    Expanded(
                                      child: YellowBorderWhiteCard(
                                        borderRadius: 50,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.all(cardPadding),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                  "Your Blood Pressure is",
                                                  style: TextStyle(
                                                      fontSize:
                                                          subHeadingFontSize)),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(12.0),
                                                child: Center(
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      showCustomModal(context,
                                                          const BloodPressurePopupWindow());
                                                    },
                                                    child: RiskLevelCard(
                                                      color: AppColors
                                                          .resultsOrange,
                                                      text: 'Medium',
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              const Text(
                                                'You may feel',
                                                style: TextStyle(
                                                    fontSize:
                                                        extraLargeFontSize),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Table(columnWidths: const {
                                                0: FlexColumnWidth(1),
                                                1: FlexColumnWidth(1),
                                                2: FlexColumnWidth(1),
                                                3: FlexColumnWidth(1),
                                              }, children: const [
                                                TableRow(
                                                  children: [
                                                    Center(
                                                      child: Image(
                                                        image: AssetImage(
                                                            'assets/images/results/headache.png'),
                                                      ),
                                                    ),
                                                    Center(
                                                      child: Image(
                                                        image: AssetImage(
                                                            'assets/images/results/sleepiness.png'),
                                                      ),
                                                    ),
                                                    Center(
                                                      child: Image(
                                                        image: AssetImage(
                                                            'assets/images/results/short-breath.png'),
                                                      ),
                                                    ),
                                                    Center(
                                                      child: Image(
                                                        image: AssetImage(
                                                            'assets/images/results/nosebleed.png'),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                TableRow(
                                                  children: [
                                                    Center(
                                                      child: Text(
                                                        "Headaches",
                                                        style: TextStyle(
                                                            fontSize:
                                                                biggishFontSize),
                                                      ),
                                                    ),
                                                    Center(
                                                      child: Text(
                                                        "Sleepiness",
                                                        style: TextStyle(
                                                            fontSize:
                                                                biggishFontSize),
                                                      ),
                                                    ),
                                                    Center(
                                                      child: Text(
                                                        "Short Breath",
                                                        style: TextStyle(
                                                            fontSize:
                                                                biggishFontSize),
                                                      ),
                                                    ),
                                                    Center(
                                                      child: Text(
                                                        "Nose bleeds",
                                                        style: TextStyle(
                                                            fontSize:
                                                                biggishFontSize),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ]),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                    height: 40), // Add spacing as needed
                                Row(
                                  children: [
                                    Expanded(
                                      child: YellowBorderWhiteCard(
                                        borderRadius: 50,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.all(cardPadding),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                  "Your blood glucose risk is",
                                                  style: TextStyle(
                                                      fontSize:
                                                          subHeadingFontSize)),
                                              Center(
                                                  child: Padding(
                                                padding:
                                                    const EdgeInsets.all(12.0),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    showCustomModal(context,
                                                        const BloodGlucosePopupWindow());
                                                  },
                                                  child: RiskLevelCard(
                                                      text: "Healthy",
                                                      color: AppColors
                                                          .resultsGreen),
                                                ),
                                              ))
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                const SizedBox(height: 40),
                                Row(
                                  children: [
                                    Expanded(
                                        child: YellowBorderWhiteCard(
                                      borderRadius: 50,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.all(cardPadding),
                                        child: Table(
                                          defaultVerticalAlignment:
                                              TableCellVerticalAlignment.middle,
                                          columnWidths: const {
                                            0: FlexColumnWidth(2),
                                            1: FlexColumnWidth(1),
                                            2: FlexColumnWidth(2),
                                          },
                                          children: [
                                            const TableRow(
                                              children: [
                                                Center(
                                                  child: Text("Heartbeat",
                                                      style: TextStyle(
                                                          fontSize:
                                                              subHeadingFontSize)),
                                                ),
                                                SizedBox.shrink(),
                                                Center(
                                                  child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                            "Listen to your heart",
                                                            style: TextStyle(
                                                                fontSize:
                                                                    largeFontSize)),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        Icon(
                                                          Icons
                                                              .volume_up_outlined,
                                                          size:
                                                              subHeadingFontSize,
                                                        )
                                                      ]),
                                                )
                                              ],
                                            ),
                                            const TableRow(children: [
                                              SizedBox(
                                                height: 50,
                                              ),
                                              SizedBox.shrink(),
                                              SizedBox.shrink()
                                            ]),
                                            TableRow(children: [
                                              Center(
                                                child: RedActionButton(
                                                  onPressed: () {
                                                    showCustomModal(context,
                                                        const ECGPopupWindow());
                                                  },
                                                  size: const Size(275, 70),
                                                  fontSize: mediumFontSize,
                                                  label: 'View graph',
                                                  iconSize: 50,
                                                  iconData: Icons
                                                      .monitor_heart_rounded,
                                                ),
                                              ),
                                              const SizedBox.shrink(),
                                              Center(
                                                child: RedActionButton(
                                                    onPressed: () {},
                                                    fontSize: mediumFontSize,
                                                    size: const Size(200, 70),
                                                    imageSize:
                                                        const Size(26, 32),
                                                    imagePath:
                                                        'assets/images/screening-tools/arrow-right-triangle.png',
                                                    label: 'Play'),
                                              )
                                            ])
                                          ],
                                        ),
                                      ),
                                    ))
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const Expanded(flex: 5, child: SizedBox.shrink()),
                          Expanded(
                            flex: 80,
                            child: Column(
                              children: [
                                const SizedBox(height: 60),
                                Stack(children: [
                                  const Positioned(
                                      child: Row(
                                    children: [
                                      Expanded(
                                          child: YellowBorderWhiteCard(
                                        height: 795,
                                        borderRadius: 50,
                                        child: Padding(
                                          padding: EdgeInsets.all(cardPadding),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(height: 470),
                                              Row(
                                                children: [
                                                  Expanded(
                                                    flex: 4,
                                                    child: Text(
                                                        "Yarn about your health with the nurse",
                                                        style: TextStyle(
                                                          fontSize:
                                                              subHeadingFontSize,
                                                        )),
                                                  ),
                                                  Expanded(
                                                      flex: 3,
                                                      child: SizedBox.shrink())
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      )),
                                    ],
                                  )),
                                  Positioned(
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: BaseCustomCard(
                                              isShadowOn: true,
                                              backgroundColor: AppColors.genai,
                                              borderRadius: 50,
                                              child: Padding(
                                                padding: const EdgeInsets.all(
                                                    cardPadding),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      width: 324,
                                                      height: 42,
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      27)),
                                                      child: const Center(
                                                        child: Text(
                                                            "Ai generated dialogue",
                                                            style: TextStyle(
                                                                color: AppColors
                                                                    .genai,
                                                                fontSize:
                                                                    smallFontSize)),
                                                      ),
                                                    ),
                                                    const Row(
                                                      children: [
                                                        Expanded(
                                                          flex: 1,
                                                          child: Padding(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    vertical:
                                                                        cardPadding),
                                                            child: Text(
                                                              "Listen to your health results in Martu Wangka",
                                                              style: TextStyle(
                                                                  height: 1.25,
                                                                  fontSize:
                                                                      subHeadingFontSize,
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                            flex: 1,
                                                            child: SizedBox
                                                                .shrink())
                                                      ],
                                                    ),
                                                    Container(
                                                      width: 614,
                                                      height: 84,
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      100)),
                                                      child: const Row(
                                                        children: [
                                                          Expanded(
                                                              flex: 3,
                                                              child: SizedBox
                                                                  .shrink()),
                                                          Image(
                                                              width: 30,
                                                              height: 36,
                                                              image: AssetImage(
                                                                  'assets/images/results/triangle.png')),
                                                          Expanded(
                                                              flex: 1,
                                                              child: SizedBox
                                                                  .shrink()),
                                                          Text("Play",
                                                              style: TextStyle(
                                                                  color:
                                                                      AppColors
                                                                          .genai,
                                                                  fontSize:
                                                                      extraLargeFontSize)),
                                                          Expanded(
                                                              flex: 7,
                                                              child: SizedBox
                                                                  .shrink()),
                                                          Text("2m 43s",
                                                              style: TextStyle(
                                                                  color:
                                                                      AppColors
                                                                          .genai,
                                                                  fontSize:
                                                                      extraLargeFontSize)),
                                                          Expanded(
                                                              flex: 3,
                                                              child: SizedBox
                                                                  .shrink())
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )),
                                        ),
                                      ],
                                    ),
                                  ),
                                ]),
                                const SizedBox(height: 40),
                                Row(
                                  children: [
                                    Expanded(
                                      child: YellowBorderWhiteCard(
                                        borderRadius: 50,
                                        child: Padding(
                                          padding: const EdgeInsets.all(30.0),
                                          child: Column(
                                            children: [
                                              const Text(
                                                "Your heartbeat is like a",
                                                style: TextStyle(fontSize: 32),
                                              ),
                                              const SizedBox(height: 10),
                                              Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(50),
                                                ),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          50), // Match the card's border radius
                                                  child: const Image(
                                                    fit: BoxFit
                                                        .cover, // Ensures the image is scaled appropriately
                                                    image: AssetImage(
                                                        'assets/images/results/baby-marlu.png'),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(height: 10),
                                              const Text(
                                                "Baby Marlu",
                                                style: TextStyle(fontSize: 32),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )

                                // Add more content here as needed
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                          height: 40), // Add spacing before the button
                      RedActionButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const FollowUpPage(),
                            ),
                          );
                        },
                        iconData: Icons.arrow_forward,
                        size: actionButtonSize,
                        iconSize: 32,
                        label: "Continue to Plan",
                        fontSize: 32,
                        useCircleAvatar: true,
                      ),
                      const SizedBox(
                        height: 100,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      // UI elements like chatbot and help buttons
      Positioned(
          right: 21.0,
          bottom: 70.0,
          child: HelpButton(onPressed: () {
            ResultsExplanationsHelp(context);
          }))
    ],
  );
});

void ResultsExplanationsHelp(BuildContext context) {
  return showCustomModal(
      context,
      Container(
        width: 1676,
        height: 816,
        decoration: BoxDecoration(
            color: AppColors.cream,
            borderRadius: BorderRadius.circular(cardPadding)),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Stack(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    "Results Explanation Help Page",
                    style: GoogleFonts.inter(
                        fontSize: cardPadding, fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  "Key Notes",
                  style: GoogleFonts.inter(
                      fontSize: cardPadding, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                    "• Ensure the patient is also able to view this page as you go through it.",
                    style: GoogleFonts.inter(fontSize: mediumFontSize)),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Sections Information",
                  style: GoogleFonts.inter(
                      fontSize: cardPadding, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                const BoldThenNormalSentence(
                    boldText: '[SELECTED TEST] Result:',
                    normalText:
                        'Displays the final results of the selected conducted test.'),
                const SizedBox(
                  height: 20,
                ),
                const BoldThenNormalSentence(
                    boldText: 'Your risk: ',
                    normalText:
                        ' States what level of risk the patient is at after these tests. '
                        'The graphs will vary slightly depending on each test. Tap the icon to display the graph and show the patient where they are on the risk scale.'),
                const SizedBox(
                  height: 20,
                ),
                const BoldThenNormalSentence(
                    boldText: 'You might experience: ',
                    normalText:
                        'Visual images provided of the potential symptoms the patient may experience.'),
                const SizedBox(
                  height: 20,
                ),
                const BoldThenNormalSentence(
                    boldText: 'Similar to: ',
                    normalText:
                        'Visual representation of a real world example of what the condition is similar to.'),
                const SizedBox(
                  height: 20,
                ),
                const BoldThenNormalSentence(
                    boldText: 'Listen to your rhythm (ECG section):',
                    normalText:
                        'Press play to play a visual sound of the heartbeat'),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Example Section:",
                  style: GoogleFonts.inter(
                      fontSize: cardPadding, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Positioned(
              top: 0,
              right: 0,
              child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.close, size: 50)),
            ),
            Positioned(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: 850,
                  height: 263,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("[SELECTED TEST] Result",
                                  style: GoogleFonts.inter(
                                      fontSize: smallFontSize,
                                      fontWeight: FontWeight.bold)),
                              const Expanded(child: SizedBox.shrink()),
                              Text("{Test results}",
                                  style: GoogleFonts.inter(
                                      fontSize: smallFontSize,
                                      fontWeight: FontWeight.bold)),
                              const Expanded(child: SizedBox.shrink()),
                              Text("Your Risk:",
                                  style: GoogleFonts.inter(
                                      fontSize: smallFontSize,
                                      fontWeight: FontWeight.bold)),
                              const Expanded(child: SizedBox.shrink()),
                              RiskLevelCard(
                                  borderRadius: 10,
                                  width: 287,
                                  height: 80,
                                  textFontSize: smallFontSize,
                                  imageWidth: 40,
                                  imageHeight: 40,
                                  imageCaptionFont: tinyFontSize,
                                  color: AppColors.resultsBlue,
                                  text: 'RISK LEVEL'),
                            ],
                          ),
                        ),
                        const Expanded(
                            flex: 3,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("You might experience:"),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  SquareGrid(),
                                ])),
                        Expanded(
                            flex: 2,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text("You might experience:"),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                      width: 250,
                                      height: 180,
                                      color: AppColors.yellowCream,
                                      child: Center(
                                        child: Text(
                                          'Image 5',
                                          style: GoogleFonts.inter(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ))
                                ]))
                      ],
                    ),
                  ),
                ),
              ),
            )
          ]),
        ),
      ));
}

class ECGPopupWindow extends StatelessWidget {
  const ECGPopupWindow({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 1920,
      height: 1080,
      color: AppColors.cream,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Stack(children: [
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    child: ListView(children: [
                  const Text(
                    'ECG Graph',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: largeFontSize),
                  ),
                  const FractionallySizedBox(
                      widthFactor: 0.85, child: Divider(color: Colors.black)),
                  SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(children: [
                        const SizedBox(width: 35),
                        Image.asset("assets/images/results/Normal_ECG.png"),
                        const SizedBox(width: 80)
                      ])),
                  SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(children: [
                        const SizedBox(width: 35),
                        Image.asset("assets/images/results/Patients_ECG.png"),
                        const SizedBox(width: 80)
                      ])),
                ]))
              ]),
          Positioned(
            top: 0,
            right: 0,
            child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(Icons.close, size: 50)),
          )
        ]),
      ),
    );
  }
}

class BloodPressurePopupWindow extends StatelessWidget {
  const BloodPressurePopupWindow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1920,
      height: 1080,
      color: AppColors.cream,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Stack(children: [
          const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Blood Pressure Chart',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: largeFontSize),
                ),
                FractionallySizedBox(
                    widthFactor: 0.85, child: Divider(color: Colors.black)),
                Image(
                    image: AssetImage(
                        'assets/images/results/blood-pressure-chart.png'))
              ]),
          Positioned(
            top: 0,
            right: 0,
            child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(Icons.close, size: 50)),
          ),
          Positioned(
            top: 450,
            right: 520,
            child: Column(
              children: [
                Text(
                  'You are here',
                  style: GoogleFonts.inter(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: smallFontSize),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Image(
                    image: AssetImage(
                        'assets/images/results/location-marker.png')),
              ],
            ),
          )
        ]),
      ),
    );
  }
}

class BloodGlucosePopupWindow extends StatelessWidget {
  const BloodGlucosePopupWindow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1920,
      height: 474,
      color: AppColors.cream,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Stack(children: [
          const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Blood Glucose Chart',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: largeFontSize),
                ),
                FractionallySizedBox(
                    widthFactor: 0.85, child: Divider(color: Colors.black)),
                SizedBox(
                  height: 80,
                ),
                Image(
                    image: AssetImage(
                        'assets/images/results/blood-glucose-level.png'))
              ]),
          Positioned(
            top: 0,
            right: 0,
            child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(Icons.close, size: 50)),
          ),
          Positioned(
            top: 80,
            left: 200,
            child: Column(
              children: [
                Text(
                  'You are here',
                  style: GoogleFonts.inter(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: smallFontSize),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Image(
                    image: AssetImage(
                        'assets/images/results/location-marker.png')),
              ],
            ),
          )
        ]),
      ),
    );
  }
}

class BoldThenNormalSentence extends StatelessWidget {
  const BoldThenNormalSentence({
    super.key,
    required this.boldText,
    required this.normalText,
  });

  final String boldText;
  final String normalText;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: boldText,
            style: GoogleFonts.inter(
                fontWeight: FontWeight.bold, fontSize: mediumFontSize),
          ),
          TextSpan(
            text: normalText,
            style: GoogleFonts.inter(
                fontWeight: FontWeight.normal, fontSize: mediumFontSize),
          ),
        ],
      ),
    );
  }
}

class RiskLevelCard extends StatelessWidget {
  const RiskLevelCard({
    super.key,
    required this.color,
    required this.text,
    this.width = 715,
    this.height = 200,
    this.imageWidth = 132,
    this.imageHeight = 133,
    this.imageCaptionFont = biggishFontSize,
    this.textFontSize = subHeadingFontSize,
    this.borderRadius = cardPadding,
  });
  final Color color;
  final String text;
  final double width;
  final double height;
  final double imageWidth;
  final double imageHeight;
  final double imageCaptionFont;
  final double borderRadius;

  final double textFontSize;
  @override
  Widget build(BuildContext context) {
    return BaseCustomCard(
      width: width,
      height: height,
      backgroundColor: color,
      borderRadius: borderRadius,
      isShadowOn: true,
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              text,
              style: TextStyle(fontSize: textFontSize, color: Colors.white),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  width: imageWidth,
                  height: imageHeight,
                  image: const AssetImage('assets/images/results/tap.png'),
                ),
                Text(
                  "Tap to view",
                  style: TextStyle(
                      color: Colors.white, fontSize: imageCaptionFont),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ResultsExplanationPage extends StatelessWidget {
  const ResultsExplanationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AbstractConsultationPage(
      title: "Results",
      pageNum: 4,
      body: resultsExplanationBody,
    );
  }
}

class SquareGrid extends StatelessWidget {
  final int gridCount = 4;

  const SquareGrid({super.key}); // Total number of squares

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210,
      width: 210, // Set a fixed height
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns
          childAspectRatio: 1.0, // Aspect ratio to make squares
          crossAxisSpacing: 15.0, // Spacing between columns
          mainAxisSpacing: 15.0, // Spacing between rows
        ),
        itemCount: gridCount,
        physics:
            const NeverScrollableScrollPhysics(), // Disable scrolling for GridView
        shrinkWrap: true, // Shrink the GridView to fit its content
        itemBuilder: (context, index) {
          return Container(
            color: AppColors.yellowCream,
            child: Center(
              child: Text('Image $index',
                  style: GoogleFonts.inter(fontWeight: FontWeight.bold)),
            ),
          );
        },
      ),
    );
  }
}
