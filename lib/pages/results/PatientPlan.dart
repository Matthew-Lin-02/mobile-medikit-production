import 'package:comp30022/color.dart';
import 'package:comp30022/components/ChatbotButton.dart';
import 'package:comp30022/components/DarkGreenBorderGreenCard.dart';
import 'package:comp30022/components/RedActionButton.dart';
import 'package:comp30022/components/YellowBorderWhiteCard.dart';
import 'package:comp30022/font.dart';
import 'package:flutter/material.dart';
import 'package:comp30022/pages/AbstractConsultationPage.dart';

Builder patientPlanBody = Builder(builder: (context) {
  return const Stack(
    children: [
      Positioned(child: PatientPlanMainContent()),
      Positioned(right: 30.0, top: 50.0, child: ChatBotButton()),
      Positioned(
          bottom: 0,
          child:
              Image(image: AssetImage('assets/images/art/footer-strip.png'))),
    ],
  );
});

class PatientPlanPage extends StatelessWidget {
  const PatientPlanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AbstractConsultationPage(
      title: "Patient Plan",
      pageNum: 8,
      body: patientPlanBody,
    );
  }
}

class PatientPlanMainContent extends StatelessWidget {
  const PatientPlanMainContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
        child: FractionallySizedBox(
            widthFactor: 0.8,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Spacer(),
                  const Row(children: [
                    Spacer(flex: 7),
                    Text(
                      'Follow-up Appointment',
                      style:
                          TextStyle(height: 1.5, fontSize: subHeadingFontSize),
                    ),
                    Spacer(flex: 4),
                    Text(
                      'Yanama!\n"Keep on going!"',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: mediumFontSize,
                          color: AppColors.fadedGrey,
                          fontStyle: FontStyle.italic),
                    )
                  ]),
                  Spacer(),
                  YellowBorderWhiteCard(
                      child: Padding(
                          padding: EdgeInsets.all(15),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const CheckboxTick(),
                                    const Text(
                                      'General Practitioner Booking',
                                      style: TextStyle(fontSize: largeFontSize),
                                    ),
                                  ],
                                ),
                                RedActionButton(
                                  size: mediumButtonSizeShort,
                                  label: 'Select a date',
                                  iconSize: mediumIconSize,
                                  iconData: Icons.calendar_month,
                                )
                              ]))),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Flexible(
                          flex: 10,
                          child: FractionallySizedBox(
                              widthFactor: 0.95,
                              child: Column(children: [
                                Text(
                                  'Selected Recommendations',
                                  style: TextStyle(
                                      fontSize: extraLargeFontSize,
                                      height: 1.5),
                                ),
                                //TODO: Use selected reccomendations from follow-up page
                                DarkGreenBorderGreenCard(
                                    borderRadius: 30,
                                    child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 15, vertical: 20),
                                        child: Text(
                                          'Add a cup of frozen veggies to your meal. Balanced eating helps heal the heart.',
                                          style: TextStyle(
                                              fontSize: largeFontSize,
                                              height: 1.5,
                                              color: Colors.white),
                                        ))),
                                SizedBox(height: 20),
                                DarkGreenBorderGreenCard(
                                    borderRadius: 30,
                                    child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 15, vertical: 20),
                                        child: Text(
                                            'Have a bushwalk with family, lookout for goanna and emu eggs.',
                                            style: TextStyle(
                                                fontSize: largeFontSize,
                                                height: 1.5,
                                                color: Colors.white))))
                              ]))),
                      const Spacer(flex: 2),
                      Flexible(
                          flex: 3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Text('QR Code to App',
                                  style: TextStyle(
                                      fontSize: largeFontSize, height: 1.5)),
                              Container(
                                  width: 280,
                                  child: const Text(
                                    'The companion app will help the patient with adhering to their plan.',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: extraSmallFontSize,
                                        fontWeight: FontWeight.w500),
                                  )),
                              Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black, width: 2)),
                                  child: Image.asset(
                                      'assets/images/results/qr-code.png'))
                            ],
                          ))
                    ],
                  ),
                  const Spacer(flex: 1),
                  RedActionButton(
                    size: largeButtonSizeCompact,
                    iconSize: mediumIconSize,
                    label: 'Submit Patient Plan and Generate Medical Report',
                    iconData: Icons.check_circle,
                  ),
                  const Spacer(flex: 3)
                ])));
  }
}

class CheckboxTick extends StatefulWidget {
  const CheckboxTick({super.key});

  @override
  State<StatefulWidget> createState() => _CheckboxTickState();
}

class _CheckboxTickState extends State<CheckboxTick> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      checkColor: Colors.white,
      activeColor: Colors.black,
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
    );
  }
}
