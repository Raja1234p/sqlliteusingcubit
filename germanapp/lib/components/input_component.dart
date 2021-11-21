import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rimattire/constants/colors/colors_constants.dart';
import 'package:rimattire/constants/styles/font_styles_constants.dart';

class TextInputComponent extends StatelessWidget {
  final List<TextInputFormatter> inputFormatter;
  final TextEditingController controller;
  final String title;
  final String action;
  final bool enabled, filled;
  final TextInputAction textInputAction;
  final FocusNode currentFocus, nextFocus;
  final Color fillColor;
  final String intialValue;
  final int maxLength;
  final bool floatingLabel, obscureText;
  final ValueChanged<String> onChanged;
  final void Function(String) onFieldSubmitted;
  final TextInputType textInputType;
  final Widget prefixIcon;
  final TextStyle hintStyle;
  final Widget suffixIcon;
  final isProductDetailsScreen;

  final bool isSellScreen2;

  final String Function(String) validator;
  final Color getPaidBorderColor;

  const TextInputComponent(
      {Key key,
      this.controller,
      @required this.title,
      this.action,
      this.enabled,
      this.textInputAction,
      this.currentFocus,
      this.nextFocus,
      this.maxLength,
      this.obscureText = false,
      this.floatingLabel = false,
      this.fillColor,
      this.onChanged,
      this.intialValue,
      this.filled,
      this.onFieldSubmitted,
      this.textInputType = TextInputType.emailAddress,
      this.prefixIcon,
      this.suffixIcon,
      this.hintStyle,
      this.validator,
      this.isProductDetailsScreen = false,
      this.isSellScreen2 = false,
      this.getPaidBorderColor, this.inputFormatter})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        maxLines: isSellScreen2 ? 8 : 1,
        controller: controller,
        initialValue: intialValue,
        inputFormatters: inputFormatter!=null?inputFormatter:null,
        onChanged: onChanged,
        maxLength: maxLength != null ? maxLength : null,
        obscureText: obscureText,
        enabled: this.enabled,
        focusNode: currentFocus,
        textInputAction: textInputAction,
        onFieldSubmitted: (value) {
          if (textInputAction == TextInputAction.next) {
            print(value + "callback");
            currentFocus.unfocus();
            FocusScope.of(context).requestFocus(nextFocus);
          }
        },
        keyboardType: textInputType,
        decoration: InputDecoration(
          contentPadding: isSellScreen2
              ? EdgeInsets.only(
                  left: 25,
                  top: 20,
                )
              : EdgeInsets.only(left: 25, top: 20, bottom: 20),
          labelText: floatingLabel ? title : null,
          hintText: !floatingLabel ? title : null,
          hintStyle: hintStyle == null
              ? TextStyle(
                  fontSize: 14.0,
                  color: ColorConstant.brownGrey,
                )
              : hintStyle,
          fillColor: fillColor,
          filled: filled,
          prefixIcon: prefixIcon != null
              ? Padding(
                  padding: const EdgeInsetsDirectional.only(end: 8.0),
                  child: prefixIcon,
                )
              : null,
          suffixIcon: suffixIcon != null
              ? new Padding(
                  padding: const EdgeInsets.only(
                      top: 15, left: 0, right: 0, bottom: 15),
                  child: suffixIcon)
              : null,
          labelStyle: FontStyles.fontRegular(color: ColorConstant.brownGrey),
          border: isProductDetailsScreen
              ? InputBorder.none
              : new OutlineInputBorder(
                  borderRadius: isSellScreen2
                      ? BorderRadius.circular(10.0)
                      : BorderRadius.circular(30.0),
                  borderSide: isSellScreen2
                      ? BorderSide(color: ColorConstant.white)
                      : BorderSide(
                          color: getPaidBorderColor != null
                              ? getPaidBorderColor
                              : ColorConstant.brownGrey),
                ),
          enabledBorder: isProductDetailsScreen
              ? InputBorder.none
              : new OutlineInputBorder(
                  borderRadius: isSellScreen2
                      ? BorderRadius.circular(10.0)
                      : BorderRadius.circular(30.0),
                  borderSide: isSellScreen2
                      ? BorderSide(color: ColorConstant.white)
                      : BorderSide(
                          color: getPaidBorderColor != null
                              ? getPaidBorderColor
                              : ColorConstant.brownGrey),
                ),
          disabledBorder: isProductDetailsScreen
              ? InputBorder.none
              : new OutlineInputBorder(
                  borderRadius: isSellScreen2
                      ? BorderRadius.circular(10.0)
                      : BorderRadius.circular(30.0),
                  borderSide: isSellScreen2
                      ? BorderSide(color: ColorConstant.white)
                      : BorderSide(
                          color: getPaidBorderColor != null
                              ? getPaidBorderColor
                              : ColorConstant.brownGrey),
                ),
          focusedBorder: isProductDetailsScreen
              ? InputBorder.none
              : new OutlineInputBorder(
                  borderRadius: isSellScreen2
                      ? BorderRadius.circular(10.0)
                      : BorderRadius.circular(30.0),
                  borderSide: isSellScreen2
                      ? BorderSide(color: ColorConstant.white)
                      : BorderSide(
                          color: getPaidBorderColor != null
                              ? getPaidBorderColor
                              : ColorConstant.brownGrey),
                ),
        ),
        cursorColor: ColorConstant.brownGrey,
        style: TextStyle(
          fontSize: 14.0,
          color: ColorConstant.brownGrey,
        ),
        validator: validator);
  }
}
