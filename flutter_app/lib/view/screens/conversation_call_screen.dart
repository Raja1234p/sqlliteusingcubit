import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:richardproject/view/common_components/app_constants.dart';
import 'package:richardproject/view/common_components/button_component.dart';
import 'package:richardproject/view/common_components/star_ratting_component.dart';
import 'package:richardproject/view/common_components/text_component.dart';
import 'package:richardproject/view/constants/assets_constants.dart';
import 'package:richardproject/view/constants/color_constants.dart';
import 'package:richardproject/view/constants/string_constants.dart';

import 'custom_painter_testing_screen.dart';

class ConversationCallScreen extends StatefulWidget {
  @override
  _ConversationCallScreenState createState() => _ConversationCallScreenState();
}

class _ConversationCallScreenState extends State<ConversationCallScreen> {
  TextEditingController _meesageForMentor = TextEditingController();
  int ratting;


  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppConstants.roundedBorder),
              image: DecorationImage(
                  image: AssetImage(AssetConstants.conversationImage),
                  fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.symmetric(
                vertical: AppConstants.defaultPadding,
                horizontal: AppConstants.defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                            height: 50,
                            width: 50,
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
                            child:  Icon(
                              Icons.arrow_back_ios_rounded,
                              color: ColorConstants.textHeadingColor,
                              size: 30,
                            )
                            )),
                    SizedBox(width: 10,),
                    Expanded(child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextHeadings.heading1('Jennifer',fontColor: ColorConstants.whiteColor,
                        textScaleFactor: 1.5
                        ),
                        TextHeadings.simpleText('5:26 min',color: ColorConstants.whiteColor,isBold: true)
                      ],
                    )),
                    Container(
                      width: MediaQuery.of(context).size.height * 0.14,
                      height: MediaQuery.of(context).size.height * 0.2,
                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                      decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.circular(AppConstants.defaultPadding),
                        image: DecorationImage(
                            image: AssetImage(AssetConstants.conversationImage),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ],
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: Icon(Icons.call_end_outlined,color: ColorConstants.whiteColor,),
        onPressed: (){
          _reviewBottomSheet();
        },
      ),

    );
  }

  _reviewBottomSheet() {
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
                            Icons.close,
                            color: ColorConstants.greyColor,
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      Spacer(),
                      TextHeadings.heading2(StringConstants.feedback,
                          color: ColorConstants.textHeadingColor, isBold: true),
                      Spacer()

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
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          StatefulWrtieReviewStarRating(
                            iconSize: 30,
                            rightPadding: 8,
                            rating: ratting,
                            onRating: (int rating) {
                              snapshot(() {
                                this.ratting = rating;
                              });
                            },
                          ),
                          ratting == null || ratting == 0
                          ?Container() :Container(
                            padding: EdgeInsets.symmetric(vertical: 6,horizontal: 20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: ColorConstants.reviewStarColor.withOpacity(0.2)
                              ),
                              child: Text(ratting.toString(),style: TextStyle(color: ColorConstants.reviewStarColor,fontWeight: FontWeight.bold),))
                              ,
                        ],
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, bottom: 20),
                        child: TextHeadings.heading1(StringConstants.writeYourOwnReview,
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
                            hintText: StringConstants.writeSomething,
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
                          StringConstants.submitReview,
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
