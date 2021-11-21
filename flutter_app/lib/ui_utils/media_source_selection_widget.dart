import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:richardproject/view/constants/string_constants.dart';
import 'dart:io';
import 'custom_image_preview.dart';



class MediaSourceSelectionWidget extends StatefulWidget {
  final GestureTapCallback onTapGallery, onTapCamera;
  final Function(String) onImagePath;

  const MediaSourceSelectionWidget(
      {Key key, this.onTapGallery, this.onTapCamera, this.onImagePath})
      : super(key: key);

  @override
  _MediaSourceSelectionWidgetState createState() =>
      _MediaSourceSelectionWidgetState();
}

class _MediaSourceSelectionWidgetState
    extends State<MediaSourceSelectionWidget> {
  List<PickedFile> prescription = new List<PickedFile>();
  final ImagePicker _picker = ImagePicker();
  PickedFile profileImage;

  bool isCameraReady = false;
  bool showCapturedPhoto = false;
  bool isImageSelectedCamera = false;
  String imagePath;

  @override
  Widget build(BuildContext context) {

    return AlertDialog(
      title: Text(StringConstants.mediaSelection),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            InkWell(
              enableFeedback: true,
              child: ListTile(
                leading: Icon(Icons.photo),
                title: Text(StringConstants.gallery),
              ),
              onTap: () {
                getImage(context);
              },
            ),
            Padding(padding: EdgeInsets.all(8.0)),
            InkWell(
              enableFeedback: true,
              child: ListTile(
                leading: Icon(Icons.camera),
                title: Text(StringConstants.camera),
              ),
              onTap: () {
                getImageCamera(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  var pickedImage;
  Future getImage(BuildContext context) async {
    pickedImage = await _picker.getImage(
        source: ImageSource.gallery, preferredCameraDevice: CameraDevice.front);
    if (pickedImage != null) {
      imagePath = pickedImage.path;
      showCustomImageView(context, false);
    }
  }

  Future getImageCamera(BuildContext context) async {
    pickedImage = await _picker.getImage(source: ImageSource.camera);
    if (pickedImage != null) {
      imagePath = pickedImage.path;
      showCustomImageView(context, true);
    } else {
      print('No image selected.');
    }
  }

  void showCustomImageView(BuildContext context, bool imageSelectedCamera) {
    showDialog(
      context: context,
      builder: (_) => CustomImagePreview(
        path: imagePath,
        // imageCroped: () {
        //   _cropImage(pickedImage.path);
        // },
        // onButtonSubmit: () {
        //   widget.onImagePath(imagePath);
        //   Navigator.pop(context);
        //   Navigator.pop(context);
        // },
        onImagePath: (imagePath) {
          widget.onImagePath(imagePath);
          Navigator.pop(context);
          Navigator.pop(context);
        },
        onButtonCancel: () {
          Navigator.pop(context);
          if (isImageSelectedCamera) {
            deleteFile(imagePath);
          }
        },
      ),
    );
  }

  Future<void> deleteFile(String path) async {
    try {
      final file = File(path);
      await file.delete();
    } catch (e) {
      return 0;
    }
  }
}
