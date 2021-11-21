import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rimattire/constants/colors/colors_constants.dart';

class CustomCheckBox extends StatefulWidget {
  final Function onpressedofCheckBox;
  final bool isCheckUnCheck;
  final Color checkColor;
  const CustomCheckBox(
      {Key key,
      this.isCheckUnCheck = false,
      this.onpressedofCheckBox,
      this.checkColor})
      : super(key: key);

  @override
  _CustomCheckBoxState createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: widget.isCheckUnCheck
          ? Container(
              padding: EdgeInsets.all(1),
              child: Icon(
                Icons.check,
                size: 15,
                color: ColorConstant.white,
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: widget.checkColor != null
                    ? widget.checkColor
                    : ColorConstant.blueColor,
              ),
            )
          : Container(
              padding: EdgeInsets.all(1),
              child: Icon(
                Icons.check,
                size: 15,
                color: ColorConstant.white.withOpacity(0.1),
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ColorConstant.lightgreytype.withOpacity(0.5),
              ),
            ),
      onTap: widget.onpressedofCheckBox,
    );
  }
}
