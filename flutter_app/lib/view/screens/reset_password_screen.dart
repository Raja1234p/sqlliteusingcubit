import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:richardproject/view/common_components/acknowledgement_screen.dart';
import 'package:richardproject/view/common_components/app_constants.dart';
import 'package:richardproject/view/common_components/button_component.dart';
import 'package:richardproject/view/common_components/text_component.dart';
import 'package:richardproject/view/common_components/textfiled_component.dart';
import 'package:richardproject/view/constants/assets_constants.dart';
import 'package:richardproject/view/constants/color_constants.dart';
import 'package:richardproject/view/constants/string_constants.dart';
import 'package:richardproject/view/screens/create_new_password_screen.dart';

class ResetPasswordScreen extends StatefulWidget {
  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  TextEditingController _emailTextEditingController;

  @override
  void initState() {
    super.initState();
    _emailTextEditingController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailTextEditingController.dispose();
  }

  static const Pattern _emailPattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  String emailError = '';

  bool emailBorderColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: AppConstants.defaultPadding,
            horizontal: AppConstants.defaultPadding),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 5,
                  ),
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
                          child: Icon(
                            Icons.arrow_back_ios_rounded,
                            color: ColorConstants.textHeadingColor,
                          ))),
                ],
              ),
              SizedBox(
                height: 60,
              ),
              TextHeadings.heading1(StringConstants.resetPassword,
                  letterSpacing: 1),
              SizedBox(
                height: 15,
              ),
              TextHeadings.heading2(StringConstants.enterTheAssociatedEmail,
                  color: ColorConstants.greyColor, textScaleFactor: 1),
              SizedBox(
                height: 50,
              ),
              TextFieldComponent(
                textEditingController: _emailTextEditingController,
                labelText: StringConstants.email,
                iconData: Icon(
                  Icons.email,
                  color: ColorConstants.greyColor,
                ),
                errorText: emailError,
                borderColor: emailBorderColor,
                onChanged: (val) {
                  if (val.isEmpty) {
                    setState(() {
                      emailError = 'Empty field';
                      emailBorderColor = true;
                    });
                  } else if (!_isEmailValid(val)) {
                    setState(() {
                      emailError = 'Invalid email';
                      emailBorderColor = true;
                    });
                  } else {
                    setState(() {
                      emailError = '';
                      emailBorderColor = false;
                    });
                  }
                  print(val);
                },
                onSubmitted: (val) {
                  if (val.isEmpty) {
                    setState(() {
                      emailError = '';
                      emailBorderColor = null;
                    });
                  } else if (_isEmailValid(val)) {
                    setState(() {
                      emailError = '';
                      emailBorderColor = null;
                    });
                  }
                },
              ),
              Spacer(),
              ButtonComponent(
                StringConstants.next,
                onPressed: () {
                  if (_emailTextEditingController.text.isEmpty) {
                    setState(() {
                      emailError = 'Empty field';
                      emailBorderColor = true;
                    });
                  } else if (!_isEmailValid(_emailTextEditingController.text)) {
                    setState(() {
                      emailError = 'Invalid Email';
                      emailBorderColor = true;
                    });
                  } else {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => AcknowledgementScreen(
                              image: AssetConstants.mailIllustrationImage,
                              title: StringConstants.checkYourMail,
                              show: true,
                              showLastText: true,
                              btnText: StringConstants.openMailApp,
                              subTitle: StringConstants
                                  .weHaveSentAPasswordRecoverEmail,
                              lastText: StringConstants.doNotReceiveEmail,
                              clickText: StringConstants.or,
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        CreateNewPasswordScreen()));
                              },
                            )));
                  }
                },
              ),
              SizedBox(
                height: 25,
              ),
            ],
          ),
        ),
      )),
    );
  }

  static bool _isEmailValid(String email) {
    RegExp regexEmail = new RegExp(_emailPattern);
    return regexEmail.hasMatch(email);
  }
}
