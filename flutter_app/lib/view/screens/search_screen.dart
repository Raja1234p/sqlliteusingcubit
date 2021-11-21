import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:richardproject/view/common_components/app_constants.dart';
import 'package:richardproject/view/common_components/appbar_component.dart';
import 'package:richardproject/view/common_components/button_component.dart';
import 'package:richardproject/view/common_components/carousel_calendar.dart';
import 'package:richardproject/view/common_components/text_component.dart';
import 'package:richardproject/view/constants/assets_constants.dart';
import 'package:richardproject/view/constants/color_constants.dart';
import 'package:richardproject/view/constants/string_constants.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with TickerProviderStateMixin {
  bool isFilter = false;
  bool hideTopMentor = true;
  bool hideTopMentors = false;
  int num;
  String value = '';

  int state = 0;
  bool showBottomSheet = false;
  AnimationController controller;
  void _incrementCounter() {
    setState(() {
      state = state == 0 ? 1 : 0;
    });
  }
  @override
  initState() {
    super.initState();
    controller =
        BottomSheet.createAnimationController(this);
    controller.duration = Duration(seconds: 3);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
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
                title: StringConstants.search,
                showIconAtTrailing: false,
                icon: AssetConstants.categorySVG,
                showNotificationIconOrOther: true,
              ),
              Container(
                margin: EdgeInsets.only(top: height / 20),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: ColorConstants.primaryBlue.withOpacity(0.07),
                        blurRadius: 2,
                        offset: Offset(1, 1), // Shadow position
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: TextFormField(
                  // onTap: (){
                  //   setState(() {
                  //     // isOpen = false;
                  //   });
                  //   Future.delayed(Duration(milliseconds: 100), () {
                  //     setState(() {
                  //       //  isLoad = false;
                  //     });
                  //   });
                  // },
                  decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(11.0),
                        child: SvgPicture.asset(
                          AssetConstants.search,
                          placeholderBuilder: (context) =>
                              CircularProgressIndicator(),
                          height: 20.0,
                        ),
                      ),
                      suffixIcon: Container(
                        margin: EdgeInsets.all(8),
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                            color: ColorConstants.primaryBlue,
                            borderRadius: BorderRadius.circular(10)),
                        child: SvgPicture.asset(
                          AssetConstants.mic,
                          placeholderBuilder: (context) =>
                              CircularProgressIndicator(),
                          height: 30.0,
                        ),
                      ),
                      hintText: "Search by Mentor",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 12),
                      border: InputBorder.none),
                  style: TextStyle(color: ColorConstants.textHeadingColor),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    InkWell(
                      child: Container(
                        height: 35,
                        margin: EdgeInsets.only(right: 8),
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.0),
                                blurRadius: 3,
                                offset: Offset(1, 1), // Shadow position
                              ),
                            ],
                            border: Border.all(
                                width: 0.5,
                                color: showBottomSheet
                                    ? ColorConstants.googleBtnColor
                                    : Colors.grey.withOpacity(0.5)),
                            borderRadius: BorderRadius.circular(8),
                            color: showBottomSheet
                                ? ColorConstants.googleBtnColor.withOpacity(0.2)
                                : Colors.grey.withOpacity(0.1)),
                        child: Row(
                          children: [
                            Icon(
                              Icons.filter_alt_outlined,
                              color: Colors.grey,
                              size: 18,
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Text(
                              StringConstants.filter,
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black.withOpacity(0.6)),
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          showBottomSheet=!showBottomSheet;
                        });
                       if(showBottomSheet){
                         _showBottomSheet();
                       }
                      },
                    ),
                    Container(
                      height: 35,
                      child: ListView.separated(
                          itemCount: 10,
                          scrollDirection: Axis.horizontal,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          separatorBuilder: (_, __) => Container(
                                width: 8,
                              ),
                          itemBuilder: (context, int index) {
                            return InkWell(
                              child: Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: isFilter
                                            ? Colors.grey.withOpacity(0.2)
                                            : Colors.grey.withOpacity(0.0),
                                        blurRadius: 3,
                                        offset: Offset(1, 1), // Shadow position
                                      ),
                                    ],
                                    border: Border.all(
                                        width: 0.5,
                                        color: num == index
                                            ? ColorConstants.googleBtnColor
                                            : Colors.grey.withOpacity(0.5)),
                                    borderRadius: BorderRadius.circular(8),
                                    color: num == index
                                        ? ColorConstants.googleBtnColor
                                            .withOpacity(0.2)
                                        : Colors.grey.withOpacity(0.1)),
                                child: Row(
                                  children: [
                                    Text(
                                      num == index
                                          ? 'UI Designer ${index.toString().replaceAll(index.toString(), '')}'
                                          : 'UI Designer ',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black.withOpacity(0.6)),
                                    )
                                  ],
                                ),
                              ),
                              onTap: () {
                                setState(() {
                                  num = index;
                                });
                              },
                            );
                          }),
                    )
                  ],
                ),
              ),
              state == 0
                  ? SizedBox(
                      height: 20,
                    )
                  : Container(),
              state == 0
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextHeadings.heading1(StringConstants.topMentorThisWeek,
                            textScaleFactor: 1.3),
                        TextHeadings.heading2(StringConstants.seeAll,
                            textScaleFactor: 1.3,
                            color: ColorConstants.lightBlueColor)
                      ],
                    )
                  : Container(),
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    AnimatedSize(
                      duration: Duration(seconds: 2),
                      vsync: this,
                      child: Container(
                        height: state == 0 ? height / 4 : 0,
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
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          separatorBuilder: (_, __) => Container(
                            width: 8,
                          ),
                          itemCount: 10,
                          itemBuilder: (context, int index) {
                            return Container(
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
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: AppConstants.defaultPadding,
                                        right: AppConstants.defaultPadding,
                                        top: AppConstants.defaultPadding,
                                        bottom: 5),
                                    child: Column(
                                      children: [
                                        Container(
                                          height: height / 8.1,
                                          width: height / 8.1,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.asset(
                                              AssetConstants.dummyImage4,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        TextHeadings.heading1('Haris Ricardo',
                                            textScaleFactor: 1),
                                        SizedBox(
                                          height: 3,
                                        ),
                                        TextHeadings.simpleText('UX Designer',
                                            textScaleFactor: 1),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: width / 3,
                                    height: 1,
                                    color: ColorConstants.greyColor
                                        .withOpacity(0.2),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(
                                            Icons.favorite_outline,
                                            color:
                                                ColorConstants.lightBlueColor,
                                            size: 18,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          TextHeadings.simpleText(
                                            StringConstants.addToFavorite,
                                            color:
                                                ColorConstants.lightBlueColor,
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextHeadings.heading1(StringConstants.peopleYouMayKnow,
                      textScaleFactor: 1.3),
                  TextHeadings.heading2(StringConstants.seeAll,
                      textScaleFactor: 1.3,
                      color: ColorConstants.lightBlueColor)
                ],
              ),
              SizedBox(
                height: 20,
              ),
              ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  separatorBuilder: (_, __) => Container(
                        height: 10,
                      ),
                  itemBuilder: (context, snapshot) {
                    return InkWell(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 2, right: 2),
                        child: Container(
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
                                    TextHeadings.heading2(
                                        'UI Designer, California',
                                        color: ColorConstants.greyColor,
                                        textScaleFactor: 1),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          // hideTopMentor=!hideTopMentor;
                          _incrementCounter();
                        });

                      },
                    );
                  })
            ],
          ),
        ),
      )),
    );
  }

  _showBottomSheet(){
    return showModalBottomSheet(
        context: context,
        isDismissible: false,

        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (context, snapshot) {
            return ListView(

                children: [
              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Spacer(),
                  SizedBox(
                    width: 10,
                  ),
                  TextHeadings.heading2(StringConstants.select,
                      color: ColorConstants.textHeadingColor,
                      isBold: true,
                      textScaleFactor: 1.6),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: InkWell(
                      child: Icon(
                        Icons.clear,
                        color: ColorConstants.greyColor,
                      ),
                      onTap: () {
                        setState(() {
                          showBottomSheet=false;
                        });
                        Navigator.of(context).pop();
                      },
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 2,
                width: MediaQuery.of(context).size.width,
                color: ColorConstants.greyColor.withOpacity(0.2),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppConstants.defaultPadding),
                        child: Column(
                          children: [
                            CalendarComponent(),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    circleContainer(Colors.black),
                                    TextHeadings.simpleText(
                                        StringConstants.availAble,
                                        color:
                                            ColorConstants.textHeadingColor),
                                  ],
                                ),
                                Row(
                                  children: [
                                    circleContainer(Colors.grey),
                                    TextHeadings.simpleText(
                                        StringConstants.notAvailAble,
                                        color:
                                            ColorConstants.textHeadingColor),
                                  ],
                                ),
                                Row(
                                  children: [
                                    circleContainer(Colors.blue),
                                    TextHeadings.simpleText(
                                        StringConstants.selected,
                                        color:
                                            ColorConstants.textHeadingColor)
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            )
                          ],
                        ),
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
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0, bottom: 10),
                          child: TextHeadings.heading1('Select Time',
                              textScaleFactor: 1.2),
                        ),
                      ],
                    ),
                    Container(
                      height: 60,
                      child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, int index) => Container(
                          width: 10,
                        ),
                        itemCount: 3,
                        itemBuilder: (context, int index) {
                          return customOptionSelector(
                              context, index.toString(), value, () {
                            snapshot(() {
                              value = index.toString();
                            });
                            print('hghjg $value');
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40, bottom: 20),
                      child: ButtonComponent(
                        StringConstants.next,
                        onPressed: () {},
                      ),
                    )
                  ],
                ),
              )
            ]);
          });
        });
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
}
