import 'package:flutter/material.dart';
import 'package:richardproject/view/constants/color_constants.dart';

class TextHeadings {
  static Widget heading1(String text,
          {TextAlign textAlign = TextAlign.center,
          double textScaleFactor = 1.8,
          Color fontColor = ColorConstants.textHeadingColor,
          double letterSpacing = 0,FontWeight fontWeight=FontWeight.bold}) =>
      Text(text,
          textScaleFactor: textScaleFactor,
          style: TextStyle(
              color: fontColor,
              fontWeight: fontWeight,
              letterSpacing: letterSpacing),
          softWrap: true,
          textAlign: textAlign);

  static Widget heading2(String text,
          {TextAlign textAlign = TextAlign.center,
          double textScaleFactor = 1.3,Color color=ColorConstants.whiteColor,bool isBold=false,double height=1.3}) =>
      Text(text,
          textScaleFactor: textScaleFactor,
//          style: TextStyle(fontWeight: FontWeight.bold),
          softWrap: true,

          style: TextStyle(color: color,fontWeight: isBold?FontWeight.bold:null,height: height),
          textAlign: textAlign);

  static Widget simpleText(String text,
          {TextAlign textAlign = TextAlign.center,
          double textScaleFactor = 1,
          bool isBold = false,
          Color color=ColorConstants.greyColor,
            double height=1.3
          }) =>
      Text(
        text,
        textScaleFactor: textScaleFactor,

        style: TextStyle(
          height: height,
            color: color,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal),
        softWrap: true,
        textAlign: textAlign,
      );
  static underLineText(String text,
          {double textScaleFactor = 0.9, Function onTap,Color color=Colors.blue}) =>
      GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              border:
                  Border(bottom: BorderSide(color: color, width: 1.5))),
          child: Text(
            text,
            textScaleFactor: textScaleFactor,
            style: TextStyle(
                color: color,
                fontWeight: FontWeight.bold,
                decorationThickness: 2),
          ),
        ),
      );
}
