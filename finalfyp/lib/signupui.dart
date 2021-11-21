import 'dart:io';

import 'package:finalfyp/homescreen.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:firebase_auth/firebase_auth.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:fluttertoast/fluttertoast.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:cloud_firestore/cloud_firestore.dart';

import 'cameratesting.dart';
import 'detectdiseasesbyname.dart';
import 'loginui.dart';


class Signup extends StatefulWidget {
  static const String idScreen = 'singn up';

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool _showPassword = false;
  bool _showPcassword = false;

  var _userEmail = '';
  var _userName = '';
  var _password = '';
  var _country = '';
  var _age = '';
  File _userImageFile;
 String imageUrl;





  void _pickedImage(
    File image,
  ) {
    _userImageFile = image;
  }

  final _formKey = GlobalKey<FormState>();

  hexColor(String color) {
    String newColor = '0xff' + color;
    newColor = newColor.replaceAll('#', '');
    int finalcolor = int.parse(newColor);
    return finalcolor;
  }

  final _auth = FirebaseAuth.instance;
 User user;

  void _trySubmit() async {
    final isValid = _formKey.currentState.validate();
    FocusScope.of(context).unfocus();

    // ignore: unnecessary_null_comparison
    if (_userImageFile == null) {
      displaytoast('image is missing', context);
      return;
    }
    try{
    if (isValid) {
      _formKey.currentState.save();

      user = (await _auth.createUserWithEmailAndPassword(
              email: _userEmail, password: _password))
          .user;

      Reference reference = FirebaseStorage.instance
          .ref()
          .child('user_image')
          .child(user.uid + '.jpg');

      UploadTask uploadTask = reference.putFile(_userImageFile);
  if(user!=null){
      uploadTask.whenComplete(() async {
        imageUrl = await reference.getDownloadURL();
        Detectbyname decect= Detectbyname.name(imageUrl);

        displaytoast('Kindly Wait Creating Your account', context);
        await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
          'username': _userName,
          'useremail': _userEmail,
          'age': _age,
          'country': _country,
          'image': imageUrl
        });
      });

      Navigator.pushNamedAndRemoveUntil(
          context, HomeScreen.idScreen, (route) => false);
    }}

    } catch(e){

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 260,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(25),
                        bottomLeft: Radius.circular(25)),
                    gradient: LinearGradient(
                        begin: FractionalOffset.topCenter,
                        end: FractionalOffset.bottomCenter,
                        colors: [
                          Color(
                            hexColor('#F38400'),
                          ),
                          Color(
                            hexColor('#F38400'),
                          ).withOpacity(0.4)
                        ])),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30, left: 15),
                      child: Text(
                        'SIGN UP',
                        style: TextStyle(
                            fontSize: 25,
                            fontFamily: 'segoe',
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(child: CameraTesting(_pickedImage, context)),
                  ],
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15.0, right: 15.0, top: 20),
                    child: TextFormField(
                      onChanged: (value) {
                        _userName = value;
                      },
                      style: TextStyle(color: Colors.black),
                      autofocus: true,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.supervised_user_circle),
                          labelText: 'Name',
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'segoe',
                          ),
                          hintStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'segoe',
                          ),
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Colors.black, width: 3),
                          ),
                          enabled: true,
                          hintText: 'Enter your Name'),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter Name';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15.0, right: 15.0, top: 20),
                    child: TextFormField(
                        onChanged: (value) {
                          _userEmail = value;
                        },
                        decoration: InputDecoration(
                            labelText: 'Enter E-mail',
                            labelStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'segoe',
                            ),
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 3),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            filled: true,
                            enabled: true,
                            prefixIcon: Icon(
                              Icons.email,
                            )),
                        autofocus: true,
                        style: TextStyle(color: Colors.black),
                        validator: (value) {
                          Pattern pattern =
                              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                          RegExp regex = new RegExp(pattern.toString());
                          if (!regex.hasMatch(value))
                            return 'Enter Valid Email';
                          else
                            return null;
                        }),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15.0, right: 15.0, top: 30),
                    child: TextFormField(
                      onChanged: (value) {
                        _password = value;
                      },
                      obscureText: !this._showPassword,
                      enabled: true,
                      autofocus: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 3),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        prefixIcon: Icon(Icons.security),
                        suffixIcon: IconButton(
                          icon: Icon(
                            Icons.remove_red_eye,
                            color:
                                this._showPassword ? Colors.blue : Colors.grey,
                          ),
                          onPressed: () {
                            setState(
                                () => this._showPassword = !this._showPassword);
                          },
                        ),
                        labelText: 'Password',
                        labelStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'segoe',
                        ),
                        filled: true,
                      ),
                      style: TextStyle(color: Colors.black),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter password';
                        } else if (value.length <= 5) {
                          return 'Password is too short';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15.0, right: 15.0, top: 20),
                    child: TextFormField(
                      obscureText: !this._showPcassword,
                      enabled: true,
                      autofocus: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 3),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        prefixIcon: Icon(Icons.security),
                        suffixIcon: IconButton(
                          icon: Icon(
                            Icons.remove_red_eye,
                            color:
                                this._showPcassword ? Colors.blue : Colors.grey,
                          ),
                          onPressed: () {
                            setState(() =>
                                this._showPcassword = !this._showPcassword);
                          },
                        ),
                        labelText: 'Confirm Password',
                        labelStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'segoe',
                        ),
                        filled: true,
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Confirm Password is null ';
                        }
                        return null;
                      },
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15.0, right: 15.0, top: 20),
                    child: TextFormField(
                      onChanged: (value) {
                        _age = value;
                      },
                      style: TextStyle(color: Colors.black),
                      autofocus: true,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.confirmation_number_sharp),
                          labelText: 'Age',
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'segoe',
                          ),
                          hintStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'segoe',
                          ),
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Colors.black, width: 3),
                          ),
                          enabled: true,
                          hintText: 'Enter age here'),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter age';
                        }

                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15.0, right: 15.0, top: 20),
                    child: TextFormField(
                      onChanged: (value) {
                        _country = value;
                      },
                      style: TextStyle(color: Colors.black),
                      autofocus: true,
                      decoration: InputDecoration(
                          prefixIcon: Tab(
                              icon: Image.asset(
                            'images/country.png',
                            width: 30,
                            height: 30,
                          )),
                          labelText: 'Country',
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'segoe',
                          ),
                          hintStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'segoe',
                          ),
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Colors.black, width: 3),
                          ),
                          enabled: true,
                          hintText: 'Enter your Name'),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter country name';
                        }

                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15.0, right: 15.0, top: 20),
                    // ignore: deprecated_member_use
                    child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            side: BorderSide(
                              color:
                                  Color(hexColor('#F38400')).withOpacity(0.7),
                            )),
                        elevation: 15,
                        highlightElevation: 35,
                        // highlightColor: Colors.white,
                        padding:
                            EdgeInsets.symmetric(vertical: 19, horizontal: 0),
                        color: Color(hexColor('#F38400')).withOpacity(0.7),
                        child: Center(
                          child: Text(
                            'SUBMIT',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'segoe',
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        onPressed: _trySubmit),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Do have an account"),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (BuildContext context) => LoginPage()));
                      },
                      child: Text('sign in'.toUpperCase()),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  displaytoast(String name, BuildContext context) {
    Fluttertoast.showToast(msg: name);
  }
}
