import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FontStyles {
  //light
  static TextStyle boldFont({
    @required Color color,
    double letterSpacing = 0.0,
    double fontSize = 22.0,
  }) =>
      GoogleFonts.openSans(
          color: color,
          fontWeight: FontWeight.w700,
          fontStyle: FontStyle.normal,
          letterSpacing: letterSpacing,
          fontSize: fontSize);

//bold white title of most screens


  //regular
  static TextStyle fontRegular(
          {@required Color color,
          double letterSpacing = 0.0,
          double fontSize = 12.0,
          bool bold = false,
          bool underLine = false,
          double height}) =>
      GoogleFonts.openSans(
          color: color,
          fontWeight: bold ? FontWeight.bold : FontWeight.w400,
          fontStyle: FontStyle.normal,
          letterSpacing: letterSpacing,
          decoration:
              underLine ? TextDecoration.underline : TextDecoration.none,
          height: height,
          fontSize: fontSize);






  //medium
  static TextStyle fontMedium(
          {@required Color color,
          double letterSpacing = 0.0,
          double fontSize = 11.0,
          bool bold = false,
          FontWeight fontWeight = FontWeight.w700}) =>
      GoogleFonts.openSans(
          color: color,
          letterSpacing: letterSpacing,
          fontWeight: bold ? FontWeight.bold :fontWeight,
          fontSize: fontSize);



  static TextStyle fontSize14(
      {@required Color color,
        double letterSpacing = 0.0,
        double fontSize = 14.0,
        bool bold = false,
        bool underLine = false}) =>
      GoogleFonts.openSans(
          color: color,
          fontWeight: bold ? FontWeight.bold : FontWeight.w400,
          fontStyle: FontStyle.normal,
          letterSpacing: letterSpacing,
          decoration:
          underLine ? TextDecoration.underline : TextDecoration.none,
          fontSize: fontSize);
  //medium







}
