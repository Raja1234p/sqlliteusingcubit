import 'package:skindisease/color.dart';
import 'package:skindisease/hisotry.dart';
import 'package:skindisease/loginui.dart';
import 'package:skindisease/suggestion.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:cloud_firestore/cloud_firestore.dart';

import 'detectdiseasesbyimage.dart';
import 'detectdiseasesbyname.dart';

class HomeScreen extends StatefulWidget {
  static const String idScreen = 'Homescreen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final User user = FirebaseAuth.instance.currentUser;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        backgroundColor:
            Color(Customcolors.hexColor('#F38400')).withOpacity(0.8),
        title: Text(
          'Derma',
          style: textstyles(),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30,),

                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(


                        child: Container(
                            width: 300,
                            height: 240,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  enabledMouseCursor: MouseCursor.uncontrolled,
                                  primary: Color(Customcolors.hexColor('#F38400'))
                                      .withOpacity(0.7),
                                  shape: BeveledRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  side: BorderSide(
                                    width: 1,
                                    color: Color(Customcolors.hexColor('#F38400'))
                                        .withOpacity(0.7),
                                  ),
                                  animationDuration: Duration(seconds: 10),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top:0.0,),
                                      child: Center(child: Image.asset('images/picd.png',height: 100,color:Colors.white
                                      ),),
                                    ),
                                    SizedBox(height: 10,),
                                    Text(
                                      'Search Diseases by Image',
                                      style: textstyles(),
                                    ),
                                  ],
                                ),
                                onPressed: () {

                                  Navigator.pushNamed(context, ImageDetection.idScreen);


                                }
                                )))),


                SizedBox(height: 50,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Container(
                      width: 300,
                      height: 240,

                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          enabledMouseCursor: MouseCursor.uncontrolled,
                          primary: Color(Customcolors.hexColor('#F38400'))
                              .withOpacity(0.7),
                          shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          side: BorderSide(
                            width: 1,
                            color: Color(Customcolors.hexColor('#F38400'))
                                .withOpacity(0.7),
                          ),
                          animationDuration: Duration(seconds: 10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top:0.0,),
                              child: Center(child: Image.asset('images/named.png',height: 100,color:Colors.white
                                ),),
                            ),
                            SizedBox(height: 10,),
                            Text(
                              'Search Diseases by Name',
                              style: textstyles(),
                            ),
                          ],
                        ),

                        onPressed: () {
                          Navigator.pushNamed(context, Detectbyname.idScreen);
                          //readData();
                        },
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextStyle textstyles() {
    return TextStyle(
        color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold);
  }
}

class CustomDrawer extends StatefulWidget {
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  _CustomDrawerState();
  final User user = FirebaseAuth.instance.currentUser;


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            height: 250,
            color: Colors.black,
            child: DrawerHeader(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: FractionalOffset.bottomCenter,
                        end: FractionalOffset.topCenter,
                        colors: [
                          Color(
                            Customcolors.hexColor('#F38400'),
                          ),
                          Color(
                            Customcolors.hexColor('#F38400'),
                          ).withOpacity(0.4)
                        ]),
                    shape: BoxShape.rectangle),
                child: Stack(children: [
                  Positioned(
                    bottom:40,
                    child: FutureBuilder(
                        future: FirebaseFirestore.instance.collection('users').doc(user.uid).get(),
                      builder: (context, AsyncSnapshot<DocumentSnapshot>snapshot) {
                        if (!snapshot.hasData || snapshot.hasError) {
                          return CircularProgressIndicator();
                        }
                        return StreamBuilder(
                        stream: FirebaseFirestore.instance.collection('users').doc(user.uid).snapshots(),
                        builder: (context,AsyncSnapshot<DocumentSnapshot> snapshot) {
                          print(snapshot.data);
                          if (!snapshot.hasData || snapshot.hasError) {
                            return CircularProgressIndicator();
                          }
                        return   snapshot.data==null?CircularProgressIndicator():  Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                          image: NetworkImage(snapshot.data['image']),
                                          fit: BoxFit.cover)
                            ));
                        }


                                        );
                      }
                    ),
                  ),

                                  Positioned(
                                    bottom: 14,left:40,
                                    child:   FutureBuilder(
                                        future: FirebaseFirestore.instance.collection('users').doc(user.uid).get(),
                                      builder: (context, AsyncSnapshot<DocumentSnapshot>snapshot) {
                                        if (!snapshot.hasData || snapshot.hasError) {
                                          return Text('loading',style: TextStyle(color: Colors.white),);
                                        }
                                        return StreamBuilder(
                                          stream: FirebaseFirestore.instance.collection('users').doc(user.uid).snapshots(),
                                          builder: (context, AsyncSnapshot<DocumentSnapshot>snapshot) {

                                            if (!snapshot.hasData || snapshot.hasError) {
                                              return CircularProgressIndicator();
                                            }
                                            return Padding(
                                              padding: const EdgeInsets.only(left:8.0,right: 8),
                                              child: Text(
                                                  snapshot.data['username'],
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.white,
                                                      letterSpacing: 1),
                                                  maxLines: 3,
                                                ),
                                            );
                                          }
                                        );
                                      }
                                    ),

                                  ),


                ])),
          ),
          Padding(
            padding: const EdgeInsets.only(left:8.0,top:8,right: 8),
            child: InkWell(
              child: Card(

                child: Padding(
                  padding: const EdgeInsets.only(left:8.0,top:8,right: 8),
                  child:ListTile(

                    leading: Icon(
                      Icons.comment_bank,
                      size: 40,
                      color: Color(Customcolors.hexColor('#F38400')),
                    ),
                    title:  Text(
                        'Suggestion',
                        style: TextStyle(
                    color: Color(Customcolors.hexColor('#F38400'))
                      .withOpacity(1),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,

                  letterSpacing: 1,
                ),
              ),



                  ),



                ),
              ),
              onTap: (){
                Navigator.pushNamed(context, Suggestion.idScreen,);

              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left:8.0,right: 8),
            child: InkWell(
              child: Card(


                child: Padding(
                  padding: const EdgeInsets.only(left:8.0,right: 8),
                  child:ListTile(


                  title:Text(
                    'History',
                    style: TextStyle(
                      color: Color(Customcolors.hexColor('#F38400'))
                          .withOpacity(1),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,

                      letterSpacing: 1,
                    ),
                  ),



                ),
              ),



            ),
                  onTap: () {
                    Navigator.pushNamed(context, History.idScreen,);
                  }),),

          SizedBox(height: MediaQuery.of(context).size.height*0.36,),
          Padding(
            padding: const EdgeInsets.only(left:8.0,top:8,right: 8),
            child: InkWell(
                child: Card(


                  child: ListTile(

                    leading: Icon(
                      Icons.logout,
                      size: 40,
                      color: Color(Customcolors.hexColor('#F38400')),
                    ),
                    title:Text(
                      'logout',
                      style: TextStyle(
                        color: Color(Customcolors.hexColor('#F38400'))
                            .withOpacity(1),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,

                        letterSpacing: 1,
                      ),
                    ),



                  ),




                ),
                onTap: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.pushNamedAndRemoveUntil(
                      context, LoginPage.idScreen, (route) => false);
                }),
          ),
        ],
      ),
    );
  }
}
