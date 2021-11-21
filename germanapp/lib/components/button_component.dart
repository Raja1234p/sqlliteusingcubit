import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rimattire/components/text_component.dart';
import 'package:rimattire/constants/colors/colors_constants.dart';
import 'package:rimattire/constants/styles/font_styles_constants.dart';

class ButtonComponent extends StatelessWidget {
  final void Function() onPressed;
  final String buttonText;
  final double border;
  final Color color;
  final Color colorOfBorder;
  final TextStyle textStyle;
  final double width;
  final bool showLeadingIcon;
  final String pictureName;
  final double pictureWidth;
  final double pictureHeight;
  final Color borderSideColor;
  final double borderWidth;
  final bool textAlign;
  final double height;
  final FocusNode focusNode;
  
  const ButtonComponent(
      {Key key,
      this.onPressed,
      @required this.buttonText,
      this.border = 30.0,
      this.color,
      this.textStyle,
      this.width,
      this.showLeadingIcon = false,
      this.pictureName,
      this.pictureWidth,
      this.pictureHeight,
      this.borderSideColor = ColorConstant.blueColor,
      this.borderWidth = 0,
      this.textAlign = true,
      this.height = 0,
      this.colorOfBorder = ColorConstant.blueColor,
      this.focusNode})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(border),
          side: BorderSide(
              color: colorOfBorder != null ? colorOfBorder : ColorConstant.pink,
              width: borderWidth)),
      color: color,
      height: height == 0 ? MediaQuery.of(context).size.height * 0.07 : height,

      focusNode: focusNode,
      minWidth: width,
      child:

      showLeadingIcon?
      Row(

        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          showLeadingIcon
              ? Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: SvgPicture.asset(
                    pictureName,
                    width: pictureWidth,
                    height: pictureHeight,
                  ),
                )
              : Container(),
          showLeadingIcon ? Flexible(child: SizedBox(width: 60,)) : Container(),
          showLeadingIcon
              ? Padding(
                  padding: const EdgeInsets.only(right: 0),
                  child: TextComponent(
                    text: buttonText,
                    textAlign: TextAlign.center,
                    textStyle: textStyle != null
                        ? textStyle
                        : FontStyles.fontRegular(color: ColorConstant.white,letterSpacing: 1),
                  ),
                )
              : textAlign
                  ? TextComponent(
                      text: buttonText,
                      
                      textAlign: TextAlign.center,
                      textStyle: textStyle != null
                          ? textStyle
                          : FontStyles.fontRegular(color: ColorConstant.white,letterSpacing: 1),
                    )
                  : Center(
                      child: TextComponent(
                        text: buttonText,
                        textAlign: TextAlign.center,
                        textStyle: textStyle != null
                            ? textStyle
                            : FontStyles.fontRegular(
                                color: ColorConstant.white,letterSpacing: 1),
                      ),
                    ),
        ],
      ):  Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextComponent(
            text: buttonText,
            textAlign: TextAlign.center,
            textStyle: textStyle != null
                ? textStyle
                : FontStyles.fontRegular(
                color: ColorConstant.white,letterSpacing: 1),
          ),
        ],
      ),
      onPressed: onPressed != null ? onPressed : () => {},
    );
  }
}
