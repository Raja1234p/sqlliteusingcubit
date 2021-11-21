import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:richardproject/view/common_components/app_constants.dart';
import 'package:richardproject/view/common_components/button_component.dart';
import 'package:richardproject/view/common_components/text_component.dart';
import 'package:richardproject/view/common_components/textfiled_component.dart';
import 'package:richardproject/view/constants/assets_constants.dart';
import 'package:richardproject/view/constants/color_constants.dart';
import 'package:richardproject/view/constants/string_constants.dart';

import 'login_Screen.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController _passwordTextEditingController;
  TextEditingController _emailTextEditingController;
  TextEditingController _userNameTextEditingController;

  @override
  void initState() {
    super.initState();
    _passwordTextEditingController = TextEditingController();
    _emailTextEditingController = TextEditingController();
    _userNameTextEditingController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _passwordTextEditingController.dispose();
    _emailTextEditingController.dispose();
    _userNameTextEditingController.clear();
  }

  static const Pattern _passwordMinLen8withLowerCaseAndSpecialChar =
      r'^((?=.*\d)(?=.*[a-z])(?=.*[\W_]).{8,20})';
  static const Pattern _emailPattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  String emailError = '';
  String passwordError = '';
  bool emailBorderColor;
  bool passwordBorderColor;
  bool isCheck = false;
  String userName = '';
  bool userNameBorderColor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: AppConstants.defaultPadding,
            horizontal: AppConstants.defaultPadding),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: TextHeadings.heading1(
                      StringConstants.logo.toUpperCase(),
                      fontColor: ColorConstants.lightBlueColor,
                      letterSpacing: 1),
                ),
                SizedBox(
                  height: 60,
                ),
                TextHeadings.heading1(StringConstants.registration,
                    letterSpacing: 1),
                SizedBox(
                  height: 15,
                ),
                TextHeadings.heading2(StringConstants.createAnAccount,
                    color: ColorConstants.greyColor),
                SizedBox(
                  height: 50,
                ),
                TextFieldComponent(
                  textEditingController: _userNameTextEditingController,
                  labelText: 'Full name',
                  iconData: Icon(
                    Icons.person,
                    color: ColorConstants.greyColor,
                  ),
                  errorText: userName,
                  borderColor: userNameBorderColor,
                  onChanged: (val) {
                    if (val.isEmpty) {
                      setState(() {
                        userName = 'Empty field';
                        userNameBorderColor = true;
                      });
                    } else {
                      setState(() {
                        userName = '';
                        userNameBorderColor = false;
                      });
                    }
                    print(val);
                  },
                  onSubmitted: (val) {
                    if (val.isEmpty) {
                      setState(() {
                        userName = '';
                        userNameBorderColor = null;
                      });
                    }
                  },
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
                TextFieldComponent(
                  textEditingController: _passwordTextEditingController,
                  labelText: StringConstants.password,
                  iconData: Icon(
                    Icons.lock_outline,
                    color: ColorConstants.greyColor,
                  ),
                  obscureText: true,
                  errorText: passwordError,
                  borderColor: passwordBorderColor,
                  onChanged: (val) {
                    if (val.isEmpty) {
                      setState(() {
                        passwordError = 'Empty field';
                        passwordBorderColor = true;
                      });
                    } else if (!_isPasswordValid(
                        val, _passwordMinLen8withLowerCaseAndSpecialChar)) {
                      setState(() {
                        passwordError =
                            'Password must contain 8 special characters(_,/,A,a)';
                        passwordBorderColor = true;
                      });
                    } else {
                      setState(() {
                        passwordError = '';
                        passwordBorderColor = false;
                      });
                    }
                    print(val);
                  },
                  onSubmitted: (val) {
                    if (val.isEmpty) {
                      setState(() {
                        passwordError = '';
                        passwordBorderColor = null;
                      });
                    } else if (_isPasswordValid(
                        val, _passwordMinLen8withLowerCaseAndSpecialChar)) {
                      setState(() {
                        passwordError = '';
                        passwordBorderColor = null;
                      });
                    }
                  },
                ),
                Row(
                  children: [
                    InkWell(
                      child: Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: isCheck
                                    ? Colors.green
                                    : ColorConstants.greyColor,
                                width: 1),
                            borderRadius: BorderRadius.circular(6),
                            color: isCheck ? Colors.green : Colors.white),
                        child: Icon(
                          Icons.check,
                          color: isCheck ? Colors.white : Colors.transparent,
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          isCheck = !isCheck;
                        });
                      },
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    TextHeadings.simpleText(StringConstants.iAgreeWith),
                    SizedBox(
                      width: 4,
                    ),
                    TextHeadings.underLineText(StringConstants.forgotPassword),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                ButtonComponent(
                  StringConstants.register,
                  onPressed: () {
                    if (_emailTextEditingController.text.isEmpty &&
                        _passwordTextEditingController.text.isEmpty &&
                        _userNameTextEditingController.text.isEmpty) {
                      setState(() {
                        emailError = 'Empty field';
                        emailBorderColor = true;
                        passwordError = 'Empty field';
                        passwordBorderColor = true;
                        userName = 'Empty field';
                        userNameBorderColor = true;
                      });
                    } else if (_emailTextEditingController.text.isEmpty) {
                      setState(() {
                        emailError = 'Empty field';
                        emailBorderColor = true;
                      });
                    } else if (!_isEmailValid(
                        _emailTextEditingController.text)) {
                      setState(() {
                        emailError = 'Invalid Email';
                        emailBorderColor = true;
                      });
                    } else if (_passwordTextEditingController.text.isEmpty) {
                      setState(() {
                        passwordError = 'Empty field';
                        passwordBorderColor = true;
                      });
                    } else if (!_isPasswordValid(
                        _passwordTextEditingController.text,
                        _passwordMinLen8withLowerCaseAndSpecialChar)) {
                      setState(() {
                        passwordError =
                            'Password must contain 8 special characters(_,/,A,a)';
                        passwordBorderColor = true;
                      });
                    } else {

                    }
                  },
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 2,
                        color: ColorConstants.greyColor.withOpacity(0.3),
                      ),
                    ),
                    Container(
                        decoration: BoxDecoration(
                            color: ColorConstants.greyColor.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(40)),
                        padding:
                            EdgeInsets.symmetric(horizontal: 13, vertical: 3),
                        child: Center(
                          child: TextHeadings.simpleText(StringConstants.or,
                              color: ColorConstants.textHeadingColor),
                        )),
                    Expanded(
                      flex: 1,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 2,
                        color: ColorConstants.greyColor.withOpacity(0.3),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: ButtonComponent(
                          StringConstants.google,
                          color: ColorConstants.googleBtnColor,
                          image: AssetConstants.facebookImage,
                          onPressed: () {},
                        )),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        flex: 1,
                        child: ButtonComponent(
                          StringConstants.facebook,
                          image: AssetConstants.facebookImage,
                          onPressed: () {},
                        )),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextHeadings.simpleText(StringConstants.alreadySign),
                      SizedBox(
                        width: 2,
                      ),
                      TextHeadings.simpleText(StringConstants.signIn,
                          color: ColorConstants.lightBlueColor, isBold: true),
                    ],
                  ),
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }

  static bool _isEmailValid(String email) {
    RegExp regexEmail = new RegExp(_emailPattern);
    return regexEmail.hasMatch(email);
  }

  static _isPasswordValid(String password, String pattern) {
    RegExp regexPassword = new RegExp(pattern);
    return regexPassword.hasMatch(password);
  }
}
