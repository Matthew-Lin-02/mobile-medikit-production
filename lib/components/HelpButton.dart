import 'package:flutter/material.dart';
import 'package:comp30022/components/StandaloneFunctions.dart';
import 'package:comp30022/color.dart';
import 'package:comp30022/font.dart';

const double helpIconSize = 33;

class HelpButton extends StatelessWidget {
  const HelpButton({super.key, this.onPressed, this.pageName = ''});
  final VoidCallback? onPressed;
  final String pageName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
                color: const Color.fromRGBO(15, 13, 11, 1.0), width: 2.5),
          ),
          child: IconButton(
            onPressed: () {
              /// Change what the help button does depending on what page it is on
              switch (pageName) {
                case '':
                  break;
                case 'ECG':
                  showCustomModal(context, const ECGHelp());
                  break;
                case 'Throat':
                  showCustomModal(context, const ThroatHelp());
                  break;
                case 'Skin':
                  showCustomModal(context, const SkinHelp());
                  break;
              }
            },
            color: const Color.fromRGBO(15, 13, 11, 1.0),
            iconSize: helpIconSize,
            icon: const Icon(Icons.question_mark),
          ),
        ),
        const Text("Help",
            style: TextStyle(
                fontSize: extraSmallFontSize, fontWeight: FontWeight.bold))
      ],
    );
  }
}

/// Widget for ECG help page
class ECGHelp extends StatelessWidget {
  const ECGHelp({super.key});
  @override
  build(BuildContext context) {
    return FractionallySizedBox(
        widthFactor: 0.85,
        heightFactor: 0.75,
        child: Container(
          width: 1500,
          height: 900,
          decoration: BoxDecoration(
            color: AppColors.cream,
            borderRadius: BorderRadius.circular(25),
          ),
          //constraints: BoxConstraints.expand(),
          child: Stack(children: [
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                            padding: EdgeInsets.all(60),
                            child: Image(
                                image: AssetImage(
                                    'assets/images/help/ecg_image.png'))),
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: 60, right: 20, bottom: 20),
                                  child: Image(
                                      image: AssetImage(
                                          'assets/images/help/LA_sensor.png'),
                                      width: 50,
                                      height: 50)),
                              Text("LA sensor: below left clavicle bone",
                                  style:
                                      TextStyle(fontSize: extraSmallFontSize))
                            ]),
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: 60, right: 20, bottom: 20),
                                  child: Image(
                                      image: AssetImage(
                                          'assets/images/help/RA_sensor.png'),
                                      width: 50,
                                      height: 50)),
                              Text("RA sensor: below right clavicle bone",
                                  style:
                                      TextStyle(fontSize: extraSmallFontSize))
                            ]),
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: 60, right: 20, bottom: 20),
                                  child: Image(
                                      image: AssetImage(
                                          'assets/images/help/RL_sensor.png'),
                                      width: 50,
                                      height: 50)),
                              Text("RL sensor: lower right abdoment",
                                  style:
                                      TextStyle(fontSize: extraSmallFontSize))
                            ]),
                      ]),
                ),
                Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(top: 15, bottom: 60),
                            child: Text("Targeted Waveform: Lead 1",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: extraLargeFontSize))),
                        Center(
                            child: Text("Methodology",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: largeFontSize))),
                        SizedBox(height: 50),
                        Center(
                          /// Methodology text
                          child: Text(
                              "1. Remove any jewellery or other objects from the patient that may interfere\n    with the ECG test.\n\n2. Ensure area of skin in contact with ECG pads is clean. Use skin cleansing\n    (alcohol) wipes to ensure the area of skin is clean and dry, and free of oils\n    and lotions.\n\n3. Attach the LA (Yellow), RA (Green) and RL (Red) sensors as per the diagram\n    on the left in their labelled positions.\n\n4. Ensure patient is comfortable, clam and breathing normally\n\n5. Once ready, begin ECG Test by tapping \"Begin ECG Test\" button and follow\n    instructions displayed on screen\n",
                              style: TextStyle(
                                  fontSize: mediumFontSize, height: 1.2)),
                        ),
                      ],
                    ))
              ],
            ),

            /// Cross to exit help overlay
            Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                    child: const Padding(
                        padding: EdgeInsets.all(20),
                        child: Icon(Icons.close,
                            size: 60, color: AppColors.turquoise)),
                    onTap: () {
                      Navigator.of(context).pop();
                    }))
          ]),
        ));
  }
}

class ThroatHelp extends StatelessWidget {
  const ThroatHelp({super.key});
  @override
  build(BuildContext context) {
    return FractionallySizedBox(
        widthFactor: 0.85,
        heightFactor: 0.75,
        child: Container(
          width: 1500,
          height: 900,
          decoration: BoxDecoration(
            color: AppColors.cream,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Stack(children: [
            const SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Padding(
                      padding: EdgeInsets.all(40.0),
                      child: Text("Throat Imaging: Help Page",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: extraLargeFontSize)),
                    ),
                  ]),
                  Row(
                    children: [
                      Expanded(
                          child: Image(
                              width: 660,
                              height: 520,
                              image: AssetImage(
                                  'assets/images/screening-tools/throat-help.png'))),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(right: 100),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Center(
                                  child: Text("Methodology",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: largeFontSize))),
                              SizedBox(height: 30),
                              Center(
                                child: Text(
                                    "1. Ask patient to be in a position where they are comfortable and within range of the camera\n    \u2022 If the patient is a restless child, kindly ask the parents to hold them still while completing the check up\n2. Utilise a torch for better lighting\n3. Take a clear picture of the back of the throat\n    \u2022 If the uvula is in the way - Ask the patient to say “ahhh” so that it will be lifted up\n    \u2022 If the tongue is in the way - Use a tongue depressor (e.g. popstick) to gently press down the tongue\n4. Once happy with an image taken, press “Submit Snapshot” and then “Complete Vision Analysis” to view the analysis results\n",
                                    style: TextStyle(
                                        fontSize: mediumFontSize, height: 1.5)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Exit cross
            Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                    child: const Padding(
                        padding: EdgeInsets.all(20),
                        child: Icon(Icons.close,
                            size: 60, color: AppColors.turquoise)),
                    onTap: () {
                      Navigator.of(context).pop();
                    }))
          ]),
        ));
  }
}

class SkinHelp extends StatelessWidget {
  const SkinHelp({super.key});
  @override
  build(BuildContext context) {
    return FractionallySizedBox(
        widthFactor: 0.85,
        heightFactor: 0.75,
        child: Container(
          width: 1500,
          height: 900,
          decoration: BoxDecoration(
            color: AppColors.cream,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Stack(children: [
            const SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Padding(
                      padding: EdgeInsets.all(40.0),
                      child: Text("Skin Imaging: Help Page",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: extraLargeFontSize)),
                    ),
                  ]),
                  Row(
                    children: [
                      Expanded(
                          child: Padding(
                        padding: EdgeInsets.only(left: 100.0, right: 100.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image(
                                    width: 300,
                                    height: 300,
                                    image: AssetImage(
                                        'assets/images/screening-tools/skin-help2.png')),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Image(
                                    width: 300,
                                    height: 300,
                                    image: AssetImage(
                                        'assets/images/screening-tools/skin-help1.png')),
                              ],
                            ),
                          ],
                        ),
                      )),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(right: 100),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Center(
                                  child: Text("Methodology",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: largeFontSize))),
                              SizedBox(height: 30),
                              Center(
                                child: Text(
                                    "1. Ask patient to be in a position where they are comfortable and within range of the camera\n    \u2022 If the patient is a restless child, kindly ask the parents to hold them still while completing the check up\n2. Utilise a torch for better lighting\n3. Take a clear picture of the skin area of interest\n    \u2022 Ensure that the body part of the skin area can be identified\n    \u2022 Ensure that the details of the skin sore can be seen from the photo\n4. Once happy with an image taken, press “Submit Snapshot” and then “Complete Vision Analysis” to view the analysis results\n",
                                    style: TextStyle(
                                        fontSize: mediumFontSize, height: 1.5)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Exit cross
            Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                    child: const Padding(
                        padding: EdgeInsets.all(20),
                        child: Icon(Icons.close,
                            size: 60, color: AppColors.turquoise)),
                    onTap: () {
                      Navigator.of(context).pop();
                    }))
          ]),
        ));
  }
}
