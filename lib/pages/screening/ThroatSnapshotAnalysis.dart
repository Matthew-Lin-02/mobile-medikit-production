import 'package:flutter/material.dart';
import 'package:comp30022/components/RedActionButton.dart';

class ThroatSnapshotAnalysis extends StatelessWidget {
  const ThroatSnapshotAnalysis({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center, // Align the images to the top center
      children: [
        const Image(
          image: AssetImage('assets/images/screening-tools/throat.png'),
          width: 550,
          height: 550,
        ),
        const Image(
          image: AssetImage('assets/images/screening-tools/images_border.png'),
          width: 550,
          height: 550,
        ),
        Positioned(
            top: 100,
            left: 50,
            child: RedActionButton(
                label: "Back to Screening Tools",
                iconData: Icons.arrow_back,
                size: mediumButtonSizeLong,
                onPressed: () {
                  Navigator.pop(context);
                })),
        const Positioned(
          top: 150,
          right: 100,
          child: Image(
              width: 400,
              height: 250,
              fit: BoxFit.cover,
              image: AssetImage('assets/images/art/big-symbols/fish.png')),
        ),
        const Positioned(
          bottom: 150,
          left: 100,
          child: Image(
              width: 380,
              height: 380,
              fit: BoxFit.cover,
              image: AssetImage(
                  'assets/images/art/big-symbols/goanna-circle.png')),
        ),
      ],
    );
  }
}

// TODO
// shift images up slightly 
// insert camera red action button
// clicking on camera results in overlay popup
// clicking submit snashot will open another overlay popup