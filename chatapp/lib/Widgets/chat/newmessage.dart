import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NewMessage extends StatefulWidget {
  @override
  _NewMessageState createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {

  final _controller = new TextEditingController();

  var _enteredMessage ='';



  void _sendMessage() async{


    final User user = FirebaseAuth.instance.currentUser;
    String userName;

    FirebaseFirestore.instance.collection("users").doc(user.uid).get().then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        FocusScope.of(context).unfocus();
        FirebaseFirestore.instance.collection('chat').add({

          'text':_enteredMessage,
          'createdAt':Timestamp.now(),
          'userId':user.uid,
          'username':documentSnapshot["username"],
          'userImage':documentSnapshot["image_url"]

        });
      }
    });








  _controller.clear();
  

  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Send a Message ...'),
              onChanged: (value) {
                _enteredMessage = value;
              },
            ),
          ),




          IconButton(
            color: Theme.of(context).primaryColor,
            icon: Icon(Icons.send),
            onPressed: _sendMessage,


          )
        ],
      ),
    );
  }
}
