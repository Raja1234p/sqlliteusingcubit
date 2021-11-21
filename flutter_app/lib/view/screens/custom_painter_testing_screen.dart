import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
class RPSCustomPainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {



    Paint paint_0 = new Paint()
      ..color = Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;


    Path path_0 = Path();
    path_0.moveTo(size.width*0.0016750,size.height*0.9917000);
    path_0.lineTo(0,0);
    path_0.quadraticBezierTo(size.width*0.3352500,size.height*-0.0042000,size.width*0.4272250,0);
    path_0.cubicTo(size.width*0.4277000,size.height*0.4873000,size.width*0.5720250,size.height*0.4877500,size.width*0.5725375,size.height*0.0033500);
    path_0.quadraticBezierTo(size.width*0.6816000,size.height*0.0008500,size.width,size.height*0.0050000);
    path_0.lineTo(size.width,size.height);
    path_0.lineTo(size.width*0.0032875,size.height*0.9866000);
    path_0.lineTo(size.width*0.0037125,size.height*0.9832500);

    canvas.drawPath(path_0, paint_0);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}


