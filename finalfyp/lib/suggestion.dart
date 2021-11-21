import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalfyp/homescreen.dart';
import 'package:finalfyp/loginui.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

import 'color.dart';
import 'dart:io';

class Suggestion extends StatefulWidget {
  static const String idScreen = 'suggestion';

  @override
  _SuggestionState createState() => _SuggestionState();
}

class _SuggestionState extends State<Suggestion> {

  String _description='';
 File _image;
  imgFromCamera() async {
    // ignore: deprecated_member_use
    File image = await ImagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 40);

    setState(() {
      _image = image;
    });

  }

  _imgFromGallery() async {
    // ignore: deprecated_member_use
    File image = await ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 40);

    setState(() {
      _image = image;
    });

  }

  GlobalKey<FormState> _key = GlobalKey<FormState>();

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
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor:
          Color(Customcolors.hexColor('#F38400')).withOpacity(0.8),
          title: Text(
            'Suggestion',
            style: textstyles(),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, children: [

              SizedBox(height: 50,),
              Center(
                child: Text(
                  'Kindly Give your Suggestion',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    letterSpacing: 1,
                    color: Color(Customcolors.hexColor('#F38400')).withOpacity(
                        0.9),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 18),
                child: GestureDetector(
                  child: Container(
                    child: _image == null
                        ? Icon(
                      Icons.camera_alt,
                      color: Colors.grey[800],
                    )
                        : null,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    height: 200,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: _image != null
                                ? FileImage(_image)
                                : AssetImage('images/userimages.jpg'),
                            fit: BoxFit.cover),
                        color: Color(Customcolors.hexColor('#F38400')).withOpacity(0.8),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            width: 2,
                            color:
                            Color(Customcolors.hexColor('#F38400')).withOpacity(0.1))),
                  ),
                  onTap: () {
                    _showPicker(context);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 18),
                child: TextFormField(
                  validator: (value){
                    if(value.isEmpty){
                        return 'Suggestion Field is Missing';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    _description = value;
                  },
                  maxLines: 8,
                  decoration: InputDecoration(
                    fillColor: Colors.transparent,
                      labelText: 'Give Suggestion Here',
                      labelStyle: TextStyle(
                        color: Color(Customcolors.hexColor('#F38400'))
                            .withOpacity(
                            0.8),
                        fontWeight: FontWeight.bold,
                        fontFamily: 'segoe',
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color(Customcolors.hexColor('#F38400'))
                                .withOpacity(0.8), width: 3),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder:OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color(Customcolors.hexColor('#F38400'))
                                .withOpacity(0.8), width: 3),
                        borderRadius: BorderRadius.circular(10.0),
                      ) ,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color(Customcolors.hexColor('#F38400'))
                                .withOpacity(0.8), width: 3),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      enabled: true,
                      prefixIcon: Icon(

                        Icons.comment_bank,
                        color: Color(Customcolors.hexColor('#F38400'))
                            .withOpacity(
                            0.8),
                      )),
                  autofocus: true,
                  style: TextStyle(
                    color: Colors.black,),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                  SizedBox(
                  width: 200,
                  height: 50,
                  // ignore: deprecated_member_use
                  child: RaisedButton(
                    color: Color(Customcolors.hexColor('#F38400'))
                        .withOpacity(0.7),
                      shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 1,
                          color: Color(Customcolors.hexColor('#F38400'))
                              .withOpacity(0.6),),

                  ),
                  onPressed: () async {

                      await uploadimage();

                  },
                  child: Text('Submit'.toUpperCase(),style: textstyles(),),
                ),
              )
            ],
            ),
        ),
        ]),
          ),)
    ,
    );
  }

  TextStyle textstyles() {
    return TextStyle(
        color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold);
  }
  displaytoast(String name,BuildContext context){
    Fluttertoast.showToast(msg: name);
  }
String imageUrl;
 uploadimage() async{

   final isValid = _key.currentState.validate();
   FocusScope.of(context).unfocus();
   if (_image == null) {
     displaytoast('Kindly upload your image', context);
     return;
   }

  try{
   if(isValid){


Reference reference = FirebaseStorage.instance.ref().child('user_image');

UploadTask uploadTask = reference.putFile(_image);
displaytoast('Uploading Your Suggestion', context);

uploadTask.whenComplete(() async{


  imageUrl = await reference.getDownloadURL();

  await FirebaseFirestore.instance.collection('suggestion').add({


    'image':imageUrl,
    'descriptions':_description,

  }).then((value){

    print(value.id);
  });


  FirebaseAuth.instance.signOut();

  Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (BuildContext context) => HomeScreen()));

});




  }}catch(e){
     displaytoast('network error', context);
  }
  }

}
