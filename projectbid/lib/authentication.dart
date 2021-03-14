import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projectbid/create_account.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  var _isLoading = false;
  final _auth = FirebaseAuth.instance;

  void _submitAuthForm(String fullName,
      String userName,
      String phoneNumber,
      String password,
      bool isLogin,
      BuildContext ctx,) async {
    UserCredential authResult;

    try {
      setState(() {
        _isLoading = true;
      });




      if (isLogin) {


        authResult = await _auth.signInWithEmailAndPassword(
            email: fullName, password: password).catchError((err){

              showDialog(context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Error"),
                  content: Text('kindly check your credentials'),
                  actions: [
                    TextButton(
                      child: Text("Ok"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                );

              }
          );
        });



      }



      else {
        authResult = await _auth.createUserWithEmailAndPassword(
            email: fullName, password: password);

        await FirebaseFirestore.instance
            .collection('users')
            .doc(authResult.user.uid)
            .set(
            {
              'username': userName,
              'email': fullName,
              'phoneNumber': phoneNumber
            });
      }


    } on PlatformException catch (err) {
      var message = 'An error occurred kindly check your credentials';
      setState(() {
        _isLoading = false;
      });
      if (err.message != null) {
        message = err.message;
      }
      // ignore: deprecated_member_use
      Scaffold.of(context).showSnackBar(SnackBar(content: Text(message)));


    }
    setState(() {
      _isLoading = false;
    });


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CreateAccount(_submitAuthForm,_isLoading),
    );
  }

}
