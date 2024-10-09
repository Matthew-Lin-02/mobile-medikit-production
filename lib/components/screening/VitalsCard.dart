import 'package:comp30022/components/YellowBorderWhiteCard.dart';
import 'package:flutter/material.dart';
import 'package:comp30022/font.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

const double largerFontSize = 34;

class VitalsCard extends StatelessWidget {
  const VitalsCard({
    super.key,
    required this.heading,
    required this.hintText,
  });

  final String heading;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return YellowBorderWhiteCard(
      width: 350,
      height: 325,
      isShadowOn: true,
      child: Column(
        children: [
          const Expanded(flex: 2, child: SizedBox.shrink()),
          Expanded(
            flex: 8,
            child: Text(
              heading,
              style: GoogleFonts.inter(
                  fontSize: largerFontSize, fontWeight: FontWeight.w700),
            ),
          ),
          TextField(
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            inputFormatters: <TextInputFormatter>[
              MyFormatter.allow(RegExp(r'^\d{0,2}(\.\d*)?$')),
              LengthLimitingTextInputFormatter(
                  12), // Limits total input length to 12 characters
            ],
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
                fontSize: extraLargeFontSize, fontWeight: FontWeight.w500),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: GoogleFonts.inter(
                fontSize: extraLargeFontSize,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              border: InputBorder.none,
            ),
          ),
          const FractionallySizedBox(
            widthFactor: 0.8,
            child: Divider(
              color: Colors.black,
            ),
          ),
          const Expanded(flex: 5, child: SizedBox.shrink()),
        ],
      ),
    );
  }
}

class MyFormatter extends FilteringTextInputFormatter {
  MyFormatter.allow(super.filterPattern) : super.allow();

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final updatedValue = super.formatEditUpdate(oldValue, newValue);

    return updatedValue.text.isEmpty && newValue.text.isNotEmpty
        ? oldValue
        : updatedValue;
  }
}
