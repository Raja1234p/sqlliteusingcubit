import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rimattire/components/text_component.dart';
import 'package:rimattire/constants/assets/assets_constants.dart';
import 'package:rimattire/constants/colors/colors_constants.dart';
import 'package:rimattire/constants/styles/font_styles_constants.dart';

class ConstantAppBar extends StatelessWidget {
  final Color color;
  final String title;
  final String subTitle;
  final IconData iconData;
  final double iconSize;
  final Widget widget;
  final String image;
  final double imageWidth;
  final double imageHeight;
  final Color bellIconColor;

  final Widget anyWidget;
  final Color appBarColor;
  final double elevation;

  final bool showNotification;
  final String noOfNotification;
  final Function onTap;
  final Color backGrounColorOfScaffold;
  final double toolBarHeight;
  final Function backButton;
  final bool showTitleOrImage;
  final String titleImage;
  final bool showTextWidgetOrRow;
  final bool goBack;
  const ConstantAppBar({
    Key key,
    this.color,
    this.title = '',
    this.subTitle,
    this.iconData,
    this.iconSize,
    this.widget,
    this.showNotification = false,
    this.anyWidget,
    this.image,
    this.imageWidth,
    this.imageHeight,
    this.noOfNotification = '',
    this.appBarColor,
    this.elevation,
    this.onTap,
    this.backGrounColorOfScaffold = Colors.white,
    this.toolBarHeight = 80,
    this.backButton,
    this.showTitleOrImage = false,
    this.titleImage,
    this.bellIconColor = ColorConstant.blackTwo,
    this.showTextWidgetOrRow = true,
    this.goBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGrounColorOfScaffold,
      appBar: AppBar(
        toolbarHeight: toolBarHeight,
        titleSpacing: 0,
        backgroundColor: appBarColor,
        // backgroundColor: Colors.yellowAccent,
        elevation: elevation,
        title: showTextWidgetOrRow
            ? showTitleOrImage
                ? Container(
                    height: 200,
                    child: Stack(overflow: Overflow.visible, children: [
                      Positioned(
                        top: 10,
                        left: -28,
                        child: Image.asset(
                          titleImage,
                          color: ColorConstant.white,
                          height: 200,
                        ),
                      )
                    ]),
                  )
                : TextComponent(
                    text: title,
                    textStyle: FontStyles.fontMedium(
                        color: ColorConstant.blackTwo,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  )
            : Row(
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    icon: Icon(
                      iconData,
                      size: iconSize,
                      color: color,
                    ),
                    onPressed: backButton == null ? null : backButton,
                  ),
                  TextComponent(
                    text: title,
                    textStyle: FontStyles.fontMedium(
                        color: ColorConstant.blackTwo,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  TextComponent(
                    text: subTitle,
                    textStyle: FontStyles.fontMedium(
                        color: ColorConstant.blackTwo,
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
        leading: Visibility(
          visible: showTextWidgetOrRow,
          child: InkWell(
            child: IconButton(
              icon: Icon(
                iconData,
                size: iconSize,
                color: color,
              ),
              onPressed: backButton == null ? null : backButton,
            ),
            onTap: goBack != null ? goBack : () => Navigator.of(context).pop(),
          ),
        ),
        actions: [
          showNotification
              ? GestureDetector(
                  child: Padding(
                    padding: showTitleOrImage
                        ? EdgeInsets.only(top: 10)
                        : EdgeInsets.zero,
                    child: Container(
                      width: 100,
                      child: Stack(
                        overflow: Overflow.visible,
                        children: [
                          Positioned(
                            right: 20,
                            top: 30,
                            child: SvgPicture.asset(
                              image,
                              width: imageWidth,
                              height: imageHeight,
                              color: bellIconColor,
                            ),
                          ),
                          Positioned(
                            right: 14,
                            top: 27,
                            child: Container(
                              width: 16,
                              height: 16,
                              decoration: BoxDecoration(
                                color: ColorConstant.pink.withOpacity(1),
                                shape: BoxShape.circle,
                              ),
                              child: TextComponent(
                                text: noOfNotification,
                                textAlign: TextAlign.center,
                                textStyle: FontStyles.fontMedium(
                                  color: ColorConstant.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  onTap: onTap == null ? null : onTap,
                )
              : widget,
        ],
      ),
      body: anyWidget,
    );
  }
}
