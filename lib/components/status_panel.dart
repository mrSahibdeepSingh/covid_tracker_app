import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StatusPanel extends StatelessWidget {
  const StatusPanel(
      {Key? key,
      required this.title,
      required this.count,
      required this.panelColor,
      required this.textColor})
      : super(key: key);

  final String title, count;
  final Color panelColor, textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: panelColor,
      ),
      height: 80,
      width: double.infinity / 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: GoogleFonts.montserrat(
              textStyle: TextStyle(
                  color: textColor, fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            count,
            style: GoogleFonts.montserrat(
              textStyle: TextStyle(
                  color: textColor, fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
