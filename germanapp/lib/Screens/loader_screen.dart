import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:germanapp/components/text_component.dart';
import 'package:germanapp/constants/assets/assets_constants.dart';
import 'package:germanapp/constants/colors/colors_constants.dart';
import 'package:germanapp/constants/styles/font_styles_constants.dart';

class Loader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width ;
    var height=MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
             gradient: LinearGradient(colors: [
               ColorConstant.lightBlue,ColorConstant.green
             ],
                  begin:Alignment.bottomRight+Alignment.topRight,
               end: Alignment.bottomLeft,

             ),
          
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Transform.translate(
                  offset: Offset(105,20),
                  child: TextComponent(text: 'TM',textStyle: FontStyles.fontMedium(color: ColorConstant.white),)),
              Image.asset(AssetConstant.logo,color: ColorConstant.white,width:width/2 ,),
            ],
          ),
        ),
      ),
    );
  }
}
