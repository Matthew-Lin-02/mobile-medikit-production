import 'package:comp30022/pages/yarning/MentalHealthCheck.dart';
import 'package:flutter/material.dart';
import 'package:comp30022/color.dart';
import 'package:comp30022/components/CustomInputFields.dart';
import 'package:comp30022/components/RedActionButton.dart';
import 'package:comp30022/font.dart';

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
                const Spacer(flex: 6),
                const Text(
                  "Healthy Connections",
                  style: TextStyle(
                    fontSize: subHeadingFontSize,
                    fontWeight: FontWeight.bold,
                    color: AppColors.turquoise,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const Text(
                  "Medi-Kit",
                  style: TextStyle(
                    fontSize: headingFontSize,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                ),
                const Spacer(flex: 2),
                const TextBox(
                  hintText: 'Username',
                ),
                const Spacer(),
                const TextBox(
                  hintText: 'Password',
                ),
                const Spacer(),
                RedActionButton(
                  label: "Sign In",
                  fontSize: largeFontSize,
                  size: smallButtonSize,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MentalHealthCheck()),
                    );
                  },
                ),
                const Spacer(flex: 6),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
