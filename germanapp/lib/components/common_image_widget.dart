import 'package:flutter/cupertino.dart';
import 'package:rimattire/components/size_config.dart';

class CommonImageWidget{




  static Widget categoryImageListWidget(String assetName, {double height}) {

    return Container(
      height: height == null ? double.infinity : height,
      width: SizeConfig.screenWidth / 5.5,
      child: ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(6),
        ),
        child: Image.asset(
          assetName,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}