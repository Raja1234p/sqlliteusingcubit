import 'package:flutter/material.dart';
import 'package:richardproject/view/common_components/app_constants.dart';
import 'package:richardproject/view/common_components/button_component.dart';
import 'package:richardproject/view/common_components/percent_indicator_component.dart';
import 'package:richardproject/view/common_components/text_component.dart';
import 'package:richardproject/view/constants/color_constants.dart';
import 'package:richardproject/view/constants/string_constants.dart';
import 'package:richardproject/view/screens/question_two_screen.dart';

class QuestionOneScreen extends StatefulWidget {
  @override
  _QuestionOneScreenState createState() => _QuestionOneScreenState();
}

class _QuestionOneScreenState extends State<QuestionOneScreen> {
  String value = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
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
                            percent: 30,
                          ),
                        )),
                    InkWell(
                      child: TextHeadings.heading2(StringConstants.skip,
                          color: ColorConstants.lightBlueColor,
                          textScaleFactor: 1.1,
                          isBold: true),
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>QuestionTwoScreen()));

                      },
                    )
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                TextHeadings.heading1(StringConstants.questionOne),
                SizedBox(
                  height: 10,
                ),
                TextHeadings.simpleText(
                    StringConstants.selectOneOptionForThisQuestion),
                SizedBox(
                  height: 30,
                ),
                ListView.separated(
                  shrinkWrap: true,
                  separatorBuilder: (context, int index) => Container(
                    height: 10,
                  ),
                  itemCount: 3,
                  itemBuilder: (context, int index) {

                    return customOptionSelector(
                        context, index.toString(), value, () {
                      setState(() {
                        value = index.toString();
                      });
                      print('hghjg $value');
                    });
                  },
                ),

                Spacer(),
                ButtonComponent(StringConstants.next,onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>QuestionTwoScreen()));
                },),
                SizedBox(height: 20,)
              ],
            ),
          ),
        ),
      ),
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
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          child: TextHeadings.heading1("Option $index" ?? '',
              textAlign: TextAlign.left, textScaleFactor: 1.2),
        ),
        onTap:   onPressed);
  }
}
