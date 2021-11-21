import 'package:flutter/material.dart';
import 'package:richardproject/view/constants/color_constants.dart';

class TextHeadings {
  static Widget heading1(String text, {TextAlign textAlign = TextAlign.center, double textScaleFactor = 1.8,Color fontColor = ColorConstants.textHeadingColor}) =>
      Text(text,
          textScaleFactor: textScaleFactor,
          style: TextStyle(
            color: fontColor,
            fontWeight: FontWeight.bold,
          ),
          softWrap: true,
          textAlign: textAlign);

  static Widget heading2(String text, {TextAlign textAlign = TextAlign.center, double textScaleFactor = 1.3}) =>
      Text(text,
          textScaleFactor: textScaleFactor,
//          style: TextStyle(fontWeight: FontWeight.bold),
          softWrap: true,
          textAlign: textAlign);



  static Widget simpleText(String text, {TextAlign textAlign = TextAlign.center, double textScaleFactor = 1.0,bool isBold = false}) => Text(text,
    textScaleFactor: textScaleFactor,
    style: TextStyle(color: ColorConstants.greyColor,fontWeight: isBold?FontWeight.bold:FontWeight.normal),
    softWrap: true,
    textAlign: textAlign,);
  static underLineText(String text,{ double textScaleFactor = 0.9, Function onTap})=>GestureDetector(
    onTap: onTap,
    child: Container(
      decoration: BoxDecoration(border: Border(bottom: BorderSide( color: Colors.blue,width: 1.5))),
      child: Text(
        text,
        textScaleFactor: textScaleFactor,
        style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
            decorationThickness: 2),
      ),
    ),
  );
}
