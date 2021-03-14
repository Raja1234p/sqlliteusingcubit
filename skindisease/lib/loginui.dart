
import 'package:skindisease/signupui.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
  import 'package:fluttertoast/fluttertoast.dart';

import 'homescreen.dart';




class LoginPage extends StatefulWidget {
  static const String idScreen = 'login';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();




 String _userEmail;
 String _password;

displaytoast(String name,BuildContext context){
  Fluttertoast.showToast(msg: name);
}
final _auth = FirebaseAuth.instance;
 User user ;

void _trySubmit() async {

  
  final isValid = _globalKey.currentState.validate();
  FocusScope.of(context).unfocus();
  if (isValid) {
    _globalKey.currentState.save();




        try{
          displaytoast('Kindly wait Authenticating', context);
        user = (await _auth.signInWithEmailAndPassword(
            email: _userEmail, password: _password)).user;


    Navigator.pushNamedAndRemoveUntil(context, HomeScreen.idScreen, (route) => false);}
    catch(e){

          displaytoast('kindly check your email and password', context);
    }

















  }



}












  bool _showPassword = false;

  hexColor(String color) {
    String newColor = '0xff' + color;
    newColor = newColor.replaceAll('#', '');
    int finalcolor = int.parse(newColor);
    return finalcolor;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(key: _globalKey,
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 70),
                        child: Image.asset('images/logo.png'),
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 25, top: 30),
                            child: Text(
                              'LOGIN',
                              style: TextStyle(
                                  fontSize: 25,
                                  fontFamily: 'segoe',
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 30),
                child: TextFormField(
                  onChanged: (value){
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
                        borderSide: BorderSide(color: Colors.black, width: 3),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      helperText: 'username@gmail.com',
                      filled: true,
                      helperStyle: TextStyle(
                        color: Colors.black38,
                        fontFamily: 'segoe',
                      ),
                      enabled: true,
                      prefixIcon: Icon(
                        Icons.email,
                      )),
                  autofocus: true,
                  style: TextStyle(color: Colors.black),
                  validator:  (value) {
              Pattern pattern =
              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
              RegExp regex = new RegExp(pattern.toString());
              if (!regex.hasMatch(value))
              return 'Enter Valid Email';
              else
              return null;
              },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 30),
                child: TextFormField(
                  onChanged: (value){
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
                    helperText: 'abcd123',
                    helperStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    prefixIcon: Icon(Icons.security),
                    suffixIcon: IconButton(
                      icon: Icon(
                        Icons.remove_red_eye,
                        color: this._showPassword ? Colors.blue : Colors.grey,
                      ),
                      onPressed: () {
                        setState(() => this._showPassword = !this._showPassword);
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
                padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 30),
                // ignore: deprecated_member_use
                child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        side: BorderSide(
                          color: Color(hexColor('#F38400')).withOpacity(0.7),
                        )),
                    elevation: 15,
                    highlightElevation: 35,
                    // highlightColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 19, horizontal: 0),
                    color: Color(hexColor('#F38400')).withOpacity(0.7),
                    child: Center(
                      child: Text(
                        'LOGIN',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'segoe',
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    onPressed: _trySubmit


                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account"),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (BuildContext context) => Signup()));
                      },
                      child: Text('sign up'.toUpperCase()),
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


}
