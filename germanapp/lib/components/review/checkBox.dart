import 'package:circular_check_box/circular_check_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rimattire/components/text_component.dart';
import 'package:rimattire/constants/colors/colors_constants.dart';
import 'package:rimattire/constants/styles/font_styles_constants.dart';

class CheckBox {
  final bool isVerifyOrderScreen;

  CheckBox(this.isVerifyOrderScreen);

  static Widget customCheckBox(
      Function onChanged(bool check), bool checkOrUncheck, String text) {
    return Row(
      children: [
        CircularCheckBox(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          activeColor: ColorConstant.green,
          checkColor: ColorConstant.white,
          onChanged: onChanged,
          value: checkOrUncheck,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 14),
          child: TextComponent(
            text: text,
            textStyle: FontStyles.fontMedium(
                color: ColorConstant.blackTwo,
                fontSize: 12,
                fontWeight: FontWeight.w400),
          ),
        )
      ],
    );
  }

  static Widget customCheckBoxBackButton(
      {String text,
      IconData iconData,
      Function() onpressed,
      bool isCheckUnCkeck,
      Function() onpressedofCheckBox}) {
    return Container(
      padding: EdgeInsets.only(
        left: 23,
      ),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: const Color(0x0d000000),
            offset: Offset(0, 0),
            blurRadius: 11,
            spreadRadius: 5)
      ], borderRadius: BorderRadius.circular(100), color: Colors.white),
      child: Row(
        children: [
          GestureDetector(
            child: isCheckUnCkeck
                ? Container(
                    padding: EdgeInsets.all(1),
                    child: Icon(
                      Icons.check,
                      size: 15,
                      color: ColorConstant.white,
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorConstant.blueColor,
                    ),
                  )
                : Container(
                    padding: EdgeInsets.all(1),
                    child: Icon(
                      Icons.check,
                      size: 15,
                      color: ColorConstant.white,
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorConstant.white,
                    ),
                  ),
            onTap: onpressedofCheckBox,
          ),
          SizedBox(
            width: 15,
          ),
          TextComponent(
              text: text,
              textStyle: FontStyles.fontMedium(
                  color: ColorConstant.blackTwo,
                  fontSize: 11,
                  fontWeight: FontWeight.w600)),
          Spacer(),
          IconButton(
              icon: Icon(
                iconData,
                color: ColorConstant.pink,
              ),
              onPressed: onpressed)
        ],
      ),
    );
  }
}
