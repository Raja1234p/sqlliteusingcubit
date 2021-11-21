import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task/components/app_bar_component.dart';
import 'package:task/components/text_component.dart';

class ScreenThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(child: SafeArea(child: AppbarComponent(text: 'Package')), preferredSize: Size.fromHeight(200)),
    body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 40,),
          
             ListView.separated(
                  separatorBuilder: (_,__)=>Container(height: 20,),
               shrinkWrap: true,
               itemCount: 4,
               physics: NeverScrollableScrollPhysics(),
               itemBuilder: (context,__){
               return Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 15),
                 child: Container(
                   width: double.infinity,
                   height: 160,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(10),
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
                   child: Row(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Padding(
                         padding: const EdgeInsets.all(3.0),
                         child: Container(
                           width: MediaQuery.of(context).size.width/3,
                           height: 160,

                           decoration: BoxDecoration(
                             image: DecorationImage(image:AssetImage('assets/dummyOne.jpg'),fit: BoxFit.cover),
                             borderRadius: BorderRadius.circular(15),
                             color: Colors.lightBlue,
                             boxShadow: const [
                               BoxShadow(
                                 color: Colors.grey,
                                 spreadRadius: 2,
                                 blurRadius: 2,
                                 offset: Offset(0, 3), // changes position of shadow
                               ),
                             ],
                           ),
                         ),
                       ),
                       const SizedBox(width: 8,),
                       Expanded(
                         child: Padding(
                           padding: const EdgeInsets.only(top:15.0),
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               TextComponent(text: '5 T-Shirt Dry and Cleaning (\$60)',color: Colors.lightBlue,
                                 textAlign: TextAlign.left,
                                 fontSize: 14,
                               ),
                               const SizedBox(height: 5,),
                               TextComponent(text: 'you will get (\$10) off buy this package',color: Colors.lightBlue,
                                 textAlign: TextAlign.left,
                                 fontSize: 13,
                                 fontWeight: FontWeight.normal,
                               ),
                               const SizedBox(height: 10,),
                               Row(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [
                                   Column(
                                     mainAxisSize: MainAxisSize.min,
                                     children: [
                                       Container(
                                         width: 50,
                                         height: 50,
                                         decoration: BoxDecoration(
                                           image: DecorationImage(image:AssetImage('assets/dummyOne.jpg'),fit: BoxFit.cover),
                                           borderRadius: BorderRadius.circular(15),
                                           color: Colors.lightBlue,
                                           boxShadow: const [
                                             BoxShadow(
                                               color: Colors.grey,
                                               spreadRadius: 2,
                                               blurRadius: 2,
                                               offset: Offset(0, 3), // changes position of shadow
                                             ),
                                           ],
                                         ),
                                       ),
                                       const SizedBox(height: 7,),
                                       TextComponent(text: 'Wash',color: Colors.lightBlue,
                                         textAlign: TextAlign.left,
                                         fontWeight: FontWeight.normal,
                                         fontSize: 14,
                                       ),
                                     ],
                                   ),

                                   Column(
                                     mainAxisSize: MainAxisSize.min,
                                     children: [
                                       Container(
                                         width: 50,
                                         height: 50,
                                         decoration: BoxDecoration(
                                           image: DecorationImage(image:AssetImage('assets/dummyOne.jpg'),fit: BoxFit.cover),
                                           borderRadius: BorderRadius.circular(15),
                                           color: Colors.lightBlue,
                                           boxShadow: const [
                                             BoxShadow(
                                               color: Colors.grey,
                                               spreadRadius: 2,
                                               blurRadius: 2,
                                               offset: Offset(0, 3), // changes position of shadow
                                             ),
                                           ],
                                         ),
                                       ),
                                       const SizedBox(height: 7,),
                                       TextComponent(text: 'Drycleaning',color: Colors.lightBlue,
                                         textAlign: TextAlign.left,
                                         fontWeight: FontWeight.normal,
                                         fontSize: 14,
                                       ),
                                     ],
                                   ),

                                   Column(
                                     mainAxisSize: MainAxisSize.min,
                                     children: [
                                       Container(
                                         width: 50,
                                         height: 50,
                                         decoration: BoxDecoration(
                                           image: DecorationImage(image:AssetImage('assets/dummyOne.jpg'),fit: BoxFit.cover),
                                           borderRadius: BorderRadius.circular(15),
                                           color: Colors.lightBlue,
                                           boxShadow: const [
                                             BoxShadow(
                                               color: Colors.grey,
                                               spreadRadius: 2,
                                               blurRadius: 2,
                                               offset: Offset(0, 3), // changes position of shadow
                                             ),
                                           ],
                                         ),
                                       ),
                                       const SizedBox(height: 7,),
                                       TextComponent(text: 'Iron',color: Colors.lightBlue,
                                         textAlign: TextAlign.left,
                                         fontWeight: FontWeight.normal,
                                         fontSize: 14,
                                       ),
                                     ],
                                   ),
                                   const SizedBox(width: 3,),
                                 ],
                               )
                             ],),
                         ),
                       )
                     ],
                   ),
                 ),
               );
             },),
            const SizedBox(height: 20,),
          ],
        ),
      ),
    ),
    );
  }
}
