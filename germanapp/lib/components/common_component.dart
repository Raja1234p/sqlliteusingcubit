import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rimattire/components/text_component.dart';
import 'package:rimattire/constants/colors/colors_constants.dart';
import 'package:rimattire/constants/strings/string_constants.dart';
import 'package:rimattire/constants/styles/font_styles_constants.dart';

import '../constants/strings/string_constants.dart';
import '../constants/strings/string_constants.dart';
import '../constants/strings/string_constants.dart';
import '../constants/strings/string_constants.dart';

class CommonComponents extends StatelessWidget {
  final double height;
  final double width;
  final Color color;
  final String title;
  final String doNotReadyHaveAccount;
  final Widget child;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final IconData iconData;
  final double iconSize;
  final double iconSizedbox;
  final double titleSizedBox;
  final double subtileSizedBox;
  final Color iconColor;
  final bool isLogin;
  final String letsLogin;
  final bool checkIsLogin;
  final String letsSignUp;
  final String signUp;
  final String alReadyHaveAccount;
  final Function onTap;

  const CommonComponents(
      {Key key,
      this.height,
      this.width,
      this.color,
      this.title,
      this.doNotReadyHaveAccount,
      this.child,
      this.padding,
      this.margin,
      this.iconData,
      this.iconSize,
      this.iconSizedbox,
      this.titleSizedBox,
      this.subtileSizedBox,
      this.isLogin = false,

      this.letsLogin,
      this.iconColor, this.checkIsLogin=false, this.letsSignUp, this.signUp, this.alReadyHaveAccount, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      width: width,
      height: height,
      color: ColorConstant.blueColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: iconSizedbox,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Icon(
              iconData,
              color: iconColor,
              size: iconSize,
            ),
          ),
          SizedBox(
            height: titleSizedBox,
          ),
         isLogin? Align(
            alignment: Alignment.center,
            child: TextComponent(
                text: title,

                textStyle: FontStyles.boldFont(
                  color: ColorConstant.white,
                  fontSize: 20,
                ),
              ),
          ):Align(
           alignment: Alignment.center,
           child: TextComponent(
             text: signUp,

             textStyle: FontStyles.boldFont(
               color: ColorConstant.white,
               fontSize: 20,
             ),
           ),
         ),

          isLogin
              ? SizedBox(
                  height: subtileSizedBox,
                )
              : SizedBox(
                  height: 21,
                ),
          InkWell(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                 isLogin? TextComponent(
                   text: doNotReadyHaveAccount,
                   textStyle: FontStyles.fontRegular(
                       color: ColorConstant.white, fontSize: 13),
                 ): TextComponent(
                        text: alReadyHaveAccount,
                        textStyle: FontStyles.fontRegular(
                            color: ColorConstant.white, fontSize: 13),
                      ),
                isLogin ?TextComponent(
                  text: letsSignUp,
                  textStyle: FontStyles.fontRegular(
                      color: ColorConstant.lightBlue, fontSize: 13),
                ):TextComponent(
                  text: letsLogin,
                  textStyle: FontStyles.fontRegular(
                      color: ColorConstant.lightBlue, fontSize: 13),
                ),
              ],
            ),
            onTap: onTap,
          ),
        ],
      ),
    );
  }
}
