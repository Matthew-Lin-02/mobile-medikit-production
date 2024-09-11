import 'package:comp30022/pages/MentalHealthCheck.dart';
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
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 300), // Increase the horizontal padding value
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Healthy Connections",
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: AppColors.turquoise,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const Text(
                  "Medi-Kit",
                  style: TextStyle(
                    fontSize: 70,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                ),

                const SizedBox(
                    height: VERTICAL_SPACING_BIG), // Vertical spacing
                const TextBox(
                  hintText: 'Username',
                  fontSize: 24.0,
                ),

                const SizedBox(height: 50), // Vertical spacing
                const TextBox(
                  hintText: 'Password',
                  fontSize: 24.0,
                ),

                const SizedBox(
                    height: VERTICAL_SPACING_BIG), // Vertical spacing
                RedActionButton(
                  label: "Sign In",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Page2()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
