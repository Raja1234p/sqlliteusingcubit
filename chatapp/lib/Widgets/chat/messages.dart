import 'package:chatapp/Widgets/chat/messagebubble.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Messages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('chat')
            .orderBy('createdAt',descending: true)
            .snapshots(),
        builder: (context, chatSnapshot) {
          if (chatSnapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }
          final FirebaseAuth _auth = FirebaseAuth.instance;
          final User user = _auth.currentUser;
          final uid = user.uid;
          final chatDocs = chatSnapshot.data.docs;

          return ListView.builder(
              reverse: true,
              itemCount: chatDocs.length,
              itemBuilder: (context, int index) {
                return MessageBubble(
                    chatDocs[index]['docs'],
                    chatDocs[index]['userId'] == uid,
                    chatDocs[index]['username'],
                  chatDocs[index]['userImage'],
                );
              });
        });
  }
}
