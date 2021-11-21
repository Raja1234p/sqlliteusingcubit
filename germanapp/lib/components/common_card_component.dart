import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rimattire/components/text_component.dart';
import 'package:rimattire/constants/colors/colors_constants.dart';
import 'package:rimattire/constants/styles/font_styles_constants.dart';

class CommonCardComponent extends StatelessWidget {
  final String price;
  final String totalSale;
  final String iconData;
  final String imageEachBox;
  final bool centerImage;
  final double widthOfBox;
  final Function onTap;
  final bool showBackArrow;

  const CommonCardComponent(
      {Key key,
      this.price = '',
      this.totalSale = '',
      this.iconData,
      this.imageEachBox,
      this.centerImage = false,
      this.widthOfBox,
      this.onTap,
      this.showBackArrow = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.only(left: 16, bottom: 5, right: 6),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          boxShadow: [
            BoxShadow(
                color: const Color(0x0d000000),
                offset: Offset(0, 0),
                blurRadius: 18,
                spreadRadius: 2)
          ],
          color: ColorConstant.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                  padding: const EdgeInsets.only(top: 8.0, right: 7),
                  child: Visibility(
                    visible: showBackArrow,
                    child: GestureDetector(
                      child: Icon(
                        Icons.arrow_forward_ios_sharp,
                        size: 15,
                        color: ColorConstant.pink,
                      ),
                      onTap: onTap == null ? null : onTap,
                    ),
                  )),
            ],
          ),
          Padding(
            padding: showBackArrow
                ? const EdgeInsets.only(top: 8, bottom: 5)
                : const EdgeInsets.only(top: 16, bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextComponent(
                  text: price,
                  textStyle: FontStyles.fontMedium(
                      color: ColorConstant.darkGrey,
                      fontWeight: FontWeight.w600,
                      fontSize: 20),
                ),
                SizedBox(
                  width: 7,
                ),
                iconData == null ? Container() : SvgPicture.asset(iconData)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 6.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextComponent(
                  text: totalSale,
                  textStyle: FontStyles.fontMedium(
                      color: ColorConstant.warmGreyFour,
                      fontSize: 10,
                      fontWeight: FontWeight.w600),
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                      color: centerImage
                          ? ColorConstant.lightYellow.withOpacity(0.2000)
                          : ColorConstant.white),
                  child: imageEachBox == null
                      ? Container()
                      : centerImage
                          ? Center(
                              child: SvgPicture.asset(
                              imageEachBox,
                            ))
                          : SvgPicture.asset(
                              imageEachBox,
                              fit: BoxFit.cover,
                            ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
