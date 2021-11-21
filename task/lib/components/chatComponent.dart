import 'package:flutter/material.dart';
import 'package:task/components/text_component.dart';

class ChatComponent extends StatelessWidget {
  final Color color;
  final String text;
  final Color textColor;

  const ChatComponent({Key? key, this.color=Colors.white,this.text='',this.textColor=Colors.white}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width/1.7,
      padding: EdgeInsets.symmetric(vertical: 17,horizontal: 10),
      child: TextComponent(text:text ,color: textColor,fontSize: 15,textAlign: TextAlign.start,),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(15),bottomRight: Radius.circular(15)),
        color: color,
        boxShadow:  [
          BoxShadow(
            color: Colors.black45.withOpacity(0.7),
            spreadRadius: 2,
            blurRadius: 2,

            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
    );
  }
}
