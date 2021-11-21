import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:richardproject/view/common_components/app_constants.dart';
import 'package:richardproject/view/common_components/appbar_component.dart';
import 'package:richardproject/view/common_components/text_component.dart';
import 'package:richardproject/view/constants/assets_constants.dart';
import 'package:richardproject/view/constants/color_constants.dart';
import 'package:richardproject/view/constants/string_constants.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool enableLocationServices = true;

  int ratting;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

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
                height: 15,
              ),
              AppbarComponent(
                title: StringConstants.profile,
                showIconAtTrailing: true,
                hideBackButton: true,
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        color: ColorConstants.darkestBlueColor,
                        borderRadius:
                            BorderRadius.circular(AppConstants.roundedBorder),
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
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        AssetConstants.accountSVG,
                        fit: BoxFit.cover,
                        height: 20,
                        width: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextHeadings.heading1(StringConstants.account,
                            textScaleFactor: 1.2),
                        SizedBox(
                          height: 5,
                        ),
                        TextHeadings.heading2(
                            StringConstants.editAndManageYourAccountDetails,
                            color: ColorConstants.greyColor,
                            textScaleFactor: 1),
                      ],
                    ),
                  ),
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
                              TextHeadings.heading1('Gerry Kingsman',
                                  textScaleFactor: 1.2),
                              SizedBox(
                                height: 5,
                              ),
                              TextHeadings.heading2('UI Designer, California',
                                  color: ColorConstants.greyColor,
                                  textScaleFactor: 1),
                            ],
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_sharp,
                          color: Color(0xff2A9DF4),
                          size: 20,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextHeadings.simpleText(
                                StringConstants.email,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              TextHeadings.heading1('testing@gmail.com',
                                  textScaleFactor: 1,
                                  fontWeight: FontWeight.w500),
                            ],
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_sharp,
                          color: Color(0xff2A9DF4),
                          size: 20,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextHeadings.simpleText(
                                StringConstants.userName,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              TextHeadings.heading1('Gerry Kingsman',
                                  textScaleFactor: 1,
                                  fontWeight: FontWeight.w500),
                              SizedBox(
                                height: 20,
                              )
                            ],
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_sharp,
                          color: Color(0xff2A9DF4),
                          size: 20,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        color: ColorConstants.lightBlueColor,
                        borderRadius:
                            BorderRadius.circular(AppConstants.roundedBorder),
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
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        AssetConstants.lockSVg,
                        fit: BoxFit.cover,
                        height: 20,
                        width: 20,
                        color: ColorConstants.whiteColor,
                      ),
                    ),
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
                            StringConstants.privacyAndSecurity,
                            textScaleFactor: 1.2),
                        SizedBox(
                          height: 5,
                        ),
                        TextHeadings.heading2(
                            StringConstants.setYourPrivacyLikePassword,
                            color: ColorConstants.greyColor,
                            textScaleFactor: 1),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.only(
                    left: AppConstants.defaultPadding,
                    top: AppConstants.defaultPadding,
                    right: AppConstants.defaultPadding),
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextHeadings.heading1(StringConstants.changePassword,
                            textScaleFactor: 1.2, fontWeight: FontWeight.w600),
                        Icon(
                          Icons.arrow_forward_ios_sharp,
                          color: Color(0xff2A9DF4),
                          size: 20,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: width,
                      height: 1,
                      color: ColorConstants.greyColor.withOpacity(0.3),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextHeadings.heading1(StringConstants.locationService,
                            textScaleFactor: 1.2, fontWeight: FontWeight.w600),
                        Transform.scale(
                          scale: 1.3,
                          child: Switch(
                              value: enableLocationServices,
                              activeColor: Colors.white,
                              activeTrackColor: Colors.green,
                              onChanged: (val) {
                                setState(() {
                                  enableLocationServices = val;
                                });
                              }),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        color: ColorConstants.lightBlueColor,
                        borderRadius:
                            BorderRadius.circular(AppConstants.roundedBorder),
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
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        AssetConstants.headphonesSVG,
                        fit: BoxFit.cover,
                        height: 20,
                        width: 20,
                        color: ColorConstants.whiteColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextHeadings.heading1(StringConstants.support,
                            textScaleFactor: 1.2),
                        SizedBox(
                          height: 5,
                        ),
                        TextHeadings.heading2(StringConstants.callCenterSupport,
                            color: ColorConstants.greyColor,
                            textScaleFactor: 1),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }

  BoxDecoration cardDecoration() {
    return BoxDecoration(
        color: ColorConstants.googleBtnColor,
        borderRadius: BorderRadius.circular(AppConstants.defaultPadding));
  }
}
