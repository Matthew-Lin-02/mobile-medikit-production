import 'package:flutter/material.dart';
import 'package:comp30022/color.dart';
import 'package:comp30022/components/BaseCustomCard.dart';

class YellowBorderWhiteCard extends BaseCustomCard {
  const YellowBorderWhiteCard({
    Key? key,
    Widget? widget,
    bool? isShadowOn,
    double? width,
    double? height,
    double borderWidth = 6.0,
    double borderRadius = 16.0,
  }) : super(
          key: key,
          child: widget,
          borderColor: AppColors.yellowCream, // Yellow border color
          backgroundColor: Colors.white, // White background
          isShadowOn: isShadowOn ?? true,
          width: width, // Pass width to base class
          height: height, // Pass height to base class
          borderWidth: borderWidth,
          borderRadius: borderRadius,
        );
}
