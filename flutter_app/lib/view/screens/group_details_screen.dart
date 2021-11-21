import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:richardproject/ui_utils/media_source_selection_widget.dart';
import 'package:richardproject/view/common_components/acknowledgement_screen.dart';
import 'package:richardproject/view/common_components/app_constants.dart';
import 'package:richardproject/view/common_components/appbar_component.dart';
import 'package:richardproject/view/common_components/button_component.dart';
import 'package:richardproject/view/common_components/text_component.dart';
import 'package:richardproject/view/constants/assets_constants.dart';
import 'package:richardproject/view/constants/color_constants.dart';
import 'package:richardproject/view/constants/string_constants.dart';
import 'dart:io';
import 'matches_screen.dart';

class GroupDetailsScreen extends StatefulWidget {
  @override
  _GroupDetailsScreenState createState() => _GroupDetailsScreenState();
}

class _GroupDetailsScreenState extends State<GroupDetailsScreen> {
  String _selectedImagePath = '';
  List<String> membersPicture=List<String>();

  int ratting;
  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: AppConstants.defaultPadding,
                  horizontal: AppConstants.defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  AppbarComponent(
                    title: StringConstants.group,
                    showIconAtTrailing: true,


                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: height * 0.14,
                        height: height * 0.14,
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextHeadings.heading1(StringConstants.faceBookGroup),
                              SizedBox(
                                height: 5,
                              ),
                              TextHeadings.simpleText(StringConstants.faceBookGroupDescription,
                                  textAlign: TextAlign.left,
                              textScaleFactor: 0.9
                              ),
                              SizedBox(
                                height: 15,
                              ),


                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [TextHeadings.heading1(StringConstants.member,textScaleFactor: 1.4),
                    SizedBox(width:10 ,),
                 membersPicture.length==0?Container():   CircleAvatar(
                      maxRadius: 15,

                      backgroundColor: ColorConstants.googleBtnColor,
                     child: Padding(
                       padding: const EdgeInsets.only(left: 5,right: 5),
                       child: FittedBox(child: TextHeadings.simpleText('${membersPicture.length}',color: ColorConstants.whiteColor)),
                     ),
                    )

                    ],
                  ),
                  SizedBox(height: 20,),
                   Container(
                     height: height*0.07,
                     child: ListView.separated(
                       scrollDirection: Axis.horizontal,

                      itemCount: membersPicture.length+1,
                         separatorBuilder: (_,__)=>Container(width: 10,),
                          itemBuilder: (context, int index) {
                        if(index==0){
                            return InkWell(
                              child: DottedBorder(
                                  dashPattern: [4, 4, 4, 4],
                                  strokeWidth: 2,
                                  borderType: BorderType.RRect,
                                  radius:
                                  Radius.circular(AppConstants.defaultPadding),
                                  color: ColorConstants.lightBlueColor.withOpacity(0.8),
                                  child: Container(
                                    width: height*0.07,
                                    height: height*0.07,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            AppConstants.defaultPadding),
                                        // border: Border.all(
                                        //     style: BorderStyle.solid,
                                        //     color: ColorConstants.greyColor.withOpacity(0.3),
                                        //     width: 1),
                                        color: ColorConstants.lightBlueColor.withOpacity(0.09)),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.all(Radius.circular(
                                          AppConstants.defaultPadding)),
                                      child: Icon(
                                        Icons.add,
                                        color:
                                        ColorConstants.lightBlueColor,
                                      ),
                                    ),
                                  )),
                              onTap: _openCameraGallerySelectionDialog,
                            );
                          }
                      else{
                        return Container(
                          width: height*0.07,
                          height: height*0.07,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  10),
                              // border: Border.all(
                              //     style: BorderStyle.solid,
                              //     color: ColorConstants.greyColor.withOpacity(0.3),
                              //     width: 1),
                              color: ColorConstants.textFieldColor,
                              image: DecorationImage(
                                  image:FileImage(File(_selectedImagePath)),
                                  fit: BoxFit.cover)
                          ),
                        );
                        }
                      }
                        ),
                   ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextHeadings.heading1(StringConstants.upComingSchedule,
                          textScaleFactor: 1.3),
                      TextHeadings.heading2(StringConstants.seeAll,
                          textScaleFactor: 1.3,
                          color: ColorConstants.lightBlueColor)
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
                        borderRadius: BorderRadius.circular(15),
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


                ],
              ),
            ),
          )),
      bottomNavigationBar: Padding(
          padding: _padding(),
          child: ButtonComponent(
            StringConstants.sendMessage,
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => AcknowledgementScreen(
                    title: StringConstants.success,
                    subTitle: StringConstants.successfullySubmitRequest,
                    image: AssetConstants.doneIllustration,
                    btnText: StringConstants.seeYourSchedule,
                    show: null,

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

  _openCameraGallerySelectionDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return MediaSourceSelectionWidget(
            onTapGallery: () {
              Navigator.pop(context);
            },
            onTapCamera: () {},
            onImagePath: (String imagePath) {
              _selectedImagePath = imagePath;
              membersPicture.add(_selectedImagePath);
              setState(() {});
              print('$_selectedImagePath it is working');
            },
          );
        });
  }









}
