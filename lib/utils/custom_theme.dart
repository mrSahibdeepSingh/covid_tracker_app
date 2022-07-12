import 'package:covid_tracker_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextTheme customTextTheme() {
  return TextTheme(
    headline1: GoogleFonts.montserrat(
      textStyle: const TextStyle(
          color: appPrimaryColor, fontSize: 35, fontWeight: FontWeight.bold),
    ),
    headline5: GoogleFonts.montserrat(
      textStyle: const TextStyle(color: Colors.black, fontSize: 30),
    ),
    headline6: GoogleFonts.montserrat(
      textStyle: const TextStyle(
          color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
    ),
    headline4: GoogleFonts.montserrat(
      textStyle: const TextStyle(
          color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
    ),

    subtitle1: GoogleFonts.montserrat(
      textStyle: const TextStyle(
          color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
    ),
    subtitle2: GoogleFonts.montserrat(
      textStyle: const TextStyle(
          color: Colors.black, fontSize: 15, fontWeight: FontWeight.w700),
    ),
    bodyText1: GoogleFonts.montserrat(
      textStyle: const TextStyle(
          color: Colors.black, fontSize: 14, fontWeight: FontWeight.w600),
    ),
    bodyText2: GoogleFonts.montserrat(
      textStyle: TextStyle(
          fontSize: 14, color: Colors.orange[900], fontWeight: FontWeight.w600),
    ),
    headline3: GoogleFonts.montserrat(
      textStyle: TextStyle(
          fontSize: 22, color: Colors.orange[900], fontWeight: FontWeight.w600),
    ),
    labelMedium: GoogleFonts.montserrat(
      textStyle: const TextStyle(
          fontSize: 21, color: Colors.black, fontWeight: FontWeight.w600),
    ),
    button: GoogleFonts.montserrat(
      textStyle: const TextStyle(fontSize: 25, color: Colors.white),
    ),
  );
}
