import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rimattire/components/text_component.dart';
import 'package:rimattire/constants/assets/assets_constants.dart';
import 'package:rimattire/constants/colors/colors_constants.dart';
import 'package:rimattire/constants/styles/font_styles_constants.dart';

class ShowProduct extends StatelessWidget {
  final double heightOfContainer;
  final String sellerName;
  final String productName;
  final String productDescription;
  final String productPrice;
  final String productImage;
  final double widths;
  final bool isOrderDetails;
  final bool showorNot;

  const ShowProduct(
      {Key key,
      this.heightOfContainer,
      this.sellerName,
      this.productName,
      this.productDescription,
      this.productPrice,
      this.productImage,
      this.widths,
      this.isOrderDetails,
      this.showorNot})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Padding(
      padding: isOrderDetails
          ? EdgeInsets.zero
          : const EdgeInsets.only(top: 5, bottom: 8.0),
      child: Container(
        height: (height * heightOfContainer),
        decoration: BoxDecoration(
            borderRadius: isOrderDetails
                ? BorderRadius.all(Radius.circular(4))
                : BorderRadius.all(Radius.circular(8)),
            boxShadow: [
              BoxShadow(
                  color: const Color(0x0d000000),
                  offset: Offset(0, 0),
                  blurRadius: 11,
                  spreadRadius: 2)
            ],
            color: ColorConstant.white),
        child: isOrderDetails
            ? Row(
                children: [
                  Container(
                    height: (height * heightOfContainer),
                    decoration: BoxDecoration(
                      color: ColorConstant.appBlack,
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(4),
                          bottomLeft: Radius.circular(4)),
                      child: Image.asset(
                        productImage,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(top: 4.0, bottom: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextComponent(
                          text: productName,
                          overFlow: TextOverflow.ellipsis,
                          textStyle: FontStyles.fontMedium(
                              color: ColorConstant.blackTwo,
                              letterSpacing: 0.28,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                        TextComponent(
                          text: productDescription,
                          textStyle: FontStyles.fontMedium(
                              color: ColorConstant.warmGreyFour,
                              letterSpacing: 0,
                              fontSize: 12,
                              fontWeight: FontWeight.w600),
                        ),
                        Spacer(),
                        Padding(
                          padding: EdgeInsets.only(right: 11),
                          child: Row(
                            children: [
                              TextComponent(
                                text: productPrice,
                                textStyle: FontStyles.fontMedium(
                                    color: ColorConstant.blueColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700),
                              ),
                              Spacer(),
                              isOrderDetails
                                  ? Container()
                                  : SvgPicture.asset(AssetConstant.userIcon),
                              isOrderDetails
                                  ? Container()
                                  : SizedBox(
                                      width: 7,
                                    ),
                              isOrderDetails
                                  ? Container()
                                  : TextComponent(
                                      text: sellerName,
                                      textStyle: FontStyles.fontMedium(
                                          color: ColorConstant.pink,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w600),
                                    )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ))
                ],
              )
            : Row(
                children: [
                  Container(
                    height: (height * heightOfContainer),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          bottomLeft: Radius.circular(8)),
                      child: Image.asset(
                        productImage,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(top: 18.0, bottom: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextComponent(
                          text: productName,
                          overFlow: TextOverflow.ellipsis,
                          textStyle: FontStyles.fontMedium(
                              color: ColorConstant.blackTwo,
                              letterSpacing: 0.28,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        TextComponent(
                          text: productDescription,
                          textStyle: FontStyles.fontMedium(
                              color: ColorConstant.warmGreyFour,
                              letterSpacing: 0,
                              fontSize: 12,
                              fontWeight: FontWeight.w600),
                        ),
                        Spacer(),
                        Padding(
                          padding: EdgeInsets.only(right: 11),
                          child: Row(
                            children: [
                              TextComponent(
                                text: productPrice,
                                textStyle: FontStyles.fontMedium(
                                    color: ColorConstant.blueColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700),
                              ),
                              Spacer(),
                              SvgPicture.asset(AssetConstant.userIcon),
                              SizedBox(
                                width: 7,
                              ),
                              TextComponent(
                                text: sellerName,
                                textStyle: FontStyles.fontMedium(
                                    color: ColorConstant.pink,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ))
                ],
              ),
      ),
    );
  }
}
