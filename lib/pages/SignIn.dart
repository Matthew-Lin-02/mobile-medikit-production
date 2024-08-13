import 'package:flutter/material.dart';
import 'package:comp30022/color.dart';

import 'package:comp30022/components/CustomInputFields.dart';
import 'package:comp30022/components/RedActionButton.dart';

const double VERTICAL_SPACING_BIG = 50;

class SignIn extends StatelessWidget {
  const SignIn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.cream, // Matching cream background color
        child: const Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 300), // Increase the horizontal padding value
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Healthy Connections",
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: AppColors.turquoise,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                Text(
                  "Medi-Kit",
                  style: TextStyle(
                    fontSize: 70,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                ),

                SizedBox(height: VERTICAL_SPACING_BIG), // Vertical spacing
                CustomTextField(
                  hintText: 'Username',
                  fontSize: 18.0,
                ),

                SizedBox(height: 50), // Vertical spacing
                CustomTextField(
                  hintText: 'Password',
                  fontSize: 18.0,
                ),

                SizedBox(height: VERTICAL_SPACING_BIG), // Vertical spacing
                RedActionButton(label: "Sign In"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
