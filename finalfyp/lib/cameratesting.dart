import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:flutter/cupertino.dart';

class CameraTesting extends StatefulWidget {
  const CameraTesting( this.imagePickFn,this.context);
  final BuildContext context;

  @override
  _CameraTestingState createState() => _CameraTestingState();

  final void Function(File pickedImage) imagePickFn;
}

class _CameraTestingState extends State<CameraTesting> {


 File _image;



  imgFromCamera() async {
    // ignore: deprecated_member_use
    File image = await ImagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 40
    );

    setState(() {
      _image = image;
    });

    widget.imagePickFn(image);
  }

  // uploadImageToFirebase() async {
  //   Reference reference = FirebaseStorage.instance.ref().child("SupportChatImages").child('filename');
  //
  //   UploadTask uploadTask =  reference.putFile(_image);
  //
  //   uploadTask.whenComplete(() async{
  //
  //     try{
  //
  //        imageUrl = await reference.getDownloadURL();
  //     }catch(onError){
  //       print("Error");
  //     }
  //
  //     print(imageUrl);
  //
  //   });
  // }


  _imgFromGallery() async {
    // ignore: deprecated_member_use
    File image = await  ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 40
    );

    setState(() {
      _image = image;
    });

    widget.imagePickFn(image);
  }


  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        children: <Widget>[

          Center(
            child: GestureDetector(
              onTap: () {
                _showPicker(context);
              },
              child: CircleAvatar(
                radius: 55,
                backgroundColor: Color(0xffFDCF09),
                // ignore: unnecessary_null_comparison
                child: _image != null
                    ? ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.file(
                    _image,
                    width: 100,
                    height: 100,
                    fit: BoxFit.fitHeight,
                  ),
                )
                    : Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(50)),
                  width: 100,
                  height: 100,
                  child: Icon(
                    Icons.camera_alt,
                    color: Colors.grey[800],
                  ),
                ),
              ),
            ),
          ),

        ],



      ),
    );
  }




}
