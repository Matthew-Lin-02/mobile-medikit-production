import 'package:flutter/material.dart';
import 'package:comp30022/color.dart';
import '../../components/RedActionButton.dart';

class ECGResults extends StatelessWidget {
  const ECGResults({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: ListView(children: [
              const Text(
                'Below are the results of the ECG Test',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30),
              ),
              const Text(
                'Patient\'s graph and normal graph for comparison',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24),
              ),
              const FractionallySizedBox(
                  widthFactor: 0.75, child: Divider(color: Colors.black)),
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(children: [
                    const SizedBox(width: 35),
                    Image.asset("assets/images/Normal_ECG.png"),
                    const SizedBox(width: 80)
                  ])),
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(children: [
                    const SizedBox(width: 35),
                    Image.asset("assets/images/Normal_ECG.png"),
                    const SizedBox(width: 80)
                  ])),
              const SizedBox(height: 40),
              const Text(
                'ECG AI Analysis Results',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30),
              ),
              const FractionallySizedBox(
                  widthFactor: 0.75, child: Divider(color: Colors.black)),
              FractionallySizedBox(
                  widthFactor: 0.65,
                  child: TextButton.icon(
                    onPressed: () {},
                    style: ButtonStyle(
                        padding: const WidgetStatePropertyAll(
                            EdgeInsets.only(top: 15)),
                        iconSize: const WidgetStatePropertyAll(70),
                        iconColor: const WidgetStatePropertyAll(Colors.white),
                        backgroundColor: const WidgetStatePropertyAll(
                            AppColors.diagnosticGreen),
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0)))),
                    label: const Text(
                      "Diagnostic Classes",
                      style: TextStyle(color: Colors.white, fontSize: 48),
                    ),
                    icon: const Icon(Icons.touch_app_outlined),
                    iconAlignment: IconAlignment.end,
                  )),
              const SizedBox(height: 100),
              FractionallySizedBox(
                  widthFactor: 0.65,
                  child: TextButton.icon(
                    onPressed: () {},
                    style: ButtonStyle(
                        padding: const WidgetStatePropertyAll(
                            EdgeInsets.only(top: 15)),
                        iconSize: const WidgetStatePropertyAll(70),
                        iconColor: const WidgetStatePropertyAll(Colors.white),
                        backgroundColor: const WidgetStatePropertyAll(
                            AppColors.diagnosticGreen),
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0)))),
                    label: const Text(
                      "Rhythm Classes",
                      style: TextStyle(color: Colors.white, fontSize: 48),
                    ),
                    icon: const Icon(Icons.touch_app_outlined),
                    iconAlignment: IconAlignment.end,
                  )),
              const SizedBox(height: 100)
            ]))
          ]),
      Align(
          alignment: Alignment.bottomCenter,
          child: Container(
              padding: const EdgeInsets.only(top: 10, bottom: 20),
              color: AppColors.cream,
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                RedActionButton(
                  label: "Continue To Patient Education",
                  iconData: Icons.arrow_forward,
                  useCircleAvatar: true,
                  size: const Size(500, 50),
                )
              ]))),
    ]);
  }
}
