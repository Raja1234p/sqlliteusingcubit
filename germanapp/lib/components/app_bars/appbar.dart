import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rimattire/constants/assets/assets_constants.dart';
import 'package:rimattire/constants/colors/colors_constants.dart';
import 'package:rimattire/constants/styles/font_styles_constants.dart';

import '../text_component.dart';

class ConstantAppBars extends StatelessWidget {
  final double preferredSize;
  final String title;
  final String subtitle;
  final Color color;
  final Function onTap;
  final String subTitle;
  final isSellproductScreen;
  final bool isEditProductScreen;
  final bool isGetPaid;
  final isReferralCodeSubscription;
  final bool isSellProduct2;

  const ConstantAppBars(
      {Key key,
      this.preferredSize,
      this.title = '',
      this.subtitle = '',
      this.color,
      this.onTap,
      this.subTitle = '',
      this.isSellproductScreen = false,
      this.isEditProductScreen = false,
      this.isGetPaid = false,
      this.isReferralCodeSubscription = false,
      this.isSellProduct2 = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(preferredSize),
      child: SafeArea(
          child: Container(
        width: MediaQuery.of(context).size.width,
        color: color,
        child: InkWell(
                  child: Padding(
            padding: isSellproductScreen
                ? EdgeInsets.only(left: 16, top: 30)
                : EdgeInsets.only(left: 16, top: 42),
            child: isSellproductScreen
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      isSellProduct2
                          ? Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Container(
                                color: ColorConstant.white,
                                child: GestureDetector(
                                    child: SvgPicture.asset(
                                      AssetConstant.leftArrow,
                                      width: 15,
                                      height: 15,
                                    ),
                                    onTap: onTap != null
                                        ? onTap
                                        : () => Navigator.of(context).pop()),
                              ),
                            )
                          : Container(),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextComponent(
                            text: title,
                            textStyle: FontStyles.fontMedium(
                                color: ColorConstant.brownGrey,
                                fontSize: 9,
                                fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          TextComponent(
                            text: subTitle,
                            textStyle: FontStyles.fontMedium(
                                color: ColorConstant.blackTwo,
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          )
                        ],
                      )
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: SvgPicture.asset(
                              AssetConstant.leftArrow,
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          TextComponent(
                            text: title,
                            textStyle: FontStyles.fontMedium(
                                color: ColorConstant.blackTwo,
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      isEditProductScreen
                          ? SizedBox(
                              height: 0,
                            )
                          : isGetPaid
                              ? SizedBox(
                                  height: 0,
                                )
                              : SizedBox(
                                  height: 6,
                                ),
                      isEditProductScreen
                          ? SizedBox(
                              height: 0,
                            )
                          : isReferralCodeSubscription != true
                              ? Padding(
                                  padding: const EdgeInsets.only(left: 28.0),
                                  child: TextComponent(
                                    text: subTitle,
                                    textStyle: FontStyles.fontMedium(
                                        color: ColorConstant.blackTwo,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400),
                                  ),
                                )
                              : Row(
                                  children: [
                                    Padding(
                                        padding:
                                            const EdgeInsets.only(left: 28.0),
                                        child: TextComponent(
                                          text: subTitle,
                                          textStyle: FontStyles.fontMedium(
                                              color: ColorConstant.blackTwo,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400),
                                        )),
                                    Spacer(),
                                    TextComponent(
                                      text: 'Active',
                                      textStyle: FontStyles.fontMedium(
                                          color: ColorConstant.green,
                                          fontSize: 9,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(
                                      width: 7,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(right: 15),
                                      width: 7,
                                      height: 7,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: ColorConstant.green),
                                    )
                                  ],
                                ),
                    ],
                  ),
          ),
       
       
            onTap: onTap!=null?onTap:()=>Navigator.of(context).pop(),
       
        ),
      )),
    );
  }
}
