import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rimattire/components/review_star.dart';
import 'package:rimattire/components/text_component.dart';
import 'package:rimattire/constants/colors/colors_constants.dart';
import 'package:rimattire/constants/styles/font_styles_constants.dart';

class CustomCard extends StatelessWidget {
  final String date;
  final String completed;
  final String name;
  final String total;
  final String item;
  final String ratting;
  final String price;
  final checkIsCompleted;

  const CustomCard(
      {Key key,
      this.date,
      this.completed,
      this.name,
      this.total,
      this.item,
      this.ratting,
      this.price,
      this.checkIsCompleted=false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom:8.0,left: 16,right: 15),
        child: Card(
          elevation: 2,
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(left: 18.0, top: 14),
              child: Row(
                children: [
                  TextComponent(
                      text: date,
                      textStyle: FontStyles.fontMedium(
                          color: ColorConstant.warmGreyFour,
                          fontSize: 10,
                          fontWeight: FontWeight.w600)),
                  Spacer(),
                  TextComponent(
                      text: completed,
                      textStyle: FontStyles.fontMedium(
                          color: checkIsCompleted
                              ? ColorConstant.lightOrange
                              : ColorConstant.daekGrenn,
                          fontSize: 9,
                          fontWeight: FontWeight.w600)),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 17),
                    child: Container(
                      height: 8,
                      width: 8,
                      decoration: BoxDecoration(
                          color: checkIsCompleted
                              ? ColorConstant.lightOrange
                              : ColorConstant.daekGrenn,
                          shape: BoxShape.circle),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0, top: 16,),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextComponent(
                      text: name,
                      textStyle: FontStyles.fontMedium(
                          color: ColorConstant.blackTwo,
                          fontSize: 13,
                          fontWeight: FontWeight.w700)),
                  Padding(
                    padding: const EdgeInsets.only(right: 17.0),
                    child: TextComponent(
                        text: total,
                        textStyle: FontStyles.fontMedium(
                            color: ColorConstant.warmGrey,
                            fontSize: 10,
                            fontWeight: FontWeight.w700)),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0, top: 4,bottom: 8),
              child: Row(
                children: [
                  TextComponent(
                      text: item,
                      textStyle: FontStyles.fontMedium( 
                          color: ColorConstant.blackTwo,
                          fontSize: 12,
                          fontWeight: FontWeight.w400)),
                  Padding(
                    padding: const EdgeInsets.only(left: 17.0),
                    child: checkIsCompleted
                        ? Container()
                        : StatefulStarRating(
                            iconSize: 15,
                          ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 11),
                    child: checkIsCompleted
                        ? Container()
                        : TextComponent(
                            text: ratting,
                            textStyle: FontStyles.fontMedium(
                                color: ColorConstant.blackTwo,
                                fontSize: 12,
                                fontWeight: FontWeight.w400)),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 17.0,
                    ),
                    child: TextComponent(
                        text: price,
                        textStyle: FontStyles.fontMedium(
                            color: ColorConstant.pink,
                            fontSize: 20,
                            fontWeight: FontWeight.w700)),
                  ),
                ],
              ),
            ),
          ]),
        ),

    );
  }
}
