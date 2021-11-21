import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rimattire/components/input_component.dart';
import 'package:rimattire/constants/colors/colors_constants.dart';
import 'package:rimattire/constants/strings/string_constants.dart';

import '../constants/styles/font_styles_constants.dart';
import 'text_component.dart';

class CustomTextFiled extends StatefulWidget {
  @override
  _CustomTextFiledState createState() => _CustomTextFiledState();
}

class _CustomTextFiledState extends State<CustomTextFiled> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Container(
      width: width,
      
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: ColorConstant.brownGrey, width: 1),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(100),
                    bottomLeft: Radius.circular(100)),
                child: 
                Container(
                  padding:EdgeInsets.symmetric(vertical: 20) ,
                  margin: EdgeInsets.symmetric(vertical: 20),
                      width: 48,
                child: Center(child: TextComponent(text: '\$',textStyle: FontStyles.fontMedium(color: ColorConstant.brownGrey,fontSize: 15,fontWeight: FontWeight.w400),)),
                  color: ColorConstant.pink.withOpacity(0.08336730301380157),
                )),
          ),

          Flexible(
            flex: 1,
                      child: TextInputComponent(
              title: StringConstant.price,
              isProductDetailsScreen: true,
            ),
          )
        ],
      ),
    );
  }
}
