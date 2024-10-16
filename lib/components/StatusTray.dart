import 'package:flutter/material.dart';
import 'package:comp30022/color.dart';
import 'package:comp30022/components/StandaloneFunctions.dart';
import 'package:comp30022/font.dart';

const double translationFontSize = 32.0;

class StatusTray extends StatelessWidget {
  final iconSize = 50.0;

  const StatusTray({super.key});

  @override
  Widget build(BuildContext context) {
    final currentRoute = ModalRoute.of(context)?.settings.name;
    final GlobalKey wifiKey = GlobalKey();

    return IntrinsicWidth(
      child: IntrinsicHeight(
        child: Container(
          padding: const EdgeInsets.only(left: 8.0),
          decoration: BoxDecoration(
            color: AppColors.turquoise,
            borderRadius: BorderRadius.circular(80.0),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                  child: StatusIcon(
                key: wifiKey,
                iconSize: iconSize,
                image: 'assets/images/status-tray/wifi_figma.png',
                onPressed: () {
                  showCustomModal(context, WifiInfo(parentKey: wifiKey));
                },
              )),
              Expanded(
                  child: StatusIcon(
                iconSize: iconSize,
                image: 'assets/images/status-tray/globe_figma.png',
                onPressed: () {
                  showCustomModal(context, const MachineTranslationOverlay());
                },
              )),
              Expanded(
                  child: StatusIcon(
                      iconSize: iconSize,
                      image: 'assets/images/status-tray/person_figma.png',
                      onPressed: () {
                        if (currentRoute != '/patientProfile') {
                          Navigator.pushNamed(context, '/patientProfile');
                        }
                      })),
              Expanded(
                  child: StatusIcon(
                iconSize: iconSize,
                image: 'assets/images/status-tray/settings_figma.png',
              )),
              Expanded(
                  child: StatusIcon(
                iconSize: iconSize,
                image: 'assets/images/status-tray/phone_figma.png',
                onPressed: () {
                  showCustomModal(context, const ContactHealthExpertWidget());
                },
              )),
              Expanded(
                child: Container(
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.zero,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(80.0),
                  ),
                  child: StatusIcon(
                      iconSize: iconSize,
                      image: 'assets/images/status-tray/ambulance_figma.png'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StatusIcon extends StatelessWidget {
  const StatusIcon(
      {super.key,
      this.debugStatement = "Button Pressed",
      required this.iconSize,
      required this.image,
      this.onPressed});

  final String debugStatement;
  final double iconSize;
  final String image;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed ?? () {},
      icon: Image.asset(image),
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
      style: const ButtonStyle(overlayColor: WidgetStateColor.transparent),
    );
  }
}

class MachineTranslationOverlay extends StatelessWidget {
  const MachineTranslationOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1536,
      height: 682,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Positioned(
            child: Padding(
              padding: const EdgeInsets.only(top: 92),
              child: Column(
                children: [
                  // Translation Panels with Shadows
                  Expanded(
                    child: Row(
                      children: [
                        // English Input Panel with Shadow
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color:
                                  AppColors.machineTranslationOverlayLeftCream,
                              borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  topLeft: Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.25),
                                  offset: const Offset(0, 4),
                                  blurRadius:
                                      8, // Match blur radius for consistency
                                ),
                              ],
                            ),
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 70.0, top: 25),
                                  child: Text(
                                    'Enter English text',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: translationFontSize,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                        bottom: 30, left: 40),
                                    transform:
                                        Matrix4.diagonal3Values(1.2, 1.2, 1.0),
                                    child: FloatingActionButton(
                                        shape: const CircleBorder(),
                                        onPressed: () {
                                          // Handle speaker action
                                        },
                                        backgroundColor: AppColors
                                            .machineTranslationOverlayBlueButton,
                                        child: const Icon(
                                            Icons.mic_none_outlined,
                                            size: 35)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        // Martu Wangka Output Panel with Shadow
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                  bottomRight: Radius.circular(10),
                                  topRight: Radius.circular(10)),
                              color:
                                  AppColors.machineTranslationOverlayRightCream,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.25),
                                  offset: const Offset(0, 4),
                                  blurRadius:
                                      8, // Match blur radius for consistency
                                ),
                              ],
                            ),
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 70.0, top: 25),
                                  child: Text(
                                    'Martu Wangka translation',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: translationFontSize,
                                    ),
                                  ),
                                ),
                                Align(
                                    alignment: Alignment.bottomRight,
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                          bottom: 30, right: 40),
                                      transform: Matrix4.diagonal3Values(
                                          1.2, 1.2, 1.0),
                                      child: FloatingActionButton(
                                        shape: const CircleBorder(),
                                        onPressed: () {
                                          // Handle speaker action
                                        },
                                        backgroundColor: AppColors
                                            .machineTranslationOverlayBlueButton,
                                        child: const Icon(Icons.volume_up,
                                            size: 30),
                                      ),
                                    ))
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Header with Shadow
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 92,
              decoration: BoxDecoration(
                color: AppColors.machineTranslationOverlayRed,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    offset: const Offset(0, 4), // Slight downward offset
                    blurRadius:
                        8, // Increase blur to make the shadow more noticeable
                  ),
                ],
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 300,
                    child: Text(
                      'English',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: extraLargeFontSize,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.swap_horiz,
                    color: Colors.black,
                    size: 50,
                  ),
                  SizedBox(
                    width: 300,
                    child: Text(
                      'Martu Wangka',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: extraLargeFontSize,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
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

class ContactHealthExpertWidget extends StatelessWidget {
  const ContactHealthExpertWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      width: 1200,
      height: 460,
      decoration: BoxDecoration(
        color: const Color(0xFFFDF1E6), // Background color of the card
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Text(
              'Contact a Health Expert',
              style: TextStyle(
                fontSize: largeFontSize,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              Expanded(
                child: Text(
                  'AVAILABLE STAFF',
                  style: TextStyle(
                    fontSize: mediumFontSize,
                    color: Colors.black.withOpacity(0.6),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  'Name',
                  style: TextStyle(
                    fontSize: mediumFontSize,
                    color: Colors.black.withOpacity(0.6),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  'Position',
                  style: TextStyle(
                      fontSize: mediumFontSize,
                      color: Colors.black.withOpacity(0.6)),
                ),
              ),
              const SizedBox(width: 318) // to align the button to the right
            ],
          ),
          const SizedBox(height: 20),
          const Divider(),
          _buildStaffTile(
            context,
            'Dr. Health Expert 1',
            'General Practitioner',
          ),
          const Divider(),
          _buildStaffTile(
            context,
            'AHW 1',
            'Aboriginal Health Worker',
          ),
          const Divider(),
          const SizedBox(height: 17),
          GestureDetector(
            onTap: () {
              // Handle "View Unavailable Staff" action
            },
            child: const Center(
              child: Text(
                'View Unavailable Staff..',
                style: TextStyle(
                  fontSize: mediumFontSize,
                  color: Colors.grey,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStaffTile(BuildContext context, String name, String position) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    name,
                    style: const TextStyle(
                      fontSize: mediumFontSize,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    position,
                    style: const TextStyle(
                      fontSize: mediumFontSize,
                    ),
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Handle Webex call action
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(20),
              backgroundColor: const Color(0xFF00B3A4), // Color for the button
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(14), // Adjust the radius here
              ),
            ),
            child: const Row(
              mainAxisSize:
                  MainAxisSize.min, // Shrink the button to fit its content
              children: <Widget>[
                Text(
                  'Call Using Webex',
                  style:
                      TextStyle(color: Colors.white, fontSize: mediumFontSize),
                ),
                SizedBox(width: 16), // Space between the text and the icon
                Icon(
                  Icons.phone_in_talk_outlined,
                  color: Colors.white, // Ensure the icon is white
                  size: 40,
                ),
              ],
            ),
          ),
          const SizedBox(width: 30),
        ],
      ),
    );
  }
}

class WifiInfo extends StatelessWidget {
  final GlobalKey parentKey;

  const WifiInfo({super.key, required this.parentKey});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Row(children: [
      const Spacer(flex: 177),
      Column(children: [
        const Spacer(
          flex: 1,
        ),
        Container(
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
                color: AppColors.wifiInfoOverlayBlue,
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  )
                ]),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "Good Connection",
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.0083,
                    color: AppColors.wifiInfoTextGreen),
              ),
              Text("Connected to 4G Cellular\nNetwork",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.0073,
                      color: Colors.white)),
            ])),
        CustomPaint(
          size: Size(screenSize.width / 60, screenSize.height / 100),
          painter: TrianglePainter(),
        ),
        const Spacer(
          flex: 75,
        ),
      ]),
      const Spacer(
        flex: 64,
      )
    ]);
  }
}

class TrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = AppColors.wifiInfoOverlayBlue
      ..strokeWidth = 4
      ..style = PaintingStyle.fill;

    var path = Path();

    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width / 2, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
