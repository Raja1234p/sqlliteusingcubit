import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:richardproject/view/common_components/app_constants.dart';
import 'package:richardproject/view/common_components/appbar_component.dart';
import 'package:richardproject/view/common_components/text_component.dart';
import 'package:richardproject/view/constants/assets_constants.dart';
import 'package:richardproject/view/constants/color_constants.dart';
import 'package:richardproject/view/constants/string_constants.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        height: MediaQuery.of(context).size.height,
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
                title: StringConstants.logo.toUpperCase(),
                showIconAtTrailing: false,
                icon: AssetConstants.categorySVG,
                trailingImage: AssetConstants.dummyImage2,
              ),
              SizedBox(
                height: 20,
              ),
              Stack(
                overflow: Overflow.visible,
                children: [
                  Positioned(
                    bottom: -28,
                    right: 0,
                    left: 0,
                    child: Container(
                      height: 20,
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 70),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            Colors.white,Colors.white.withOpacity(0.3),
                          ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter
                          ),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                            AppConstants.defaultPadding,

                          ),



                          boxShadow: [
                            BoxShadow(
                                color: const Color(0x14000000),
                                offset: Offset(0, 0),
                                blurRadius: 10,
                                spreadRadius: 0)
                          ]),
                    ),
                  ),
                  Positioned(
                    bottom: -15,
                    right: 0,
                    left: 0,
                    child: Container(
                      height: 100,
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 50),
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(
                            AppConstants.defaultPadding,

                          ),
                          gradient: LinearGradient(colors: [
                            Colors.white,Colors.white.withOpacity(0.1),
                          ],
                          begin: Alignment.bottomCenter,
                            end: Alignment.topCenter
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: const Color(0x14000000),
                                offset: Offset(0, 0),
                                blurRadius: 10,
                                spreadRadius: 0)
                          ]),
                      ),
                    ),


                  Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 40),
                      padding: EdgeInsets.only(
                          left: AppConstants.defaultPadding,
                          bottom: AppConstants.defaultPadding,
                          right: 5,
                          top: AppConstants.defaultPadding),
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
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height/2.5,
                            padding: EdgeInsets.only(
                                top: AppConstants.defaultPadding,
                                bottom: AppConstants.defaultPadding,
                                left: 8,
                                right: AppConstants.defaultPadding),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              image: DecorationImage(
                                  image: AssetImage(
                                    AssetConstants.dummyImage3,
                                  ),
                                  fit: BoxFit.cover),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Color(0xff121212)
                                              .withOpacity(0.09)),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Colors.orange,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          TextHeadings.heading2('4.5')
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Color(0xff121212)
                                              .withOpacity(0.09)),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.favorite_border,
                                            color: Colors.white,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                ),
                                Spacer(),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Spacer(),
                                    Container(
                                      padding: EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Color(0xff121212)
                                              .withOpacity(0.09)),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons
                                                .check_box_outline_blank_outlined,
                                            color: Colors.white,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Container(
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
                                  color: Colors.red,
                                ),
                              ),
                              Expanded(
                                  child: Column(
                                children: [
                                  TextHeadings.heading1(
                                    'Pamela 24',
                                    textScaleFactor: 1.3,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  TextHeadings.simpleText('UI Designer')
                                ],
                              )),
                              Container(
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
                                  Icons.check,
                                  color: Colors.green,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              )
                            ],
                          )
                        ],
                      )),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
