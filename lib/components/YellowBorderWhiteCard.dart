import 'package:flutter/material.dart';
import 'package:comp30022/color.dart';
import 'package:comp30022/components/BaseCustomCard.dart';

class YellowBorderWhiteCard extends BaseCustomCard {
  const YellowBorderWhiteCard({
    super.key,
    super.child,
    bool? isShadowOn,
    super.width,
    super.height,
    double super.borderWidth = 6.0,
    super.borderRadius,
  }) : super(
          borderColor: AppColors.yellowCream, // Yellow border color
          backgroundColor: Colors.white, // White background
          isShadowOn: isShadowOn ?? true,
        );
}
