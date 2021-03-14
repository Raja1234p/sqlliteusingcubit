import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

import 'color.dart';

import 'dart:io';

class ImageDetection extends StatefulWidget {
  static const String idScreen = 'image';

  @override
  _ImageDetectionState createState() => _ImageDetectionState();
}

class _ImageDetectionState extends State<ImageDetection> {
  TextEditingController ct = TextEditingController(text: '');
  TextEditingController tt = TextEditingController(text: '');
  String dName='';

  void initState() {
    // TODO: implement initState
    super.initState();

    loadModel().then((value){
      setState(() {

      });
    });

  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }


  imgFromCamera() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 40);

    setState(() {
      _image = image;


    });
    deployingModel(image);
  }

  _imgFromGallery() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 40);

    setState(() {
      _image = image;


    });
    deployingModel(image);


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
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  loadModel() async {
    var result = await Tflite.loadModel(
        model: 'modelandlabel/model_unquant.tflite',
        labels: 'modelandlabel/labels.txt',
      isAsset: true,
        useGpuDelegate: false,

    );
    print('loadind data');
  }

  @override
  bool _loading = false;
  List _result ;

  String test = "";
  String _confidence='';
  String number = '';

  deployingModel(File file) async {
    var res = await Tflite.runModelOnImage(
      path: file.path,
      numResults: 2,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
        asynch: true,);
    setState(() {
      _loading = false;
      _result = res;
      test = _result[0]['label'];
      _confidence= _result!=null?(_result[0]['confidence']*100).toString().substring(0,2)+'%':'';
      getHistoryData(test);


    });
  }


  @override
  Widget build(BuildContext context) {
    try{
      return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.image),
          onPressed: () {
            _showPicker(context);
          },
          backgroundColor:
          Color(Customcolors.hexColor('#F38400')).withOpacity(0.8),
        ),
        appBar: AppBar(
          backgroundColor:
          Color(Customcolors.hexColor('#F38400')).withOpacity(0.8),
          title: Text(
            'Search Diseases by Image',
            style: textstyles(),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: takingimagrfromuser(),
                ),
                SizedBox(height: 40,),
                _result!=null? Center(
                  child: Text(
                    '${_result[0]['label']} ',

                    style: TextStyle(color: Colors.black, fontSize: 25),
                  ),
                ):Text(''),
                SizedBox(height: 5,),
                _result!=null? Center(
                  child: Text(
                    'Accuracy: $_confidence',

                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                ):Text(''),






                // _image==null? Container():FutureBuilder(
                //     future: FirebaseFirestore.instance
                //         .collection('diseasename').where("disease_name", isEqualTo: test).get(),
                //     builder: (context,  AsyncSnapshot<QuerySnapshot> snapshot) {
                //       // print(_result[0]['label']);
                //
                //       if(!snapshot.hasData || snapshot.hasError){return CircularProgressIndicator();}
                //       else{
                //         print(snapshot.data.docs[0]['disease_name']);
                //         return Center(child: Text(snapshot.data.docs[0]['causes']));
                //       }
                //     }
                // ),

                // _image==null? Container():FutureBuilder(
                //     future: FirebaseFirestore.instance
                //         .collection('diseasename').where("disease_name", isEqualTo: test).get(),
                //     builder: (context,  AsyncSnapshot<QuerySnapshot> snapshot) {
                //       // print(_result[0]['label']);
                //
                //
                //
                //       if(!snapshot.hasData || snapshot.hasError){return CircularProgressIndicator();}
                //       else{
                //         print(snapshot.data.docs[0]['disease_name']);
                //
                //
                //         return Center(child: Text(snapshot.data.docs[0]['treatment']));
                //
                //       }
                //     }
                // ),



                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 18),
                  child:  _image==null?Container(): TextFormField(

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
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 18),
                  child:_image==null?Container():  TextFormField(

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




              ],
            ),
          ),
        ),

      );
    }catch(e){
      print("Error In Catch");
    }

  }


  





  Future getHistoryData(String search) async {
    String treatment,causes;
    await FirebaseFirestore.instance
        .collection('diseasename').where("disease_name", isEqualTo: search).get().then((value) => {
      treatment = value.docs[0]["treatment"],
      causes = value.docs[0]["causes"]
    });

    setState(() {
      tt.text = treatment;
      ct.text = causes;
    });
  }


  GestureDetector takingimagrfromuser() {
    return
      GestureDetector(
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
                fit: BoxFit.contain),

            borderRadius: BorderRadius.circular(20),
            border: Border.all(
                width: 2,
                color:
                Color(Customcolors.hexColor('#F38400')).withOpacity(0.1))),
      ),
      onTap: () {
        _showPicker(context);
      },
    );
  }

  TextStyle textstyles() {
    return TextStyle(
        color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold);
  }

  File _image;
  



}

class Causes extends StatelessWidget {
  const Causes({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(4.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'jhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh'
                'hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh'
                'hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh'
                'hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh'
                'hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh'
                'hhhhhhhhhhhhhhhhhhhj',
            style: TextStyle(fontSize: 25),
            maxLines: 4,
          ),
        ));
  }
}

class Treatment extends StatelessWidget {
  const Treatment({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(4.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'jhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh'
                'hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh'
                'hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh'
                'hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh'
                'hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh'
                'hhhhhhhhhhhhhhhhhhhj',
            style: TextStyle(fontSize: 25),
            maxLines: 4,
          ),
        ));
  }
}
