import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class AppbarComponent extends StatelessWidget {
  final  String text;

  const AppbarComponent({Key? key, required this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:1.0,right:1),
      child: Material(
      elevation: 10,
        shadowColor: Colors.lightBlueAccent.shade700,


        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
          decoration:  BoxDecoration(
            

            border: Border(
              right: const BorderSide(
                color: Colors.blue,
                width: 2.0,

              ),
              top: const BorderSide(
                color: Colors.blue,
                width: 2.0,
                style: BorderStyle.solid

              ),
              bottom: BorderSide(
                color: Colors.blue.withOpacity(0.6),
                width: 3.0,

              ),

            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(Icons.arrow_back_outlined,color: Colors.blue,),
            Text(text,style: const TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 20),),
             const Icon(Icons.menu,color: Colors.blue),
          ],),
        ),
      ),
    );
  }
}
