import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:richardproject/view/common_components/app_constants.dart';
import 'package:richardproject/view/common_components/appbar_component.dart';
import 'package:richardproject/view/common_components/text_component.dart';
import 'package:richardproject/view/constants/assets_constants.dart';
import 'package:richardproject/view/constants/color_constants.dart';
import 'package:richardproject/view/constants/string_constants.dart';
import 'package:richardproject/view/screens/new_request_widget.dart';
import 'package:richardproject/view/screens/rejected_widget.dart';
import 'package:richardproject/view/screens/waiting_Widget.dart';

class ScheduleScreen extends StatefulWidget {
  @override
  _ScheduleScreenState createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> with SingleTickerProviderStateMixin {
  List<String> tabs = ['New request', 'Waiting', 'Rejected'];

  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 3);
    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: AppConstants.defaultPadding,
              horizontal: AppConstants.defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 5,
              ),
              AppbarComponent(
                title: StringConstants.schedule,
                showIconAtTrailing: false,
                showNotificationIconOrOther: true,
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextHeadings.heading1(StringConstants.upComingSchedule,
                      textScaleFactor: 1.3),
                  TextHeadings.heading1(StringConstants.seeAll,
                      textScaleFactor: 1.3,
                      fontColor: ColorConstants.lightBlueColor)
                ],
              ),
              SizedBox(
                height: 25,
              ),
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
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
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
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: 30,
                          child: ListView.separated(
                            physics: NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            separatorBuilder: (_, a) => Container(
                              width: 3,
                            ),
                            itemCount: 3,
                            itemBuilder: (context, int index) {
                              if (index > 3) {
                                print(index);
                              }

                              return Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            AssetConstants.dummyImage),
                                        fit: BoxFit.cover)),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              // image: DecorationImage(
                              //     image: AssetImage(AssetConstants.dummyImage,),
                              //     fit: BoxFit.cover,
                              //
                              // ),
                              borderRadius: BorderRadius.circular(7),
                              color: Color(0xff121212).withOpacity(0.09)),
                          child: Center(
                              child: TextHeadings.simpleText('+4',
                                  color: ColorConstants.textHeadingColor)),
                        ),
                        Spacer(),
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          decoration: BoxDecoration(
                              color: ColorConstants.whiteColor,
                              borderRadius: BorderRadius.circular(
                                  AppConstants.roundedBorder),
                              boxShadow: [
                                BoxShadow(
                                    color: const Color(0x14000000),
                                    offset: Offset(0, 0),
                                    blurRadius: 10,
                                    spreadRadius: 0)
                              ]),
                          child: Image.asset(AssetConstants.chatImage,
                              color: Color(0xffFEA686)),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(

                            padding: EdgeInsets.symmetric(
                                vertical: 12, horizontal: 30),
                            decoration: BoxDecoration(
                                color: ColorConstants.lightBlueColor,
                                borderRadius: BorderRadius.circular(
                                    AppConstants.roundedBorder),
                                boxShadow: [
                                  BoxShadow(
                                      color: const Color(0x14000000),
                                      offset: Offset(0, 0),
                                      blurRadius: 10,
                                      spreadRadius: 0)
                                ]),
                            child: TextHeadings.simpleText(
                                StringConstants.start,
                                color: Colors.white,
                                isBold: true,
                                textScaleFactor: 1.1)),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(
                      vertical: AppConstants.defaultPadding),
                  decoration: BoxDecoration(
                      color: ColorConstants.whiteColor,
                      borderRadius:
                          BorderRadius.circular(AppConstants.roundedBorder),
                      boxShadow: [
                        BoxShadow(
                            color: const Color(0x14000000),
                            offset: Offset(0, 0),
                            blurRadius: 10,
                            spreadRadius: 0)
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppConstants.defaultPadding),
                    child: Column(
                      
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  AppConstants.roundedBorder),
                              color: ColorConstants.textFieldColor),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 10, bottom: 10, right: 5, left: 5),
                            child: TabBar(
                              controller: _tabController,
                              labelColor: Colors.red,
                              unselectedLabelColor: ColorConstants.greyColor,
                              tabs: List<Widget>.generate(tabs.length,
                                  (int index) {
                                return Tab(

                                  child: Text(
                                    tabs[index],
                                    style: TextStyle(
                                        color: ColorConstants.lightBlueColor,
                                        fontSize: 12.3),
                                  ),
                                );
                              }),
                              indicator: BoxDecoration(
                                  color: ColorConstants.whiteColor,
                                  borderRadius: BorderRadius.circular(
                                      AppConstants.roundedBorder)),
                            ),
                          ),
                        ),

                       Expanded(
                         child: TabBarView(
                                controller: _tabController,
                                children: [
                              NewRequestWidget(),
                              WaitingWidget(),
                              RejectedWidget()
                            ]),
                       ),

                      ],
                    ),
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
