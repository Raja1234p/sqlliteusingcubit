import 'package:flutter/material.dart';
import 'package:richardproject/view/common_components/acknowledgement_screen.dart';
import 'package:richardproject/view/common_components/app_constants.dart';
import 'package:richardproject/view/common_components/button_component.dart';
import 'package:richardproject/view/common_components/text_component.dart';
import 'package:richardproject/view/common_components/textfiled_component.dart';
import 'package:richardproject/view/constants/assets_constants.dart';

import 'package:richardproject/view/constants/color_constants.dart';
import 'package:richardproject/view/constants/string_constants.dart';
import 'package:richardproject/view/screens/login_Screen.dart';


class CreateNewPasswordScreen extends StatefulWidget {
  @override
  _CreateNewPasswordScreenState createState() => _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  TextEditingController _passwordTextEditingController;
  TextEditingController _confirmPasswordTextEditingController;

  @override
  void initState() {
    super.initState();
    _passwordTextEditingController = TextEditingController();
    _confirmPasswordTextEditingController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _passwordTextEditingController.dispose();
    _confirmPasswordTextEditingController.dispose();
  }

  static const Pattern _passwordMinLen8withLowerCaseAndSpecialChar =
      r'^((?=.*\d)(?=.*[a-z])(?=.*[\W_]).{8,20})';

  String emailError = '';
  String passwordError = '';
  bool emailBorderColor;
  bool passwordBorderColor;
  bool isCheck=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                vertical: AppConstants.defaultPadding,
                horizontal: AppConstants.defaultPadding),
            child: SingleChildScrollView(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height-50,
                child: Column(
                  children: [

                  SizedBox(height: 30,),
                Row(
                  children: [
                    SizedBox(width: 5,),
                    GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
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

                  ],
                ),
                    SizedBox(
                      height: 60,
                    ),
                    TextHeadings.heading1(StringConstants.createNewPassword,
                        letterSpacing: 1),
                    SizedBox(
                      height: 15,
                    ),
                    TextHeadings.heading2(StringConstants.newPasswordMustBeDifferent,
                        color: ColorConstants.greyColor,textScaleFactor: 1),


                    SizedBox(
                      height: 40,
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
                        } else if (!_isPasswordValid(val,_passwordMinLen8withLowerCaseAndSpecialChar)) {
                          setState(() {
                            passwordError = 'Password must contain 8 special characters(_,/,A,a)';
                            passwordBorderColor = true;
                          });
                        }
                        else{
                          setState(() {
                            passwordError = '';
                            passwordBorderColor = false;
                          });
                        }
                        print(val);
                      },
                      onSubmitted: (val){
                        if(val.isEmpty){
                          setState(() {
                            passwordError = '';
                            passwordBorderColor = null;
                          });
                        }
                        else if (_isPasswordValid(val,_passwordMinLen8withLowerCaseAndSpecialChar)) {
                          setState(() {
                            passwordError = '';
                            passwordBorderColor = null;
                          });
                        }
                      },
                    ),
                    TextFieldComponent(
                      textEditingController: _confirmPasswordTextEditingController,
                      labelText: StringConstants.confirmPassword,
                      iconData: Icon(
                        Icons.lock_outline,
                        color: ColorConstants.greyColor,
                      ),
                      obscureText: true,
                      errorText: emailError,
                      borderColor: emailBorderColor,
                      onChanged: (val) {
                        if (val.isEmpty) {
                          setState(() {
                            emailError = 'Empty field';
                            emailBorderColor = true;
                          });
                        } else if (val!=_passwordTextEditingController.text) {
                          setState(() {
                            emailError = 'Both password must match';
                            emailBorderColor = true;
                          });
                        }
                        else{
                          setState(() {
                            emailError = '';
                            emailBorderColor = false;
                          });
                        }
                        print(val);
                      },
                      onSubmitted: (val){
                        if(val.isEmpty){
                          setState(() {
                            emailError = '';
                            emailBorderColor = null;
                          });
                        }
                        else if (val==_passwordTextEditingController.text) {
                          setState(() {
                            emailError = '';
                            emailBorderColor = null;
                          });
                        }
                      },
                    ),

                    Spacer(),
                    ButtonComponent(
                      StringConstants.resetPassword,
                      onPressed: () {
                        if(_confirmPasswordTextEditingController.text.isEmpty&&_passwordTextEditingController.text.isEmpty){
                          setState(() {
                            emailError='Empty field';
                            emailBorderColor=true;
                            passwordError='Empty field';
                            passwordBorderColor=true;
                          });
                        }
                        else if(_passwordTextEditingController.text.isEmpty){
                          setState(() {
                            emailError='Empty field';
                            emailBorderColor=true;
                          });
                        }
                        else if(_confirmPasswordTextEditingController.text.isEmpty){
                          setState(() {
                            emailError='Empty field';
                            emailBorderColor=true;
                          });
                        }
                        else if(_confirmPasswordTextEditingController.text!=_passwordTextEditingController.text){
                          setState(() {
                            emailError='Both password must match';
                            emailBorderColor=true;
                          });
                        }
                        else{
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginScreen()));}




                      },
                    ),
                    SizedBox(
                      height: 25,
                    ),

                  ],
                ),
              ),
            ),
          )),
    );
  }


  static _isPasswordValid(String password, String pattern) {
    RegExp regexPassword = new RegExp(pattern);
    return regexPassword.hasMatch(password);
  }
}
