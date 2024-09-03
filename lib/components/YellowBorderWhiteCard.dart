import 'package:flutter/material.dart';
import 'package:comp30022/color.dart';

class YellowBorderWhiteCard extends StatelessWidget {
  final Widget? widget;
  final bool? isShadowOn;
  final double width;
  final double height;
  const YellowBorderWhiteCard({
    super.key,
    this.widget,
    this.isShadowOn,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: AppColors.yellowCream,
          boxShadow: isShadowOn != null
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    offset: Offset(0, 4),
                    blurRadius: 4, // Match blur radius for consistency
                  ),
                ]
              : null),
      child: Card(
        elevation: 0,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: widget ?? const SizedBox.shrink(),
      ),
    );
  }
}
