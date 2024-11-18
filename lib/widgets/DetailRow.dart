import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailRow extends StatelessWidget {
  final String icon;
  final String title;
  final String value;
  double? padTop;
  double? padBottom;

  DetailRow(
      {Key? key,
      required this.icon,
      required this.title,
      required this.value,
      this.padTop,
      this.padBottom})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: padBottom ?? 0.0, top: padTop ?? 0),
      child: Row(
        children: [
          Center(
              child: Image.asset(
            icon,
            width: 14,
            height: 14,
          )),
          const SizedBox(
            width: 8,
          ),
          SizedBox(
            width: 130,
            child: Row(
              children: [
                SizedBox(
                  width: 104,
                  child: Text(
                    title,
                    style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF6B7280)),
                  ),
                ),
                Text(
                  ':',
                  style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF3A434C)),
                ),
              ],
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              overflow: TextOverflow.visible,
            ),
          ),
        ],
      ),
    );
  }
}
