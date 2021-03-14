// ignore: import_of_legacy_library_into_null_safe
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:intl/intl.dart';

import 'color.dart';

class History extends StatefulWidget {
  static const String idScreen = 'history';

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            Color(Customcolors.hexColor('#F38400')).withOpacity(0.8),
        title: Text(
          'History',
          style: textstyles(),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: FirebaseFirestore.instance
              .collection('history').orderBy("date", descending: true) .get(),
          builder: (context,  snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }
            return ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, int index) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    child: Card(
                        child: ListTile(

                      title: Text(snapshot.data.docs[index]["disease_name"]),
                      subtitle: Text(timestampToDate(snapshot.data.docs[index]["date"])),
                    )),
                  );
                });
          }),
    );
  }

  TextStyle textstyles() {
    return TextStyle(
        color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold);
  }

  String timestampToDate(Timestamp timestamp){
    Timestamp t = timestamp;
    DateTime d = t.toDate();
    String formatDate =
    DateFormat('yyyy-MM-dd - kk:mm').format(d);
    return formatDate;
  }
}



