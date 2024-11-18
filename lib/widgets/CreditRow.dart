import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CreditRow extends StatelessWidget {
  String? title;
  String? value;
  double? padTop;

  CreditRow({
    Key? key,
    this.title,
    this.value,
    this.padTop,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: padTop ?? 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title!,
            style: GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF6B7280),
            ),
          ),
          Text(
            value!,
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF191919),
            ),
          ),
        ],
      ),
    );
  }
}
