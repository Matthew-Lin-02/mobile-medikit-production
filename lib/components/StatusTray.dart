import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:comp30022/pages/PatientProfile.dart';
import 'package:comp30022/color.dart';
import 'package:comp30022/components/StandaloneFunctions.dart';

class StatusTray extends StatelessWidget {
  final iconSize = 50.0;

  StatusTray({super.key});

  @override
  Widget build(BuildContext context) {
    final currentRoute = ModalRoute.of(context)?.settings.name;
    final GlobalKey wifiKey = GlobalKey();

    return IntrinsicWidth(
      child: IntrinsicHeight(
        child: Container(
          padding: const EdgeInsets.only(left: 2.0),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 5, 161, 182),
            borderRadius: BorderRadius.circular(80.0),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              StatusIcon(
                key: wifiKey,
                iconSize: iconSize,
                image: 'assets/images/wifi-connection.png',
                onPressed: () {
                  showCustomModal(context, WifiInfo(parentKey: wifiKey));
                },
              ),
              StatusIcon(
                iconSize: iconSize,
                image: 'assets/images/globe.png',
                onPressed: () {
                  showCustomModal(context, MachineTranslationOverlay());
                },
              ),
              StatusIcon(
                  iconSize: iconSize,
                  image: 'assets/images/person-outline.png',
                  onPressed: () {
                    if (currentRoute != '/patientProfile') {
                      Navigator.pushNamed(context, '/patientProfile');
                    }
                  }),
              StatusIcon(
                iconSize: iconSize,
                image: 'assets/images/settings.png',
              ),
              StatusIcon(
                iconSize: iconSize,
                image: 'assets/images/phone.png',
                onPressed: () {
                  showCustomModal(context, ContactHealthExpertWidget());
                },
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: StatusIcon(
                    iconSize: iconSize, image: 'assets/images/ambulance.png'),
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
    return SizedBox(
      height: iconSize,
      width: iconSize,
      child: IconButton(
          onPressed: onPressed ?? () {},
          icon: Image.asset(image),
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
          style: const ButtonStyle(overlayColor: WidgetStateColor.transparent)),
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
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  topLeft: Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.25),
                                  offset: Offset(0, 4),
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
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 70.0, top: 25),
                                  child: Text(
                                    'Enter English text',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 32.0,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Container(
                                    margin:
                                        EdgeInsets.only(bottom: 30, left: 40),
                                    transform:
                                        Matrix4.diagonal3Values(1.2, 1.2, 1.0),
                                    child: FloatingActionButton(
                                        shape: CircleBorder(),
                                        onPressed: () {
                                          // Handle speaker action
                                        },
                                        backgroundColor: AppColors
                                            .machineTranslationOverlayBlueButton,
                                        child: Icon(Icons.mic_none_outlined,
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
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(10),
                                  topRight: Radius.circular(10)),
                              color:
                                  AppColors.machineTranslationOverlayRightCream,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.25),
                                  offset: Offset(0, 4),
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
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 70.0, top: 25),
                                  child: Text(
                                    'Martu Wangka translation',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 32.0,
                                    ),
                                  ),
                                ),
                                Align(
                                    alignment: Alignment.bottomRight,
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          bottom: 30, right: 40),
                                      transform: Matrix4.diagonal3Values(
                                          1.2, 1.2, 1.0),
                                      child: FloatingActionButton(
                                        shape: CircleBorder(),
                                        onPressed: () {
                                          // Handle speaker action
                                        },
                                        backgroundColor: AppColors
                                            .machineTranslationOverlayBlueButton,
                                        child: Icon(Icons.volume_up, size: 30),
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
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    offset: Offset(0, 4), // Slight downward offset
                    blurRadius:
                        8, // Increase blur to make the shadow more noticeable
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 300,
                    child: Text(
                      'English',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 38,
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
                  Container(
                    width: 300,
                    child: Text(
                      'Martu Wangka',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 40,
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
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      width: 1200,
      height: 460,
      decoration: BoxDecoration(
        color: Color(0xFFFDF1E6), // Background color of the card
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              'Contact a Health Expert',
              style: TextStyle(
                fontSize: 35,
              ),
            ),
          ),
          SizedBox(height: 5),
          Row(
            children: [
              Expanded(
                child: Text(
                  'AVAILABLE STAFF',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black.withOpacity(0.6),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  'Name',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black.withOpacity(0.6),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  'Position',
                  style: TextStyle(
                      fontSize: 24, color: Colors.black.withOpacity(0.6)),
                ),
              ),
              SizedBox(width: 318) // to align the button to the right
            ],
          ),
          SizedBox(height: 20),
          Divider(),
          _buildStaffTile(
            context,
            'Dr. Health Expert 1',
            'General Practitioner',
          ),
          Divider(),
          _buildStaffTile(
            context,
            'AHW 1',
            'Aboriginal Health Worker',
          ),
          Divider(),
          SizedBox(height: 17),
          GestureDetector(
            onTap: () {
              // Handle "View Unavailable Staff" action
            },
            child: Center(
              child: Text(
                'View Unavailable Staff..',
                style: TextStyle(
                  fontSize: 24,
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
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    position,
                    style: TextStyle(
                      fontSize: 24,
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
              padding: EdgeInsets.all(20),
              backgroundColor: Color(0xFF00B3A4), // Color for the button
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(14), // Adjust the radius here
              ),
            ),
            child: Row(
              mainAxisSize:
                  MainAxisSize.min, // Shrink the button to fit its content
              children: <Widget>[
                Text(
                  'Call Using Webex',
                  style: TextStyle(color: Colors.white, fontSize: 24),
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
          SizedBox(width: 30),
        ],
      ),
    );
  }
}

class WifiInfo extends StatelessWidget {
  final GlobalKey parentKey;

  const WifiInfo({required this.parentKey});

  @override
  Widget build(BuildContext context) {
    final RenderBox renderBox =
        parentKey.currentContext?.findRenderObject() as RenderBox;
    final Offset position = renderBox.localToGlobal(Offset.zero);
    final size = renderBox.size;

    return Stack(children: [
      Positioned(
          left: position.dx,
          top: position.dy,
          child: Container(
              padding: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 5, 161, 182),
                borderRadius: BorderRadius.circular(80.0),
              ),
              child: Column(children: [
                Text("Good Connection"),
                Text("Connected to 4G Cellular Network"),
              ])))
    ]);
  }
}
