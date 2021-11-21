import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:richardproject/view/constants/color_constants.dart';

import 'app_constants.dart';


class BottomSheetViewWrapper extends StatelessWidget {
  final List<Widget> content;
  final bool removeBlur;
  final Color backgroundColor;

  BottomSheetViewWrapper(this.content,
      {this.removeBlur = false, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    final double _radiusCircular = 15;
    return Container(
      color: backgroundColor == null ? Colors.grey.withOpacity(1) : backgroundColor,
      
      child: BackdropFilter(
        filter: ImageFilter.blur(
            sigmaX: removeBlur ? 0 : 2.5, sigmaY: removeBlur ? 0 : 2.5),
        child: Container(
          padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.defaultPadding),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40))),
          child: new Wrap(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 15),
                child: Center(
                    child: Container(
                      height: 5,
                      width: MediaQuery.of(context).size.width * 0.1,
                      decoration: BoxDecoration(
                          color: ColorConstants.greyColor,
                          borderRadius: BorderRadius.circular(20)),
                    )),
              ),
              for (int i = 0; i < content.length; i++) content[i]
            ],
          ),
        ),
      ),
    );
  }
}
