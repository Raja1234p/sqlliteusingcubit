import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:richardproject/view/common_components/app_constants.dart';
import 'package:richardproject/view/common_components/text_component.dart';
import 'package:richardproject/view/constants/assets_constants.dart';
import 'package:richardproject/view/constants/color_constants.dart';

class CommonListTileComponent extends StatefulWidget {
  @override
  _CommonListTileComponentState createState() =>
      _CommonListTileComponentState();


}

class _CommonListTileComponentState extends State<CommonListTileComponent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
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
                    borderRadius: BorderRadius.circular(AppConstants.roundedBorder),
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
              SizedBox(width: 10,),
              Expanded(
                child: Column(
                  children: [
                    Row(
                      children: [
                        TextHeadings.heading1('sfdse'),
                      ],
                    ),
                    TextHeadings.heading2('asdf')
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
