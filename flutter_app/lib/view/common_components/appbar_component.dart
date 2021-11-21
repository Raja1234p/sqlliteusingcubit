import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:richardproject/view/common_components/app_constants.dart';
import 'package:richardproject/view/constants/color_constants.dart';

class AppbarComponent extends StatelessWidget {
  final bool hideBackButton;
  final String title;
  final String firstTrailingIcon;
  final bool makeIconWhite;
  final dynamic secondTrailingIconOrImage;
  final String firstTrailingIconBadgeCount;
  final Function onFirstTrailingIconPressed;
  final Function onSecondTrailingIconPressed;
  final bool withHorizontalPadding;
  final bool showIconAtTrailing;
  final bool showNotificationIconOrOther;
  final IconData notificationIcon;
  final IconData trailingIcon;
  final String trailingImage;
  final Function notificationFunction;
  final Function trailingIconFunction;
  final String icon;

  AppbarComponent({
    this.hideBackButton = false,
    this.title = '',
    this.firstTrailingIcon,
    this.makeIconWhite = false,
    this.secondTrailingIconOrImage,
    this.firstTrailingIconBadgeCount,
    this.onFirstTrailingIconPressed,
    this.onSecondTrailingIconPressed,
    this.withHorizontalPadding = false,
    this.showIconAtTrailing,
    this.showNotificationIconOrOther = false,
    this.notificationIcon = Icons.notifications_none,
    this.trailingIcon = Icons.favorite,
    this.trailingImage,
    this.notificationFunction,
    this.trailingIconFunction, this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final double _iconSize = 30;
    return Container(
      width: double.infinity,
//      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),

//      color: Colors.blue,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                hideBackButton
                    ? Container()
                    : GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                color: ColorConstants.whiteColor,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: const Color(0x14000000),
                                      offset: Offset(0, 0),
                                      blurRadius: 10,
                                      spreadRadius: 0)
                                ]),
                            child: icon==null? Icon(
                              Icons.arrow_back_ios_rounded,
                              color: ColorConstants.textHeadingColor,
                            ):Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: SvgPicture.asset(icon,

                                width: 20,
                                height: 20,
                              ),
                            ))),
                Spacer(),
                Text(
                  title,
                  textAlign: TextAlign.start,
                  textScaleFactor: 1.4,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: makeIconWhite
                          ? Colors.white
                          : title=='Logo'.toUpperCase()? ColorConstants
                              .lightBlueColor:ColorConstants.textHeadingColor,

                  ), /*style: TextStyle(fontWeight: FontWeight.bold)*/
                ),
                Spacer(),
//        Text((secondTrailingIconOrImage.toString() == 'IconData(U+0E451)').toString()),
                showIconAtTrailing
                    ? Container()
                    : showNotificationIconOrOther
                        ? GestureDetector(
                            onTap: () {
                              notificationFunction();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: ColorConstants.whiteColor,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        color: const Color(0x14000000),
                                        offset: Offset(0, 0),
                                        blurRadius: 10,
                                        spreadRadius: 0)
                                  ]),
                              height: 40,
                              width: 40,
                              child: Badge(
                                showBadge: firstTrailingIconBadgeCount != null,
                                position: BadgePosition.topEnd(
                                    top: firstTrailingIconBadgeCount == ''
                                        ? 2
                                        : 4,
                                    end: firstTrailingIconBadgeCount == ''
                                        ? 12
                                        : 3),
                                badgeContent: Text(
                                    firstTrailingIconBadgeCount ?? '',
                                    textScaleFactor: 0.8,
                                    style: TextStyle(color: Colors.white)),
                                child: Icon(
                                  notificationIcon,
                                  color: ColorConstants.textHeadingColor,
                                ),
                              ),
                            ),
                          )
                        : GestureDetector(
                            onTap: () {
                              trailingIconFunction();
                            },
                            child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                    color: ColorConstants.whiteColor,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          color: const Color(0x14000000),
                                          offset: Offset(0, 0),
                                          blurRadius: 10,
                                          spreadRadius: 0)
                                    ]),
                                child: trailingImage==null? Icon(
                                  trailingIcon,
                                  size: 40,
                                  color: Colors.red,
                                ):Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: ClipRRect(

                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(trailingImage,
                                    fit: BoxFit.cover,
                                    ),
                                  ),
                                ))),
//
              ]),
        ],
      ),
    );
  }
}
