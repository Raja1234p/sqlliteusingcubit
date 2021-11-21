import 'package:flutter/material.dart';
import 'package:task/components/text_component.dart';

class TimeComponent extends StatelessWidget {
  final String time;
  final Color color;
  final Color textColor;

  const TimeComponent({Key? key, required this.time, this.color=Colors.white, this.textColor=Colors.black45}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10),
      child: Center(child: TextComponent(text: time,fontWeight: FontWeight.normal,color: textColor,)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: color,
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
    );
  }
}
