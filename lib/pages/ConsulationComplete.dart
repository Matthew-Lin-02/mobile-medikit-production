import 'package:comp30022/color.dart';
import 'package:comp30022/components/RedActionButton.dart';
import 'package:comp30022/font.dart';
import 'package:comp30022/pages/yarning/HomeScreen.dart';
import 'package:comp30022/pages/yarning/SignIn.dart';
import 'package:flutter/material.dart';

class ConsulationComplete extends StatelessWidget {
  const ConsulationComplete({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Spacer(flex: 2),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Consultation Complete ",
                style: TextStyle(fontSize: largeHeadingFontSize),
              ),
              Icon(
                Icons.check_circle_outline,
                size: 120,
                color: AppColors.red,
              ),
            ],
          ),
          const Spacer(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Kangaroo footprints

              Transform.rotate(
                angle: 36 * 3.14 / 180,
                child: Image(
                    width: screenWidth * 0.15,
                    height: screenHeight * 0.15,
                    image: const AssetImage(
                        'assets/images/art/small-symbols/kangaroo-footprint.png')),
              ),
              Transform.rotate(
                angle: 36 * 3.14 / 180,
                child: Image(
                    width: screenWidth * 0.15,
                    height: screenHeight * 0.15,
                    image: const AssetImage(
                        'assets/images/art/small-symbols/kangaroo-footprint.png')),
              ),
              Transform.rotate(
                angle: 36 * 3.14 / 180,
                child: Image(
                    width: screenWidth * 0.15,
                    height: screenHeight * 0.15,
                    image: const AssetImage(
                        'assets/images/art/small-symbols/kangaroo-footprint.png')),
              ),

              // Kangaroo
              Image(
                  width: screenWidth * 0.4,
                  height: screenHeight * 0.4,
                  image: const AssetImage(
                      'assets/images/art/x-ray-animals/x-ray-kangaroo.png')),
            ],
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Spacer(flex: 3),
              RedActionButton(
                iconData: Icons.arrow_forward,
                label: "Next Patient",
                size: mediumButtonSize,
                fontSize: largeFontSize,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                },
              ),
              const Spacer(),
              RedActionButton(
                iconData: Icons.cancel,
                label: "Logout",
                size: mediumButtonSize,
                fontSize: largeFontSize,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignIn()),
                  );
                },
              ),
              const Spacer(flex: 3),
            ],
          ),
          const Spacer(flex: 2),
        ]),
      ),
    );
  }
}
