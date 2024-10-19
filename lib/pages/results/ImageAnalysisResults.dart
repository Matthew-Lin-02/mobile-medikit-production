import 'package:comp30022/pages/results/ResultsExplanationPage.dart';
import 'package:flutter/material.dart';
import 'package:comp30022/font.dart';
import 'package:comp30022/components/RedActionButton.dart';
import 'package:comp30022/components/HelpButton.dart';
import 'package:comp30022/components/ChatbotButton.dart';
import 'package:comp30022/color.dart';

/// The image analysis results tab that is found under the results page
class ImageAnalysisResults extends StatelessWidget {
  const ImageAnalysisResults({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Align(
          alignment: Alignment.topCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                    child: const Padding(
                        padding: EdgeInsets.only(
                            top: 10, left: 20, right: 20, bottom: 10),
                        child: Text("Skin Image Analysis",
                            style: TextStyle(
                                fontSize: mediumFontSize,
                                fontWeight: FontWeight.bold)))),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.fadedGrey),
                      child: const Padding(
                          padding: EdgeInsets.only(
                              top: 10, left: 20, right: 20, bottom: 10),
                          child: Text("Throat Image Analysis",
                              style: TextStyle(
                                  fontSize: mediumFontSize,
                                  fontWeight: FontWeight.bold)))))
            ],
          )),

      Padding(
        padding: const EdgeInsets.only(top: 150, left: 100),
        child: Align(
            alignment: Alignment.center,
            child: Row(
              children: [
                Flexible(
                    flex: 1,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Row(
                        children: [
                          Column(
                            children: [
                              const Align(
                                  alignment: Alignment.center,
                                  child: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Text("Original Image",
                                          style: TextStyle(
                                              fontSize: mediumFontSize,
                                              fontWeight: FontWeight.bold)))),
                              Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppColors.yellowCream,
                                  ),
                                  child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Image.asset(

                                          /// The original image
                                          'assets/images/results/sore-throat-original.png',
                                          height: 350,
                                          width: 350))),
                            ],
                          ),
                          const SizedBox(width: 50),
                          Column(
                            children: [
                              const Align(
                                  alignment: Alignment.center,
                                  child: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Text("Image with Heatmap Effect",
                                          style: TextStyle(
                                              fontSize: mediumFontSize,
                                              fontWeight: FontWeight.bold)))),
                              Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppColors.yellowCream,
                                  ),
                                  child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Image.asset(

                                          /// The heat map image
                                          'assets/images/results/sore-throat.png',
                                          height: 350,
                                          width: 350))),
                            ],
                          )
                        ],
                      ),
                    )),

                /// The AI analysis text
                Flexible(
                    flex: 1,
                    child: Column(
                      children: [
                        const Align(
                            alignment: Alignment.center,
                            child: Text(
                              "AI Image Analysis",
                              style: TextStyle(
                                  fontSize: mediumFontSize,
                                  fontWeight: FontWeight.bold),
                            )),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: AppColors.yellowCream),
                          child: const Padding(
                            padding: EdgeInsets.all(30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                /// Display the analysis (currently placeholder)
                                Text("Potnetial Diagnosis",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: mediumFontSize)),
                                Text(
                                    "\nThe symptoms listed below are commonly associated with\n\n* Strep Throat"),
                                Text("\nSymptoms",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: mediumFontSize)),
                                Text(
                                    "\n* The patinet's throat appears to be red and slightly inflamed\n\n* Appearance of white patches on the tonsils. This indicates the presence of pus"),
                                Text("\nTreatment/Precautions\n",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: mediumFontSize)),
                                Text(
                                    "* If the LLM is able to, potentially recommend treatment for diagnosis and important notes"),
                              ],
                            ),
                          ),
                        )
                      ],
                    ))
              ],
            )),
      ),

      // Red navigation buttons
      Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(50),
            child: RedActionButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ResultsExplanationPage(),
                  )),
              label: "Continue to Explanation",
              iconData: Icons.arrow_forward,
              iconSize: mediumIconSize,
              useCircleAvatar: true,
              size: mediumButtonSizeLong,
            ),
          )),

      // Chatbot and help buttons
      const Positioned(right: 30.0, top: 50.0, child: ChatBotButton()),
      const Positioned(right: 21.0, bottom: 70.0, child: HelpButton()),
    ]);
  }
}
