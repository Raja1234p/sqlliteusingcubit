import 'package:flutter/material.dart';

class TextComponent extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  const TextComponent({Key? key, required this.text, this.color=Colors.black38, this.fontSize=16, this.fontWeight=FontWeight.bold, this.textAlign=TextAlign.center}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(text,style: TextStyle(color: color,fontSize: fontSize,fontWeight: fontWeight),
    textAlign:textAlign ,
    );
  }
}
