import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:skindisease/Disease.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'color.dart';

// ignore: must_be_immutable
class Detectbyname extends StatefulWidget {
  static const String idScreen = 'name';
  String imageUrl;

  Detectbyname.name(this.imageUrl);

  @override
  _DetectbynameState createState() => _DetectbynameState();
}

class _DetectbynameState extends State<Detectbyname> {

  TextEditingController ct = TextEditingController(text: '');
  TextEditingController tt = TextEditingController(text: '');

  String treatment = "";
  
  String causes = '';
  String dimage = "";
  
  String imageUrl;

  var values;
  Disease selectDisease;

  List<Disease> myList;

  dynamic data;
  bool isVisible = false;

  // _DetectbynameState.name(this.imageUrl);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserData();
    getDiseases();

    //print(disease.length);
  }

  User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor:
          Color(Customcolors.hexColor('#F38400')).withOpacity(0.8),
          title: Text(
            'Search Diseases my Name',
            style: textstyles(),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            SizedBox(
            height: 30,
          ),
          // diseasesName(),

          FutureBuilder(
            future:  FirebaseFirestore.instance.collection('diseasename').get(),
            builder: (context, snapshot) {
              if (!snapshot.hasData || snapshot.hasError) {
                return CircularProgressIndicator();
              }
              return StreamBuilder(
                  stream:
                  FirebaseFirestore.instance.collection('diseasename').snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData || snapshot.hasError) {
                      return CircularProgressIndicator();
                    } else {
                      return Padding(
                        padding:
                        const EdgeInsets.only(top: 20.0, left: 20, right: 20),
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              border: Border.all(
                                width: 2,
                                color: Color(Customcolors.hexColor('#F38400'))
                                    .withOpacity(1),
                              )),
                          child: Center(
                            child: DropdownButtonFormField<Disease>(
                              decoration: InputDecoration.collapsed(hintText: ""),
                              validator: (value) =>
                              value == null ? 'field required' : null,
                              hint: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text('Select Diseases'),
                              ),

                              value: selectDisease,
                              isExpanded: true,
                              onChanged: (value) {
                                setState(() {

                                  selectDisease = value;
                                  treatment = value.treatment;
                                  causes = value.causes;
                                  ct.text=causes;
                                  tt.text=treatment;
                                  dimage = value.dimage;
                                  //savedat(value.diseaseName);
                                });
                                FirebaseFirestore.instance
                                    .collection('history')
                                    .add({
                                  'user_id': FirebaseAuth.instance.currentUser.uid,
                                  'disease_name': value.diseaseName,
                                  'date': Timestamp.now(),
                                  'imgae_url': imageUrl,
                                }).then((value) {
                                  print(value.id);
                                });
                              },
                              items: myList.map((Disease disease) {
                                print(disease.diseaseName);
                                return DropdownMenuItem<Disease>(
                                  value: disease,

                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: FittedBox(
                                      child: Text(disease.diseaseName,
                                          style: TextStyle(
                                            color: Color(Customcolors.hexColor(
                                                '#F38400'))
                                                .withOpacity(1),
                                          )),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      );
                    }

                  });
            }
          ),
Padding(
  padding: const EdgeInsets.all(8.0),
  child:   Container(
    padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 18),
      decoration:  BoxDecoration(

        borderRadius: BorderRadius.circular(15)
      ) ,
    child: dimage==null?CircularProgressIndicator():Image.network(dimage),

  ),
),


SizedBox(height: 40,),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 18),
                child: TextFormField(
readOnly: true,
controller: ct,
                  maxLines: 8,
                  decoration: InputDecoration(
                    fillColor: Colors.transparent,
                      labelText: 'Causes',
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

                     ),

                  style: TextStyle(
                    color: Colors.black,),
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 18),
                child: TextFormField(

                  readOnly: true,
                  controller: tt,
                  maxLines: 8,
                  decoration: InputDecoration(
                    fillColor: Colors.transparent,
                    labelText: 'Treatment',
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

                  ),

                  style: TextStyle(
                    color: Colors.black,),
                ),
              ),




            ]
    ,
    ),
        )
    ,
    );
  }

  getUserData() async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser.uid)
        .get()
        .then((value) => {

          imageUrl = value["image"]});
  }

  // Padding diseasesName() {
  //   return
  //     Padding(
  //       padding: const EdgeInsets.only(left:8.0,right: 8,top:20),
  //       child: Container(
  //
  //         decoration: BoxDecoration(
  //
  //           borderRadius: BorderRadius.circular(20),
  //         border: Border.all(width: 3,color: Color(Customcolors.hexColor('#F38400'))
  //             .withOpacity(1),)
  //
  //
  //         ),
  //         padding: EdgeInsets.all(20),
  //
  //         child: StreamBuilder<QuerySnapshot>(
  //           stream:  FirebaseFirestore.instance.collection('diseasename').snapshots(),
  //           builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
  //             if (!snapshot.hasData) return const Text('Loading...');
  //             return DropdownButtonFormField(
  //
  //                   elevation: 20,
  //                   icon: Icon(Icons.arrow_downward),
  //                   iconEnabledColor:  Color(Customcolors.hexColor('#F38400'))
  //                 .withOpacity(1),
  //
  //                   decoration: InputDecoration.collapsed(hintText: ""),
  //                   // validator: (value) =>
  //                   // value == null ? 'field required' : null,
  //                   hint: Text('Select Area'),
  //                   value:    _mySelection,
  //
  //                   isExpanded: true,
  //                   onChanged: ( value) {
  //
  //                     setState(() {
  //                        _mySelection= value;
  //                     });
  //
  //                   },
  //                   items: snapshot.data.docs.map((DocumentSnapshot document) {
  //                     DropdownMenuItem<String>(
  //                       value: document['causes'],
  //                       child: new Text(
  //                        ' document["causes"]',
  //                       ),
  //                     );
  //                   }).toList()
  //                 );
  //           }
  //         ),
  //
  //         ),
  //     );
  // }

  TextStyle textstyles() {
    return TextStyle(
        color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold);
  }

  getDiseases() async {
    await FirebaseFirestore.instance.collection("diseasename").orderBy(
        'disease_name')
        .get().then(
            (value) =>
        {
          myList =
              value.docs.map((e) => Disease.fromJson(e.data())).toList()
        });
  }
}
