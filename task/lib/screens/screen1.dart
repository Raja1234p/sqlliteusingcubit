import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task/components/app_bar_component.dart';
import 'package:task/components/dareComponent.dart';
import 'package:task/components/text_component.dart';
import 'package:task/components/time_component.dart';
import 'package:task/screens/screentwo.dart';

class ScreenOne extends StatelessWidget {
  String dropdownValue = 'Every Week';
  String dropdownValuesSecond = '1';

  @override
  Widget build(BuildContext context) {
   return  Scaffold(
        appBar: PreferredSize(child: SafeArea(child: AppbarComponent(text: 'Pickup Date')), preferredSize: Size.fromHeight(200)),
     body: SingleChildScrollView(
       child: Padding(
         padding: const EdgeInsets.only(top:30.0,),
         child: Container(
           width: MediaQuery.of(context).size.width,
           child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
             children: [
               Padding(
                 padding: const EdgeInsets.only(right:15.0),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                   children: const [
                     Spacer(),
                     TextComponent(text: 'when would you like your pickup?',),
                     Spacer(),
                     Icon(Icons.calendar_today,color: Colors.blue,size: 30,),
                   ],
                 ),
               ),
               const SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(child: DateComponent(day: 'Fri',date: '25 jun',event: 'Yesterday',)),
                    const SizedBox(width: 15,),
                    Expanded(child: DateComponent(day: 'Sat',date: '25 jun',event: 'Yesterday',color: Colors.blue,)),
                    const SizedBox(width: 15,),
                    Expanded(child: DateComponent(day: 'Sun',date: '25 jun',event: 'Yesterday',color: Colors.transparent,textColor: Colors.black45,)),
                    const SizedBox(width:15,),
                    Expanded(child: DateComponent(day: 'Mon',date: '25 jun',event: 'Yesterday',color: Colors.red,)),

                  ],
                ),
              ),
               const SizedBox(height: 50,),
               TextComponent(text: 'Available time slots',fontSize: 20,),
               const SizedBox(height: 40,),
         // GridView.count(
         //   shrinkWrap: true,
         //   crossAxisSpacing: 40,
         //   mainAxisSpacing: 20,
         //   physics: NeverScrollableScrollPhysics(),
         //   childAspectRatio: 2.2,
         //   // Create a grid with 2 columns. If you change the scrollDirection to
         //   // horizontal, this produces 2 rows.
         //   crossAxisCount: 3,
         //   // Generate 100 widgets that display their index in the List.
         //   children: List.generate(5, (index) {
         //     return TimeComponent(time: '7am-9pm',);
         //   }),
         // ),
               GridView.builder(

                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                   childAspectRatio: 2,
                     crossAxisCount: 3, crossAxisSpacing: 30, mainAxisSpacing: 20),
                 physics: NeverScrollableScrollPhysics(),
                 padding: EdgeInsets.only(left:20,right: 20,bottom: 10,top: 4),
                 shrinkWrap: true,
                 itemCount: 5,

                 itemBuilder: (context, index) {
                   if(index==0){
                     return TimeComponent(time: '7am-9pm',color: Colors.blue,textColor: Colors.white,);
                   }
                   return TimeComponent(time: '7am-9pm',);
                 },
               ),
               const SizedBox(height: 30,),
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 20),
                 child: Container(
                   width: double.infinity,
                   padding: EdgeInsets.symmetric(vertical: 6,horizontal: 30),
                    child: Row(children: [
                      TextComponent(text: 'Repeat Pickup',),
                      Spacer(),
                      Transform.scale(
                        scale: 0.8,
                        child: CupertinoSwitch(value: true, onChanged: (_){},
                        trackColor: Colors.blue.withOpacity(0.7),
                          thumbColor: Colors.white,
                          activeColor: Colors.blue.withOpacity(0.7),
                        ),
                      )
                    ],),
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                     boxShadow: const [
                       BoxShadow(
                         color: Colors.grey,
                         spreadRadius: 1,
                         blurRadius: 2,

                         offset: Offset(0, 3), // changes position of shadow
                       ),
                     ],
                   ),
                 ),
               ),
               const SizedBox(height: 60,),
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 20),

                 child: Row(
                   children: [
                     TextComponent(text: 'How Often Repeat?',fontSize: 18,textAlign: TextAlign.start,),
                   ],
                 ),
               ),
               const SizedBox(height: 10,),
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 20),
                 child: Container(
                   width: double.infinity,
                   padding: EdgeInsets.symmetric(vertical: 13,horizontal: 30),
                   child: DropdownButton<String>(
                     value: dropdownValue,
                     icon: const Icon(Icons.keyboard_arrow_down_outlined),
                     iconSize: 24,
                    isExpanded: true,
                     isDense: true,
                     style: const TextStyle(color: Colors.deepPurple),
                     underline: Container(),


                     onChanged: (String? newValue) {

                     },
                     items: <String>['Every Week',  'Every month', 'Every year']
                         .map<DropdownMenuItem<String>>((String value) {
                       return DropdownMenuItem<String>(
                         value: value,
                         child: TextComponent(text: value,),
                       );
                     }).toList(),
                   ),
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(15),
                     color: Colors.white,
                     boxShadow: const [
                       BoxShadow(
                         color: Colors.grey,
                         spreadRadius: 1,
                         blurRadius: 2,

                         offset: Offset(0, 3), // changes position of shadow
                       ),
                     ],
                   ),
                 ),
               ),
               const SizedBox(height: 60,),
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 20),

                 child: Row(
                   children: [
                     TextComponent(text: 'How Many Times?',fontSize: 18,textAlign: TextAlign.start,),
                   ],
                 ),
               ),
               const SizedBox(height: 10,),
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 20),
                 child: Container(
                   width: double.infinity,
                   padding: EdgeInsets.symmetric(vertical: 13,horizontal: 30),
                   child: DropdownButton<String>(
                     value: dropdownValuesSecond,
                     icon: const Icon(Icons.keyboard_arrow_down_outlined),
                     iconSize: 24,
                     isExpanded: true,
                     isDense: true,
                     style: const TextStyle(color: Colors.deepPurple),
                     underline: Container(),

                     onChanged: (String? newValue) {

                     },
                     items: <String>['1',  '2', '3']
                         .map<DropdownMenuItem<String>>((String value) {
                       return DropdownMenuItem<String>(
                         value: value,
                         child: TextComponent(text: value,),
                       );
                     }).toList(),
                   ),
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(15),
                     color: Colors.white,
                     boxShadow: const [
                       BoxShadow(
                         color: Colors.grey,
                         spreadRadius: 1,
                         blurRadius: 2,

                         offset: Offset(0, 3), // changes position of shadow
                       ),
                     ],
                   ),
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.symmetric(vertical: 40.0,horizontal: 33),
                 child: GestureDetector(
                   child: Container(
                     width: MediaQuery.of(context).size.width,
                     padding: EdgeInsets.symmetric(vertical: 17,horizontal: 30),
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(15),
                       color: Colors.lightBlue,
                       boxShadow:  [
                         BoxShadow(
                           color: Colors.black45.withOpacity(0.7),
                           spreadRadius: 2,
                           blurRadius: 2,

                           offset: Offset(0, 3), // changes position of shadow
                         ),
                       ],
                     ),
                     child: TextComponent(text: 'Continue',color: Colors.white,fontSize: 22,),
                   ),

               onTap: (){
                     Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ScreenTwo()));
               },
                 ),
               ),
             ],
           ),
         ),
       ),
     ),
   );
  }
}
