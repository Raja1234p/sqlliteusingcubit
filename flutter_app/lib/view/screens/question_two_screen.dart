import 'package:flutter/material.dart';
import 'package:richardproject/view/common_components/app_constants.dart';
import 'package:richardproject/view/common_components/button_component.dart';
import 'package:richardproject/view/common_components/percent_indicator_component.dart';
import 'package:richardproject/view/common_components/text_component.dart';
import 'package:richardproject/view/constants/color_constants.dart';
import 'package:richardproject/view/constants/string_constants.dart';
import 'package:richardproject/view/screens/question_three_screen.dart';

class QuestionTwoScreen extends StatefulWidget {
  @override
  _QuestionTwoScreenState createState() => _QuestionTwoScreenState();
}

class _QuestionTwoScreenState extends State<QuestionTwoScreen> {
  String value = '';
  List<String> selectedValue;
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
                            percent: 60,
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
                TextHeadings.heading1(StringConstants.questionTwo),
                SizedBox(
                  height: 10,
                ),
                TextHeadings.simpleText(
                    StringConstants.selectUpTo3Question),
                SizedBox(
                  height: 30,
                ),
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 11,
                    mainAxisSpacing: 10,
                    childAspectRatio: MediaQuery.of(context).size.width /
                        (MediaQuery.of(context).size.height / 3.2),

                  ),
                  itemBuilder: (
                      context,
                      index,
                      ) {

                    return customOptionSelector(
                        context, index.toString(), value, () {
                          
                      setState(() {
                        value = index.toString();
                      });
                      print('hghjg $value');
                    }
                    );
                  },
                  itemCount: 10,
                ),
                SizedBox(height: 20,),
                ButtonComponent(StringConstants.next,onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>QuestionThreeScreen()));
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

          child: Center(
            child: TextHeadings.heading1("Option $index" ?? '',
                textAlign: TextAlign.center, textScaleFactor: 1.2),
          ),
        ),
        onTap:   onPressed);
  }
}
