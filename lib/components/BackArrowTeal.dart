import 'package:flutter/material.dart';
import 'package:comp30022/color.dart';

class BackArrowTeal extends StatelessWidget {
  final VoidCallback? onPressed;

  const BackArrowTeal({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 64,
      height: 64,
      decoration: BoxDecoration(
        color: AppColors.turquoise,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: IconButton(
        iconSize: 32,
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: onPressed ??
            () {
              Navigator.pop(context);
            },
      ),
    );
  }
}
