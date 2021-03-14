import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projectbid/svgiimages.dart';

import 'customColor.dart';
class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    var size= MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Your Profile',style: TextStyle(color: Color(CustomColors.color('FFFFFF')),fontSize: 25,),),
        centerTitle: true,
        backgroundColor: Color(CustomColors.color('2C2C2C')),
      ),
      backgroundColor: Color(CustomColors.color('2C2C2C')),
      body: Container(
        width: size.width,
        height: size.height,
        color: Color(CustomColors.color('2C2C2C')),
        child: Stack(

          children: [


            Positioned(
            top: 120,

            child: Container(
                    width: size.width,
              height: size.height,
              decoration: BoxDecoration(
                color: Color(CustomColors.color('1e1e1e')),
                borderRadius: BorderRadius.only(topRight: Radius.circular(250))
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: size.height*0.12,),
                  Padding(
                    padding: const EdgeInsets.only(left:43.0),
                    child: Text('Full Name',style: TextStyle(color: Color(CustomColors.color('808081'))),),
                  ),
                  SizedBox(height: size.height*0.02,),
                  Padding(
                    padding: const EdgeInsets.only(left:43.0,right: 108),
                    child: TextFormField(
                      style: TextStyle(color: Color(CustomColors.color('FFFFFF')),
                          fontSize: 18),
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          focusColor: Color(CustomColors.color('808081')),
                          hoverColor: Color(CustomColors.color('808081')),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(CustomColors.color('808081'))),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(CustomColors.color('808081'))),
                          ),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(CustomColors.color('808081'))),
                          ),

                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(horizontal: 2, vertical: 4),
                          hintText: 'Jeremiah Amaukwu',
                          hintStyle: TextStyle(color: Color(CustomColors.color('FFFFFF')),
                              fontSize: 18)
                      ),
                    ),
                  ),

                  SizedBox(height: size.height*0.03,),
                  Padding(
                    padding: const EdgeInsets.only(left:43.0),
                    child: Text('User Id',style: TextStyle(color: Color(CustomColors.color('808081'))),),
                  ),
                  SizedBox(height: size.height*0.02,),
                  Padding(
                    padding: const EdgeInsets.only(left:43.0,right: 108),
                    child: TextFormField(
                        style: TextStyle(color: Color(CustomColors.color('FFFFFF')),
                            fontSize: 18),
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        focusColor: Color(CustomColors.color('808081')),
                          hoverColor: Color(CustomColors.color('808081')),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(CustomColors.color('808081'))),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(CustomColors.color('808081'))),
                          ),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(CustomColors.color('808081'))),
                          ),

                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(horizontal: 2, vertical: 4),
                          hintText: 'Jeremiah A.',
                          hintStyle: TextStyle(color: Color(CustomColors.color('FFFFFF')),
                              fontSize: 18)
                      ),
                    ),
                  ),

                  SizedBox(height: size.height*0.03,),
                  Padding(
                    padding: const EdgeInsets.only(left:43.0),
                    child: Text('Email id',style: TextStyle(color: Color(CustomColors.color('808081'))),),
                  ),
                  SizedBox(height: size.height*0.02,),
                  Padding(
                    padding: const EdgeInsets.only(left:43.0,right: 108),
                    child: TextFormField(
                      style: TextStyle(color: Color(CustomColors.color('FFFFFF')),
                          fontSize: 18),
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          focusColor: Color(CustomColors.color('808081')),
                          hoverColor: Color(CustomColors.color('808081')),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(CustomColors.color('808081'))),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(CustomColors.color('808081'))),
                          ),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(CustomColors.color('808081'))),
                          ),

                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(horizontal: 2, vertical: 4),
                          hintText: 'Jeremiah@gmail.com',
                          hintStyle: TextStyle(color: Color(CustomColors.color('FFFFFF')),
                              fontSize: 18)
                      ),
                    ),
                  ),

                  SizedBox(height: size.height*0.03,),
                  Padding(
                    padding: const EdgeInsets.only(left:43.0),
                    child: Text('Phone Number',style: TextStyle(color: Color(CustomColors.color('808081'))),),
                  ),
                  SizedBox(height: size.height*0.02,),
                  Padding(
                    padding: const EdgeInsets.only(left:43.0,right: 108),
                    child: TextFormField(
                      style: TextStyle(color: Color(CustomColors.color('FFFFFF')),
                          fontSize: 18),
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                          focusColor: Color(CustomColors.color('808081')),
                          hoverColor: Color(CustomColors.color('808081')),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(CustomColors.color('808081'))),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(CustomColors.color('808081'))),
                          ),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(CustomColors.color('808081'))),
                          ),

                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(horizontal: 2, vertical: 4),
                          hintText: '+910000000000',
                          hintStyle: TextStyle(color: Color(CustomColors.color('FFFFFF')),
                              fontSize: 18)
                      ),
                    ),
                  ),
                  SizedBox(height: size.height*0.03,),
                  Padding(
                    padding: const EdgeInsets.only(left:43.0,right:108 ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Text('Show wallet balance',style: TextStyle(

                          color: Color(CustomColors.color('FFFFFF')),
                          fontSize: 18,
                          fontWeight: FontWeight.w500
                        ),),

                        Switch(
                          value: isSwitched,
                          activeColor: Color(CustomColors.color('F7CD2E')),
                          inactiveThumbColor:Color(CustomColors.color('2C2C2C')) ,
                          onChanged: (val){
                            setState(() {

                              isSwitched=val;
                            });
                            if(isSwitched==true){
                            print('raja');}

                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: size.height*0.03,),
                  Padding(
                    padding: const EdgeInsets.only(left: 43),
                    child: ElevatedButton(onPressed: (){},
                        child: Text('Save Changes',style: TextStyle(

                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                          color: Colors.black

                    ),),
                    style: ElevatedButton.styleFrom(
                      primary: Color(CustomColors.color('F7CD2E')),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)
                      )
                    ),
                    ),
                  )




                  ],
              ),
            ),
          ),
            Positioned(
              left: 43,
              top: 60,

              child: Container(
                width: size.width*0.33,
                height: size.height*0.16,
                decoration: BoxDecoration(

                    borderRadius: BorderRadius.all(Radius.circular(60)),
                  image: DecorationImage(
                    image: AssetImage(profile),fit: BoxFit.cover,
                  )
                ),
              ),
            ),],
        ),
      )
    );
  }
}
