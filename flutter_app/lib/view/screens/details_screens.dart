import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:richardproject/view/common_components/acknowledgement_screen.dart';
import 'package:richardproject/view/common_components/app_constants.dart';
import 'package:richardproject/view/common_components/appbar_component.dart';
import 'package:richardproject/view/common_components/button_component.dart';
import 'package:richardproject/view/common_components/star_ratting_component.dart';
import 'package:richardproject/view/common_components/text_component.dart';
import 'package:richardproject/view/constants/assets_constants.dart';
import 'package:richardproject/view/constants/color_constants.dart';
import 'package:richardproject/view/constants/string_constants.dart';

import 'bottom_navigation_bar.dart';
import 'matches_screen.dart';

class DetailsScreen extends StatefulWidget {
  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  bool favourate = false;
  TextEditingController _meesageForMentor = TextEditingController();

  int ratting;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: AppConstants.defaultPadding,
              horizontal: AppConstants.defaultPadding),
          child: Column(
            children: [
              SizedBox(
                height: 5,
              ),
              AppbarComponent(
                title: StringConstants.details,
                showIconAtTrailing: false,
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.height * 0.14,
                    height: MediaQuery.of(context).size.height * 0.2,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(AppConstants.defaultPadding),
                      image: DecorationImage(
                          image: AssetImage(AssetConstants.dummyImage3),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppConstants.defaultPadding),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextHeadings.heading1('Pamela Helbert'),
                          SizedBox(
                            height: 5,
                          ),
                          TextHeadings.simpleText('Pamela Helbert',
                              textAlign: TextAlign.left),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              StatefulWrtieReviewStarRating(
                                rating: ratting,
                                onRating: (int rating) {
                                  setState(() {
                                    this.ratting = rating;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: ratting == null || ratting == 0
                                    ? Text('')
                                    : TextHeadings.simpleText(
                                        ratting.toString(),
                                        color: ColorConstants.reviewStarColor,
                                        isBold: true),
                              ),
                              FittedBox(child: TextHeadings.simpleText('(200)'))
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 4, vertical: 14),
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(17),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Image.asset(
                                        AssetConstants.whatsAppLogo,
                                        width: 20,
                                        height: 20,
                                        color: ColorConstants.whiteColor,
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: TextHeadings.simpleText(
                                            StringConstants.message,
                                            color: ColorConstants.whiteColor),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                flex: 1,
                                child: InkWell(
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 0, vertical: 7),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(17),
                                        border: Border.all(
                                            color:
                                                ColorConstants.lightBlueColor)),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SvgPicture.asset(
                                          AssetConstants.scheduleSVG,
                                          width: 30,
                                          height: 30,
                                          color: ColorConstants.lightBlueColor,
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: TextHeadings.simpleText(
                                              StringConstants.highLevel,
                                              color: ColorConstants
                                                  .lightBlueColor),
                                        )
                                      ],
                                    ),
                                  ),
                                  onTap: () {
                                    _showUserProfile();
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [TextHeadings.heading1(StringConstants.aboutMe)],
              ),
              SizedBox(
                height: 10,
              ),
              TextHeadings.simpleText(
                  "I’ve been working the past 5+ years on startupcompany in New york, United States. I’ve had the privilege of working remotely",
                  textAlign: TextAlign.left),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [TextHeadings.heading1(StringConstants.experience)],
              ),
              SizedBox(
                height: 20,
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                separatorBuilder: (context, _) => Container(
                  height: 10,
                ),
                itemCount: 2,
                itemBuilder: (context, int index) {
                  return InkWell(
                    child: userExperienceCard(context),
                    onTap: () {
                      _userFeedbackBottomSheet();
                    },
                  );
                },
              ),
            ],
          ),
        ),
      )),
      bottomNavigationBar: Padding(
          padding: _padding(),
          child: ButtonComponent(
            StringConstants.requestMentorship,
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => AcknowledgementScreen(
                        title: StringConstants.success,
                        subTitle: StringConstants.successfullySubmitRequest,
                        image: AssetConstants.doneIllustration,
                        btnText: StringConstants.seeYourSchedule,
                        show: null,
                        showSubtitle: false,
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      MatchesScreen()));
                        },
                      )));
            },
          )),
    );
  }

  Container userExperienceCard(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: _padding(),
      decoration: cardDecoration(),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
                color: Color(0xffEA9272),
                borderRadius:
                    BorderRadius.circular(AppConstants.roundedBorder)),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextHeadings.heading1('Experience Title',
                    fontColor: ColorConstants.whiteColor,
                    textScaleFactor: 1.3,
                    textAlign: TextAlign.left),
                SizedBox(
                  height: 6,
                ),
                TextHeadings.heading2(
                    'We need this section for experience details ',
                    color: ColorConstants.whiteColor,
                    textScaleFactor: 1,
                    textAlign: TextAlign.left)
              ],
            ),
          ))
        ],
      ),
    );
  }

  BoxDecoration cardDecoration() {
    return BoxDecoration(
        color: ColorConstants.googleBtnColor,
        borderRadius: BorderRadius.circular(AppConstants.defaultPadding));
  }

  EdgeInsets _padding() {
    return EdgeInsets.symmetric(
        vertical: AppConstants.defaultPadding,
        horizontal: AppConstants.defaultPadding);
  }

  circleContainer(Color color) {
    return Container(
      margin: EdgeInsets.only(right: 4),
      width: 10,
      height: 10,
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
    );
  }

  GestureDetector customOptionSelector(BuildContext context, String index,
      String compareIndex, Function onPressed) {
    return GestureDetector(
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppConstants.defaultPadding),
              color: compareIndex == index
                  ? ColorConstants.googleBtnColor.withOpacity(0.2)
                  : ColorConstants.textFieldColor,
              border: Border.all(
                  color: compareIndex == index
                      ? ColorConstants.googleBtnColor
                      : ColorConstants.textFieldColor)),
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Center(
            child: TextHeadings.heading1(
                "08:00 am ${index.replaceAll(index, '')} am" ?? '',
                textAlign: TextAlign.left,
                textScaleFactor: 1),
          ),
        ),
        onTap: onPressed);
  }

  _userFeedbackBottomSheet() {
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (context, snapshot) {
            return SafeArea(
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          InkWell(
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              decoration: BoxDecoration(
                                  color: ColorConstants.whiteColor,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                        color: const Color(0x14000000),
                                        offset: Offset(0, 0),
                                        blurRadius: 10,
                                        spreadRadius: 0)
                                  ]),
                              child: Icon(
                                Icons.close,
                                color: ColorConstants.greyColor,
                              ),
                            ),
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
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
                            child: Row(
                              children: [
                                TextHeadings.heading2(
                                    StringConstants.seeFullProfile,
                                    color: ColorConstants.lightBlueColor,
                                    isBold: true,
                                    textScaleFactor: 1),
                                Icon(
                                  Icons.arrow_forward_ios_sharp,
                                  color: ColorConstants.lightBlueColor,
                                  size: 15,
                                )
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 2,
                  width: MediaQuery.of(context).size.width,
                  color: ColorConstants.greyColor.withOpacity(0.2),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: AppConstants.defaultPadding,
                            horizontal: AppConstants.defaultPadding),
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
                        child: Row(
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                  color: ColorConstants.whiteColor,
                                  borderRadius: BorderRadius.circular(
                                      AppConstants.roundedBorder),
                                  // image: DecorationImage(
                                  //   image: AssetImage(AssetConstants.dummyImage2),
                                  //   fit: BoxFit.cover
                                  // ),
                                  boxShadow: [
                                    BoxShadow(
                                        color: const Color(0x14000000),
                                        offset: Offset(0, 0),
                                        blurRadius: 10,
                                        spreadRadius: 0)
                                  ]),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    AssetConstants.dummyImage2,
                                    fit: BoxFit.cover,
                                  )),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      TextHeadings.heading1('Gerry Kingsman',
                                          textScaleFactor: 1.2),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 5, horizontal: 5),
                                        decoration: BoxDecoration(
                                            color: ColorConstants.whiteColor,
                                            shape: BoxShape.circle,
                                            boxShadow: [
                                              BoxShadow(
                                                  color:
                                                      const Color(0x14000000),
                                                  offset: Offset(0, 0),
                                                  blurRadius: 10,
                                                  spreadRadius: 0)
                                            ]),
                                        child: InkWell(
                                          onTap: () {
                                            snapshot(() {
                                              this.favourate = !favourate;
                                            });
                                          },
                                          child: Icon(
                                            favourate
                                                ? Icons.favorite
                                                : Icons.favorite_outline,
                                            color: favourate
                                                ? Colors.red[400]
                                                : ColorConstants.greyColor,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  TextHeadings.heading2(
                                      'UI Designer, California',
                                      color: ColorConstants.greyColor,
                                      textScaleFactor: 1),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      StatefulWrtieReviewStarRating(
                                        iconSize: 17,
                                        rating: ratting,
                                        onRating: (int rating) {
                                          snapshot(() {
                                            this.ratting = rating;
                                          });
                                        },
                                      ),
                                      ratting == null || ratting == 0
                                          ? Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 5),
                                              child: Container(),
                                            )
                                          : TextHeadings.simpleText(
                                              ratting.toString(),
                                              color: ColorConstants
                                                  .reviewStarColor,
                                              isBold: true),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 5),
                                        child: FittedBox(
                                            child: TextHeadings.simpleText(
                                                '(200)')),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, bottom: 20),
                        child: TextHeadings.heading1(StringConstants.aboutMe,
                            textScaleFactor: 1.2),
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.symmetric(
                              vertical: AppConstants.defaultPadding,
                              horizontal: AppConstants.defaultPadding),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: ColorConstants.googleBtnColor),
                              color: ColorConstants.googleBtnColor
                                  .withOpacity(0.2)),
                          child: TextHeadings.simpleText(
                              'Hi Hanna, Nice to e-meet you. I’d like to sharing' *
                                  1,
                              textAlign: TextAlign.left)),
                      Padding(
                        padding: const EdgeInsets.only(top: 40, bottom: 20),
                        child: ButtonComponent(
                          StringConstants.sendMessage,
                          onPressed: () {},
                        ),
                      )
                    ],
                  ),
                )
              ]),
            );
          });
        });
  }

  _showUserProfile() {
    return showModalBottomSheet(
        isScrollControlled: true,
        // backgroundColor:Color(0xffE5E5E5).withOpacity(0.9) ,

        context: context,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (context, snapshot) {
            return SafeArea(
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
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
                          child: Icon(
                            Icons.arrow_back_ios_rounded,
                            color: ColorConstants.greyColor,
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextHeadings.heading2(StringConstants.confirmation,
                          color: ColorConstants.textHeadingColor, isBold: true),
                      InkWell(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          decoration: BoxDecoration(
                              color: ColorConstants.whiteColor,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                    color: const Color(0x14000000),
                                    offset: Offset(0, 0),
                                    blurRadius: 10,
                                    spreadRadius: 0)
                              ]),
                          child: Icon(
                            Icons.close,
                            color: ColorConstants.greyColor,
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 2,
                  width: MediaQuery.of(context).size.width,
                  color: ColorConstants.greyColor.withOpacity(0.2),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.symmetric(
                            vertical: AppConstants.defaultPadding,
                            horizontal: AppConstants.defaultPadding),
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
                        child: Row(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                  color: ColorConstants.whiteColor,
                                  borderRadius: BorderRadius.circular(
                                      AppConstants.roundedBorder),
                                  // image: DecorationImage(
                                  //   image: AssetImage(AssetConstants.dummyImage2),
                                  //   fit: BoxFit.cover
                                  // ),
                                  boxShadow: [
                                    BoxShadow(
                                        color: const Color(0x14000000),
                                        offset: Offset(0, 0),
                                        blurRadius: 10,
                                        spreadRadius: 0)
                                  ]),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    AssetConstants.dummyImage2,
                                    fit: BoxFit.cover,
                                  )),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextHeadings.heading1('Gerry Kingsman',
                                      textScaleFactor: 1.2),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.schedule,
                                        color: Color(0xffFEA686),
                                        size: 15,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      TextHeadings.heading2(
                                          'UI Designer, California',
                                          color: ColorConstants.greyColor,
                                          textScaleFactor: 1),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, bottom: 20),
                        child: TextHeadings.heading1(StringConstants.note,
                            textScaleFactor: 1.2),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: TextFormField(
                          controller: _meesageForMentor,
                          textInputAction: TextInputAction.done,
                          maxLines: 5,
                          style: TextStyle(
                              color: ColorConstants.textHeadingColor
                                  .withOpacity(0.8)),
                          decoration: InputDecoration(
                            hintText: 'Message for mentor...',
                            hintStyle:
                                TextStyle(color: ColorConstants.greyColor),
                            filled: true,
                            fillColor: ColorConstants.textFieldColor,
                            border: InputBorder.none,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: ColorConstants.textFieldColor),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            disabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: ColorConstants.textFieldColor),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: ColorConstants.textFieldColor),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40, bottom: 20),
                        child: ButtonComponent(
                          StringConstants.submitRequest,
                          onPressed: () {},
                        ),
                      )
                    ],
                  ),
                )
              ]),
            );
          });
        });
  }
}
