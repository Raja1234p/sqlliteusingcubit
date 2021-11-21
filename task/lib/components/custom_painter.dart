import 'dart:ui';

import 'package:flutter/cupertino.dart';

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    Path path_0 = Path();
    path_0.moveTo(size.width*0.08988235,size.height*0.05318182);
    path_0.lineTo(size.width*0.7010588,size.height*0.05318182);
    path_0.lineTo(size.width*0.7010588,size.height*0.1832727);
    path_0.lineTo(size.width*0.2282353,size.height*0.3953636);
    path_0.cubicTo(size.width*0.1929412,size.height*0.4140909,size.width*0.1809412,size.height*0.4177273,size.width*0.1636471,size.height*0.3951818);
    path_0.lineTo(size.width*0.08988235,size.height*0.2939091);
    path_0.lineTo(size.width*0.08988235,size.height*0.05318182);
    path_0.close();

    Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
    paint_0_fill.color = Color(0xff605D5C).withOpacity(1.0);
    canvas.drawPath(path_0,paint_0_fill);

    Path path_1 = Path();
    path_1.moveTo(size.width*0.08988235,size.height*0.05318182);
    path_1.lineTo(size.width*0.7010588,size.height*0.05318182);
    path_1.lineTo(size.width*0.7010588,size.height*0.1824545);
    path_1.lineTo(size.width*0.2282353,size.height*0.3932727);
    path_1.cubicTo(size.width*0.1929412,size.height*0.4119091,size.width*0.1809412,size.height*0.4154545,size.width*0.1636471,size.height*0.3930000);
    path_1.lineTo(size.width*0.08988235,size.height*0.2924545);
    path_1.lineTo(size.width*0.08988235,size.height*0.05318182);
    path_1.close();

    Paint paint_1_fill = Paint()..style=PaintingStyle.fill;
    paint_1_fill.color = Color(0xff0093DD).withOpacity(1.0);
    canvas.drawPath(path_1,paint_1_fill);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}