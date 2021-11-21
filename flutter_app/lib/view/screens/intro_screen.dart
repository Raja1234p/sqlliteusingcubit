import 'package:flutter/material.dart';
import 'package:richardproject/view/common_components/app_constants.dart';
import 'package:richardproject/view/common_components/button_component.dart';
import 'package:richardproject/view/common_components/text_component.dart';
import 'package:richardproject/view/constants/assets_constants.dart';
import 'package:richardproject/view/constants/color_constants.dart';
import 'package:richardproject/view/constants/string_constants.dart';
import 'package:richardproject/view/common_components/text_component.dart';
import 'package:richardproject/view/screens/login_Screen.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AssetConstants.conversationImage),
                fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.defaultPadding,
              vertical: AppConstants.defaultPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: TextHeadings.heading1(StringConstants.logo.toUpperCase(),
                    fontColor: ColorConstants.lightBlueColor, letterSpacing: 1),
              ),

              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextHeadings.heading2(StringConstants.weCanWorkTogether,
                    color: Colors.white,
                    isBold: true),
                  SizedBox(height: 20,),

                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        for(int i=1;i<=3;i++)
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 2),
                              child: Container(
                                height: 5,
                                width: 5,
                                decoration: BoxDecoration(
                                  shape:  BoxShape.circle,
                                  color:  ColorConstants.whiteColor
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  SizedBox(height: 20,),
                  ButtonComponent(StringConstants.getStarted,onPressed: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                  },
                  color: ColorConstants.lightBlueColor,
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextHeadings.heading2("${StringConstants.alreadySign}?",
                      textScaleFactor: 1
                      ),
                      SizedBox(width: 3,),
                      TextHeadings.heading2(StringConstants.signIn,
                          textScaleFactor: 1,
                        color: ColorConstants.googleBtnColor
                      ),
                      SizedBox(height: 40,),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
