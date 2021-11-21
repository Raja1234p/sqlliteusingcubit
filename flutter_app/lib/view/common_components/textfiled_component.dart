import 'package:flutter/material.dart';
import 'package:richardproject/view/constants/color_constants.dart';
import 'package:richardproject/view/constants/string_constants.dart';

class TextFieldComponent extends StatefulWidget {
  TextFieldComponent(
      {Key key,
        this.labelText = '',
        this.errorText,
        this.onChanged(_),
        this.onSubmitted,
        this.obscureText,
        this.textInputType,
        this.textInputAction,
        this.textEditingController,
        this.iconData,
        this.borderColor})
      : super(key: key);

  @override
  _TextFieldComponentState createState() => _TextFieldComponentState();

  final String labelText;
  final String errorText;
  final Function(String) onChanged;
  final Function(String) onSubmitted;
  bool obscureText;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final TextEditingController textEditingController;
  final Widget iconData;

  final bool borderColor;
}

class _TextFieldComponentState extends State<TextFieldComponent> {
  TextEditingController textEditingController = TextEditingController();
  String valid = '';
  bool borderColor;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              color: ColorConstants.textFieldColor,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                  color: widget.borderColor == null
                      ? ColorConstants.textFieldColor
                      :widget.borderColor
                      ? Colors.red
                      : ColorConstants.lightBlueColor,
                  width: 2)),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16) ,
              child: TextFormField(

                controller: widget.textEditingController,
                textInputAction: widget.textInputAction == null
                    ? null
                    : widget.textInputAction,
                obscureText: widget.obscureText==null?false:widget.obscureText,
                onChanged: widget.onChanged,
                onFieldSubmitted: (val) {
                  widget.onSubmitted(val);
                },
                cursorColor: ColorConstants.greyColor,
                keyboardType:
                widget.textInputType == null ? null : widget.textInputType,

                style: TextStyle(
                    color: ColorConstants.textHeadingColor, fontSize: 15),
                decoration: InputDecoration(
                  contentPadding:  EdgeInsets.only(top:0.0,bottom:0.0),
                  border: InputBorder.none,
                  filled: true,
                  helperMaxLines: 0,
                  isDense: true,

//
                  labelText: widget.labelText,
                  labelStyle: TextStyle(color: ColorConstants.greyColor,height: 0.6),
                  fillColor: ColorConstants.textFieldColor,
                  suffix: widget.obscureText == null
                      ? Text('')
                      : InkWell(
                    child: Icon(
                        Icons.remove_red_eye,
                        size: 20,
                        color: widget.obscureText==null?
                        Colors.transparent:widget.obscureText? ColorConstants.greyColor
                            : ColorConstants.lightBlueColor
                    ),
                    onTap: (){
                      setState(() {
                        widget.obscureText=!widget.obscureText;
                      });
                    },
                  ),
                  icon: widget.iconData == null
                      ? Text('')
                      : widget.iconData,
                  // prefixIconConstraints:
                  //     BoxConstraints(minWidth: 0, minHeight: 0),
                  suffixIconConstraints:
                  BoxConstraints(minWidth: 0, minHeight: 0),
                ),
              ),
            ),
          ),
        ),

        widget.errorText==null?Container(): Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Text(
            widget.errorText,
            style: TextStyle(color: Colors.red.shade700),
          ),
        )
      ],
    );
  }
}
