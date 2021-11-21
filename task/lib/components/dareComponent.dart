import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:task/components/text_component.dart';

class DateComponent extends StatelessWidget {
  final Color color;
  final String day;
  final String date;
  final String event;
  final Color textColor;

  const DateComponent({Key? key, this.color=Colors.black38, required this.day, required this.date, required this. event, this.textColor=Colors.white}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 1,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
           padding: EdgeInsets.only(top: 10,bottom:10 ),
            width: MediaQuery.of(context).size.width,
            child:  TextComponent(text: day,color: textColor,fontSize: 20,),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),
              color:color ,
            ),
          ),
          const SizedBox(height: 8,),
          Padding(
            padding: const EdgeInsets.only(left:8.0,right:8),
            child: TextComponent(text: date,fontWeight: FontWeight.normal),
          ),
          const SizedBox(height:5 ,),
          Padding(
            padding: const EdgeInsets.only(left:8.0,right:8,bottom: 5),
            child: TextComponent(text: event,fontWeight: FontWeight.normal,fontSize: 12,),
          ),

        ],
      ),
    );
  }
}
