import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:richardproject/view/common_components/app_constants.dart';
import 'package:richardproject/view/common_components/text_component.dart';
import 'package:richardproject/view/constants/assets_constants.dart';
import 'package:richardproject/view/constants/color_constants.dart';

class NewRequestWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount:10,
        separatorBuilder: (_,__)=>Container(
          height: 10,
        ),
        itemBuilder: (context, snapshot) {
          return Padding(
            padding: const EdgeInsets.only(left: 2,right: 2),
            child: Container(width: MediaQuery.of(context).size.width,

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
              child:  Row(
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextHeadings.heading1('Gerry Kingsman',
                            textScaleFactor: 1.2),
                        SizedBox(
                          height: 5,
                        ),
                        FittedBox(
                          child: Row(

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
                                  textScaleFactor: 0.88),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                        vertical: 2, horizontal: 2),
                    decoration: BoxDecoration(

                      color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.red),
                        boxShadow: [
                          BoxShadow(
                              color: const Color(0x14000000),
                              offset: Offset(0, 0),
                              blurRadius: 10,
                              spreadRadius: 0)
                        ]),
                    child: Icon(
                      Icons.clear,
                      color: Colors.red,
                    ),
                  ),
                  SizedBox(width: 10,),
                  Container(
                    padding: EdgeInsets.symmetric(
                        vertical: 4, horizontal: 4),
                    decoration: BoxDecoration(

                        color: Colors.green,
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
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          );
        }
    );
  }
}
