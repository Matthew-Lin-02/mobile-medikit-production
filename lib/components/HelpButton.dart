import 'package:flutter/material.dart';
import 'package:comp30022/components/StandaloneFunctions.dart';
import 'package:comp30022/color.dart';
import 'package:comp30022/font.dart';

const double helpIconSize = 33;

class HelpButton extends StatelessWidget {
  final String pageName;

  const HelpButton({this.pageName = '', super.key});

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
