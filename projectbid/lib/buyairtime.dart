import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:projectbid/customColor.dart';
import 'package:projectbid/form.dart';
import 'package:projectbid/svgiimages.dart';

import 'model_of_buyairtime.dart';
class BuyAirTime extends StatefulWidget {
  final List<BuyAirTimes> terminalNodes ;

  const BuyAirTime({Key key, this.terminalNodes}) : super(key: key);
  @override
  _BuyAirTimeState createState() => _BuyAirTimeState();
}

class _BuyAirTimeState extends State<BuyAirTime> {



  int _add=0;

  @override
  initState() {

  }

  String name;
  String service;
  String phone;

  void passData(String n,String s,String p){
    setState(() {
      name=n;
      service=s;
      phone=p;
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(CustomColors.color('#1e1e1e'),) ,
      appBar: AppBar(
        title: Text('Buy Air Time',style: TextStyle(
          color: Color(CustomColors.color('#FFFFFF'),),fontSize: 25,
          fontWeight: FontWeight.bold,

        ),),
        centerTitle: true,
        backgroundColor: Color(CustomColors.color('#1e1e1e'),),
        elevation: 0,
      ),
floatingActionButton: FloatingActionButton(
  onPressed: (){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>AddNew()));
  },
),
body: SingleChildScrollView(
  child: Container(
    child: Column(
      children: widget.terminalNodes.map((nodes){
return Card(

  child: ListTile(
    leading: SvgPicture.asset(transactionLogo,color: Colors.black,),
    title: Text(nodes.name),
    subtitle: Text(nodes.mobileNumber),
  ),
);
      }).toList(),
    ),
  ),
),

    );  }



}
