import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:richardproject/ui_utils/media_source_selection_widget.dart';
import 'package:richardproject/view/common_components/acknowledgement_screen.dart';
import 'package:richardproject/view/common_components/app_constants.dart';
import 'package:richardproject/view/common_components/button_component.dart';
import 'package:richardproject/view/common_components/percent_indicator_component.dart';
import 'package:richardproject/view/common_components/text_component.dart';
import 'package:richardproject/view/constants/assets_constants.dart';
import 'package:richardproject/view/constants/color_constants.dart';
import 'package:richardproject/view/constants/string_constants.dart';
import 'package:richardproject/view/screens/bottom_navigation_bar.dart';
import 'dart:io';



class QuestionThreeScreen extends StatefulWidget {
  @override
  _QuestionThreeScreenState createState() => _QuestionThreeScreenState();
}

class _QuestionThreeScreenState extends State<QuestionThreeScreen> {
  List<String> selectedValue;
  bool selectGender = true;
  double age = 0;
  bool hideProfile = false;
  bool enAbleLocation = true;
  String _selectedImagePath = '';

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
              setState(() {});
              print('$_selectedImagePath it is working');
            },
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.defaultPadding,
                vertical: AppConstants.defaultPadding),
            child: Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
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
                            child: Icon(
                              Icons.arrow_back_ios_rounded,
                              color: ColorConstants.textHeadingColor,
                            ))),
                    Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: PercentIndicatorComponent(
                            percent: 90,
                          ),
                        )),
                    TextHeadings.heading2(StringConstants.skip,
                        color: ColorConstants.lightBlueColor,
                        textScaleFactor: 1.1,
                        isBold: true)
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                TextHeadings.heading1(StringConstants.basicInformation),
                SizedBox(
                  height: 10,
                ),
                TextHeadings.simpleText(StringConstants.pleaseFillAllTheOption),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    _selectedImagePath == ''
                        ? DottedBorder(
                            dashPattern: [6, 6, 6, 6],
                            strokeWidth: 2,
                            borderType: BorderType.RRect,
                            radius:
                                Radius.circular(AppConstants.defaultPadding),
                            color: ColorConstants.greyColor.withOpacity(0.8),
                            child: Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      AppConstants.defaultPadding),
                                  // border: Border.all(
                                  //     style: BorderStyle.solid,
                                  //     color: ColorConstants.greyColor.withOpacity(0.3),
                                  //     width: 1),
                                  color: ColorConstants.textFieldColor),
                              child: ClipRRect(
                                borderRadius: BorderRadius.all(Radius.circular(
                                    AppConstants.defaultPadding)),
                                child: Icon(
                                  Icons.photo,
                                  color:
                                      ColorConstants.greyColor.withOpacity(0.8),
                                ),
                              ),
                            ))
                        : Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    AppConstants.defaultPadding),
                                // border: Border.all(
                                //     style: BorderStyle.solid,
                                //     color: ColorConstants.greyColor.withOpacity(0.3),
                                //     width: 1),
                                color: ColorConstants.textFieldColor,
                                image: DecorationImage(
                                    image:FileImage(File(_selectedImagePath)),
                                    fit: BoxFit.cover)
                            ),
                          ),

                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: AppConstants.defaultPadding),
                            child: ButtonComponent(
                              StringConstants.uploadPhoto,
                              onPressed: () {
                                _openCameraGallerySelectionDialog();
                              },
                              color: ColorConstants.googleBtnColor
                                  .withOpacity(0.8),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextHeadings.simpleText(
                            StringConstants.imageFormatWithMax5mb,
                          )
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextHeadings.heading2(StringConstants.gender,
                        color: ColorConstants.textHeadingColor),
                    Row(
                      children: [
                        customOptionSelector(
                            context, StringConstants.male, selectGender, () {
                          setState(() {
                            selectGender = true;
                          });
                        }),
                        SizedBox(
                          width: 10,
                        ),
                        customOptionSelector(
                            context, StringConstants.female, !selectGender, () {
                          setState(() {
                            selectGender = false;
                          });
                        })
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 2,
                  color: ColorConstants.textFieldColor,
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextHeadings.heading2(StringConstants.age,
                        color: ColorConstants.textHeadingColor),
                    Container(
                      width: 70,
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: ColorConstants.whiteColor,
                          border: Border.all(
                              color:
                                  ColorConstants.greyColor.withOpacity(0.2))),
                      child: Center(
                        child: TextHeadings.heading1(
                            "${age.toStringAsFixed(0)} yo",
                            textAlign: TextAlign.center,
                            textScaleFactor: 1,
                            fontColor: ColorConstants.darkBlueColor),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: SliderTheme(
                    data: SliderThemeData(
                      trackShape: CustomTrackShape(),
                    ),
                    child: Slider(
                        value: age,
                        activeColor: ColorConstants.lightBlueColor,
                        inactiveColor: ColorConstants.textFieldColor,
                        min: 0,
                        max: 100,
                        onChanged: (val) {
                          setState(() {
                            age = val;
                          });
                        }),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 2,
                  color: ColorConstants.textFieldColor,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextHeadings.heading2(StringConstants.hideProfilePicture,
                        color: ColorConstants.textHeadingColor),
                    Transform.scale(
                      scale: 1.3,
                      child: Switch(
                          value: hideProfile,
                          activeColor: Colors.white,
                          activeTrackColor: Colors.green,
                          onChanged: (val) {
                            setState(() {
                              hideProfile = val;
                            });
                          }),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 2,
                    color: ColorConstants.textFieldColor,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextHeadings.heading2(StringConstants.enableLocation,
                        color: ColorConstants.textHeadingColor),
                    Transform.scale(
                      scale: 1.3,
                      child: Switch(
                          value: enAbleLocation,
                          activeColor: Colors.white,
                          activeTrackColor: Colors.green,
                          onChanged: (val) {
                            setState(() {
                              enAbleLocation = val;
                            });
                          }),
                    )
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                ButtonComponent(
                  StringConstants.done,
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) =>
                            AcknowledgementScreen(
                          title: StringConstants.gotIt,
                          subTitle: StringConstants.basedOnYourAnswer,
                          image: AssetConstants.SuccessIllustrationImage,
                          btnText: StringConstants.letGetStarted,
                          show: null,
                          showSubtitle: true,
                          clickText: '',


                          onPressed: (){
                            Navigator.of(context).pushReplacement(MaterialPageRoute(
                                builder: (context) =>BottomNavigationBarScreen()));
                          },
                        )));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  GestureDetector customOptionSelector(BuildContext context, String title,
      bool compareIndex, Function onPressed) {
    return GestureDetector(
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: AppConstants.defaultPadding, vertical: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: compareIndex
                  ? ColorConstants.googleBtnColor.withOpacity(0.1)
                  : ColorConstants.textFieldColor,
              border: Border.all(
                  color: compareIndex
                      ? ColorConstants.googleBtnColor.withOpacity(0.7)
                      : ColorConstants.textFieldColor)),
          child: Center(
            child: TextHeadings.heading1(
              "$title" ?? '',
              textAlign: TextAlign.center,
              textScaleFactor: 1,
            ),
          ),
        ),
        onTap: onPressed);
  }
}

class CustomTrackShape extends RoundedRectSliderTrackShape {
  Rect getPreferredRect({
    @required RenderBox parentBox,
    Offset offset = Offset.zero,
    @required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double trackHeight = sliderTheme.trackHeight;
    final double trackLeft = offset.dx;
    final double trackTop =
        offset.dy + (parentBox.size.height - trackHeight) / 2;
    final double trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}
