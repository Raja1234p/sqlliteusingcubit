import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:richardproject/ui_utils/media_source_selection_widget.dart';
import 'package:richardproject/view/common_components/app_constants.dart';
import 'package:richardproject/view/constants/color_constants.dart';

class ProfileImageWithPicker extends StatefulWidget {
  const ProfileImageWithPicker(
      {Key key, this.image = 'assets/images/placeholder.jpg', this.showSVG=false, this.onPressed})
      : super(key: key);

  @override
  _ProfileImageWithPickerState createState() => _ProfileImageWithPickerState();
  final String image;
  final bool showSVG;
  final Function onPressed;
}

class _ProfileImageWithPickerState extends State<ProfileImageWithPicker> {
  String _selectedImagePath = '';

  _openCameraGallerySelectionDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return MediaSourceSelectionWidget(
            onTapGallery: () {
              Navigator.pop(context);
            },
            onTapCamera: () {},
            onImagePath: (String imagePath) {
              _selectedImagePath = imagePath;
              setState(() {});
              print('$_selectedImagePath it is working');
            },
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        DottedBorder(
        dashPattern: [6, 6, 6, 6],
        strokeWidth: 2,
        borderType: BorderType.RRect,
        radius: Radius.circular(AppConstants.defaultPadding),
        color: widget.image!=null?Colors.transparent: ColorConstants.greyColor.withOpacity(0.8),
          child: Container(
            height: width * .28,
            width: width * .29,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                  AppConstants.defaultPadding),

              color: ColorConstants.textFieldColor,
                image: DecorationImage(
                    image: _selectedImagePath == ''
                        ? AssetImage(widget.image)

                        : FileImage(File(_selectedImagePath)),
                    fit: BoxFit.cover)),
          ),
        ),
        GestureDetector(
          onTap: _openCameraGallerySelectionDialog,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                    BorderRadius.circular(AppConstants.roundedBorder)),
                padding: const EdgeInsets.all(6),
                child: Icon(Icons.camera_alt, size: 18)),
          ),
        )
      ],
    );
  }
}
