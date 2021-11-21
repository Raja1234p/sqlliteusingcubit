import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:richardproject/view/common_components/app_constants.dart';
import 'package:richardproject/view/common_components/appbar_component.dart';
import 'package:richardproject/view/common_components/text_component.dart';
import 'package:richardproject/view/constants/assets_constants.dart';
import 'package:richardproject/view/constants/color_constants.dart';
import 'package:richardproject/view/constants/string_constants.dart';
import 'package:richardproject/view/screens/rejected_widget.dart';
import 'package:richardproject/view/screens/waiting_Widget.dart';

import 'group_widget.dart';
import 'matches_widget.dart';
import 'new_request_widget.dart';

class MatchesScreen extends StatefulWidget  {
  @override
  _MatchesScreenState createState() => _MatchesScreenState();
}

class _MatchesScreenState extends State<MatchesScreen>with TickerProviderStateMixin {
  List<String> tabs = ['MATCHES', 'GROUP', ];
  AnimationController controller;
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 2);
    _tabController.addListener(_handleTabSelection);
    controller =
        BottomSheet.createAnimationController(this);
    controller.duration = Duration(seconds: 3);
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
          padding: const EdgeInsets.only(
              left: AppConstants.defaultPadding,
              top: AppConstants.defaultPadding,
              bottom: 5,

              right: AppConstants.defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              SizedBox(
                height: 5,
              ),
              AppbarComponent(
                title: StringConstants.matches,
                showIconAtTrailing: false,
                icon: AssetConstants.categorySVG,
                trailingImage: AssetConstants.dummyImage2,
              ),
              SizedBox(
                height: 40,
              ),


              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                       17),
                    color: ColorConstants.textFieldColor),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 10, bottom: 10, right: 10, left: 10),
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
              AnimatedSize(
              vsync: this,
              duration: Duration(seconds: 2),

              child: Container(

                height: _tabController.index==1?50:0,

                child: Padding(
                    padding: const EdgeInsets.only(top:20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextHeadings.heading1(StringConstants.listGroup,
                            textScaleFactor: 1.3),
                        Row(
                          children: [
                            Icon(Icons.add,color: ColorConstants.lightBlueColor,size: _tabController.index==1?25:0,),
                            TextHeadings.heading2(StringConstants.addGroup,
                                textScaleFactor: 1.3,
                                color: ColorConstants.lightBlueColor),
                          ],
                        )
                      ],
                    ),
                  ),
              ),
            ),
              Expanded(
                child: Container(
                  color: Colors.transparent,
                  padding: EdgeInsets.only(top: 30,bottom: 0),
                  child: TabBarView(
                      controller: _tabController,
                      children: [

                        MatchesWidget(),
                        GroupWidget(),

                      ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
