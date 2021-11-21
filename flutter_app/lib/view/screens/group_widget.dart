import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:richardproject/view/common_components/app_constants.dart';
import 'package:richardproject/view/common_components/text_component.dart';
import 'package:richardproject/view/constants/assets_constants.dart';
import 'package:richardproject/view/constants/color_constants.dart';
import 'package:richardproject/view/screens/group_details_screen.dart';

class GroupWidget extends StatefulWidget {
  @override
  _GroupWidgetState createState() => _GroupWidgetState();
}

class _GroupWidgetState extends State<GroupWidget> {
  int ratting;
  bool favorateIcon = false;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
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
                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                              color: ColorConstants.whiteColor,
                              borderRadius: BorderRadius.circular(10),
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
                                AssetConstants.dummyImage4,
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
                              TextHeadings.heading1(
                                  'Gerry Kingsman',
                                  textScaleFactor: 1.2,
                                  textAlign: TextAlign.start),
                              TextHeadings.heading2(
                                'UI Designer, California',
                                color: ColorConstants.greyColor,
                                textScaleFactor: 1,
                                height: 1.5,
                                  textAlign: TextAlign.start
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 3, horizontal: 3),
                            decoration: BoxDecoration(
                                color: ColorConstants.whiteColor,
                                borderRadius:
                                BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: const Color(0x14000000),
                                      offset: Offset(0, 0),
                                      blurRadius: 10,
                                      spreadRadius: 0)
                                ]),
                            child: Icon(
                              Icons.arrow_forward_ios_sharp,
                              color: ColorConstants.greyColor,
                            ),
                          ),
                          onTap: () {},
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 40,
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
                                width: 40,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    image: DecorationImage(
                                        image:
                                            AssetImage(AssetConstants.dummyImage5),
                                        fit: BoxFit.cover)),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Container(
                          height: 40,
                          width: 40,
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
                      ],
                    )
                  ],
                ),
              ),
            ),
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>GroupDetailsScreen()));
            },
          );
        });
  }
}
