import 'package:flutter/material.dart';
import 'package:richardproject/view/common_components/app_constants.dart';
import 'package:richardproject/view/common_components/button_component.dart';
import 'package:richardproject/view/common_components/text_component.dart';
import 'package:richardproject/view/constants/color_constants.dart';
import 'package:richardproject/view/constants/string_constants.dart';

class AcknowledgementScreen extends StatefulWidget {
  const AcknowledgementScreen(
      {Key key,
      this.image,
      this.title = '',
      this.subTitle = '',
      this.btnText = '',
      this.lastText = '',
      this.clickText = '',
      this.showSubtitle = false,
      this.show,
      this.onPressed,
      this.secondClickText = '',
      this.showLastText = false})
      : super(key: key);

  @override
  _AcknowledgementScreenState createState() => _AcknowledgementScreenState();
  final String image;
  final String title;
  final String subTitle;
  final String btnText;
  final String lastText;
  final String clickText;
  final bool show;
  final Function onPressed;
  final String secondClickText;
  final bool showLastText;
  final bool showSubtitle;
}

class _AcknowledgementScreenState extends State<AcknowledgementScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.lightBlueColor,
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.defaultPadding,
                vertical: AppConstants.defaultPadding),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                widget.image == null ? Container() : Image.asset(widget.image),
                SizedBox(
                  height: 20,
                ),
                TextHeadings.heading1(widget.title, fontColor: Colors.white),
                SizedBox(
                  height: 10,
                ),
                TextHeadings.simpleText(widget.subTitle,
                    color: Colors.white.withOpacity(0.6)),
                SizedBox(
                  height: 3,
                ),

                widget.showSubtitle? RichText(
                  text: TextSpan(
                      text: widget.showSubtitle
                          ? StringConstants.youShouldAt
                          : '',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.6),
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: widget.showSubtitle
                              ? " ${StringConstants.highLevel}"
                              : '',
                          style: TextStyle(
                            color: ColorConstants.googleBtnColor,
                          ),
                        )
                      ]),
                ):
                    Text(''),

                Spacer(),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ButtonComponent(
                      widget.btnText,
                      color: ColorConstants.googleBtnColor,
                      onPressed: () {
                        widget.onPressed();
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextHeadings.simpleText(widget.lastText,
                        color: Colors.white),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextHeadings.simpleText(widget.clickText,
                            color: Colors.white),
                        SizedBox(
                          width: 4,
                        ),
                        widget.showLastText
                            ? TextHeadings.underLineText(
                            widget.showLastText?   StringConstants.tryAnotherEmailAddress:'',
                                color: ColorConstants.googleBtnColor)
                            : Container(),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
