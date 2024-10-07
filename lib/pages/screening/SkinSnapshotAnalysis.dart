import 'package:flutter/material.dart';
import 'package:comp30022/color.dart';
import 'package:comp30022/components/RedActionButton.dart';
import 'package:comp30022/components/StandaloneFunctions.dart';
import 'package:comp30022/components/screening/Snapshot.dart';
import 'package:comp30022/components/BaseCustomCard.dart';
import 'package:comp30022/components/HelpButton.dart';

class SkinSnapshotAnalysis extends StatelessWidget {
  const SkinSnapshotAnalysis({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    // Get screen width and height
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Stack(
      alignment: Alignment.center,
      children: [
        Image(
          image: const AssetImage('assets/images/screening-tools/skin.png'),
          width: screenWidth * 0.5,
          height: screenWidth * 0.5,
        ),
        Image(
          image: const AssetImage(
              'assets/images/screening-tools/images_border.png'),
          width: screenWidth * 0.5,
          height: screenWidth * 0.5,
        ),
        Positioned(
            bottom: 100,
            child: CameraIcon(
                iconData: Icons.camera_alt,
                iconSize: largeIconSize,
                onPressed: () {
                  showCustomModal(context, const SkinSnapshotOverlay());
                })),
        Positioned(
            top: 150,
            left: 50,
            child: RedActionButton(
                label: "Back to Screening Tools",
                iconData: Icons.arrow_back,
                size: mediumButtonSizeLong,
                onPressed: () {
                  Navigator.pop(context);
                })),
        Positioned(
          top: 50,
          right: 125,
          child: Image(
              width: screenWidth * 0.2,
              height: screenHeight * 0.35,
              image:
                  const AssetImage('assets/images/art/big-symbols/fish.png')),
        ),
        Positioned(
          bottom: 125,
          left: 100,
          child: Image(
              width: screenWidth * 0.2,
              height: screenHeight * 0.35,
              image: const AssetImage(
                  'assets/images/art/big-symbols/goanna-circle.png')),
        ),
        const Positioned(
            right: 21.0, bottom: 70.0, child: HelpButton(pageName: 'Skin')),
      ],
    );
  }
}

class SkinSnapshotOverlay extends StatelessWidget {
  const SkinSnapshotOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return BaseCustomCard(
      borderColor: AppColors.cream,
      backgroundColor: AppColors.cream,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 10),
          Image(
            image: const AssetImage('assets/images/screening-tools/skin.png'),
            width: screenWidth * 0.4,
            height: screenHeight * 0.5,
          ),
          RedActionButton(
              label: "Submit Snapshot",
              size: mediumButtonSizeShort,
              onPressed: () {
                Navigator.pop(context);
                showCustomModal(context, const SnapshotSubmitted());
              }),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
