import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:rimattire/components/button_component.dart';
import 'package:rimattire/constants/routes/routes_constants.dart';

import '../constants/colors/colors_constants.dart';
import '../constants/styles/font_styles_constants.dart';
import 'text_component.dart';

class CustomCircleAvatar extends StatelessWidget {
  final Widget widget;
  final double iconSpace;
  final isOtpScreen;
  final IconData iconData;
  final Color iconColor;
  final double iconSize;
  final String title;
  final double circleSpace;
  final String subtitle;
  final String btnText;
  final Color btnColor;
  final double btnWidth;
  final double btnHeight;
  final String lastText;
  final void Function() onpressed;
  final EdgeInsetsGeometry edgeInsetsGeometryfortitle;
  final EdgeInsetsGeometry edgeInsetsGeometryforsubtitle;
  final EdgeInsetsGeometry edgeInsetsGeometryforbtn;
  final EdgeInsetsGeometry edgeInsetsGeometryforlasttext;
  final TextEditingController controller;
  final Function() homeScreen;
  final Color backGroundColor;
  final Color textColor;
  final Function onTap;

  const CustomCircleAvatar(
      {Key key,
      this.widget,
      this.iconSpace,
      this.iconData,
      this.iconColor = ColorConstant.white,
      this.iconSize,
      this.title,
      this.circleSpace,
      this.subtitle,
      this.btnText,
      this.btnColor = ColorConstant.pink,
      this.btnWidth,
      this.btnHeight,
      this.lastText,
      this.edgeInsetsGeometryfortitle,
      this.edgeInsetsGeometryforsubtitle,
      this.edgeInsetsGeometryforbtn,
      this.edgeInsetsGeometryforlasttext,
      this.homeScreen,
      this.isOtpScreen = false,
      this.controller,
      this.backGroundColor,
      this.textColor,
      this.onpressed,
      this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color:
          backGroundColor != null ? backGroundColor : ColorConstant.blueColor,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: iconSpace,
              ),
              GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Icon(
                      iconData,
                      color: iconColor,
                      size: iconSize,
                    ),
                  ),
                  onTap: onTap != null
                      ? onTap
                      : () => Navigator.of(context).pop()),
              SizedBox(
                height: circleSpace,
              ),
              isOtpScreen
                  ? Padding(
                      padding: edgeInsetsGeometryfortitle,
                      child: Align(
                          alignment: Alignment.center,
                          child: TextComponent(
                              text: title,
                              textAlign: TextAlign.center,
                              textStyle: FontStyles.fontMedium(
                                fontWeight: FontWeight.w700,
                                color: textColor != null
                                    ? textColor
                                    : ColorConstant.white,
                                fontSize: 20,
                              ))))
                  : Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: 150,
                        width: 150,
                        child: widget,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: ColorConstant.lightBlue.withOpacity(
                              0.2301499992609024,
                            )),
                      ),
                    ),
              isOtpScreen
                  ? Padding(
                      padding:
                          const EdgeInsets.only(top: 66.0, left: 30, right: 33),
                      child: PinCodeTextField(
                        appContext: context,
                        controller: controller,
                        backgroundColor: ColorConstant.blueColor,
                        keyboardType: TextInputType.number,
                        enableActiveFill: true,
                        pinTheme: PinTheme(
                            fieldHeight: 96,
                            fieldWidth: 70,
                            inactiveFillColor:
                                ColorConstant.lightBlue.withOpacity(
                              0.2301499992609024,
                            ),
                            selectedColor: ColorConstant.blueColor.withOpacity(
                              0.2301499992609024,
                            ),
                            selectedFillColor:
                                ColorConstant.lightBlue.withOpacity(
                              0.2301499992609024,
                            ),
                            activeFillColor:
                                ColorConstant.lightBlue.withOpacity(
                              0.2301499992609024,
                            ),
                            borderRadius: BorderRadius.circular(12),
                            activeColor: ColorConstant.blueColor.withOpacity(
                              0.2301499992609024,
                            ),
                            inactiveColor: ColorConstant.blueColor,
                            shape: PinCodeFieldShape.box),
                        autoFocus: false,
                        animationCurve: Curves.easeIn,
                        length: 4,
                        textStyle: FontStyles.fontMedium(
                            color: ColorConstant.white,
                            fontSize: 38,
                            fontWeight: FontWeight.w600),
                        onChanged: (value) {},
                      ),
                    )
                  : Padding(
                      padding: edgeInsetsGeometryfortitle,
                      child: Align(
                        alignment: Alignment.center,
                        child: TextComponent(
                          text: title,
                          textAlign: TextAlign.center,
                          textStyle: FontStyles.fontMedium(
                            fontWeight: FontWeight.w700,
                            color: textColor != null
                                ? textColor
                                : ColorConstant.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: edgeInsetsGeometryforsubtitle,
                  child: TextComponent(
                    textAlign: TextAlign.center,
                    text: subtitle,
                    textStyle: FontStyles.fontRegular(
                      color: ColorConstant.white,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: edgeInsetsGeometryforbtn,
                child: ButtonComponent(
                  onPressed: onpressed != null ? onpressed : null,
                  colorOfBorder: ColorConstant.pink,
                  buttonText: btnText.toUpperCase(),
                  textStyle: FontStyles.fontMedium(
                      color: ColorConstant.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 11),
                  color: btnColor,
                  width: btnWidth,
                ),
              ),
              InkWell(
                  child: Padding(
                    padding: edgeInsetsGeometryforlasttext,
                    child: Align(
                      alignment: Alignment.center,
                      child: TextComponent(
                        text: lastText,
                        textStyle: FontStyles.fontMedium(
                            letterSpacing: isOtpScreen ? 1 : 0,
                            color: ColorConstant.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 11),
                      ),
                    ),
                  ),
                  onTap: homeScreen),
            ],
          ),
        ),
      ),
    );
  }
}
