import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:richardproject/view/common_components/app_constants.dart';
import 'package:richardproject/view/constants/color_constants.dart';

class ButtonComponent extends StatelessWidget {
  final void Function() onPressed;
  final String buttonText;
  final Color color;
  final Color textColor;
  final TextStyle textStyle;
  final bool isDisable;
  final bool isContracted;
  final bool invertColor;
  final double targetScaleFactor;
  final bool showImageWithText;
  final String image;
  final double detailScreenSize;
  final String showSvgImage;
  final bool showBtnImage;

  const ButtonComponent(this.buttonText,
      {Key key,
      this.onPressed,
      this.color = const Color(0xff2A9DF4),
      this.textColor = Colors.white,
      this.isDisable = false,
      this.textStyle,
      this.isContracted = false,
      this.invertColor = false,
      this.targetScaleFactor = 1.2,
      this.showImageWithText = false,
      this.image, this.detailScreenSize, this.showSvgImage, this.showBtnImage=false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isDisable ? null : onPressed,
      child: Container(
        height: detailScreenSize==null? 70:detailScreenSize,
        decoration: BoxDecoration(
            color: onPressed == null
                ? ColorConstants.greyColor
                : invertColor
                    ? textColor
                    : color,
            borderRadius: BorderRadius.circular(17),
            border: Border.all(
                color: onPressed == null ? ColorConstants.greyColor : color)),
//          disabledColor: ColorConstants.disableGreyColor,
//          height: MediaQuery.of(context).size.height,
        width: isContracted ? 0 : MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(AppConstants.defaultPadding),
          child: image == null
              ? Text(buttonText ?? '',
                  textScaleFactor: targetScaleFactor,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: onPressed == null
                          ? Colors.white
                          : invertColor
                              ? color
                              : textColor))
              : Row(
            mainAxisSize: MainAxisSize.min,
                  children: [
                  showBtnImage?SvgPicture.asset(showSvgImage,
                    color: ColorConstants.lightBlueColor,
                    width: 20,
                    height: 20,
                  ):  Image.asset(
                      image,
                      color: Colors.white,
                      width: 20,
                      height: 20,
                    ),
                   detailScreenSize!=null?Container(): SizedBox(
                      width: 15,
                    ),
                    Text(buttonText ?? '',
                        textScaleFactor: targetScaleFactor,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: onPressed == null
                                ? Colors.white
                                : invertColor
                                    ? color
                                    : textColor))
                  ],
                ),
        ),
      ),
    );
  }
}
