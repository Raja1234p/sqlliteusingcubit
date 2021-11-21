import 'package:flutter/material.dart';
import 'package:task/components/chatComponent.dart';
import 'package:task/components/custom_painter.dart';
import 'package:task/components/text_component.dart';
import 'package:task/screens/screenthree.dart';

class ScreenTwo extends StatelessWidget {
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(child: SafeArea(child:Container(
        height: 350,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.arrow_back_outlined,color: Colors.white,size: 30,),
                  const Icon(Icons.menu,color: Colors.white,size: 30,),
                ],
              ),
            ),
            SizedBox(height: 40,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextComponent(text: 'Hi There!',color: Colors.white,fontSize: 25,),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextComponent(text: 'Welcome to Online service . How can \n we help you todays?',color: Colors.white,fontSize: 15,textAlign: TextAlign.start,),
            ),
          ],
        ),
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/image.PNG'),fit: BoxFit.fill)
        ),
      )), preferredSize: Size.fromHeight(300)),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // CustomPaint(
              //   size: Size(double.infinity, 500), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
              //   painter: RPSCustomPainter(),
              // )
              
              SizedBox(height: 40,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right:15.0),
                    child: ChatComponent(text: 'Of course are you interested in month-to-month or long term',color: Colors.lightBlue,),
                  )
                ],
              ),
              SizedBox(height: 40,),
              TextComponent(text: 'July 25 23.34',),
              SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.only(left:30.0),
                child: Row(
                  children: [
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(image:AssetImage('assets/dummy.jpg'),fit: BoxFit.cover)

                      ),
                      child: Column(

                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left:32.0,bottom: 7),
                            child: Container(
                                  height: 12,

                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.green
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left:60.0),
                    child: ChatComponent(text: 'Of course are you interested in month-to-month or long term',color: Colors.white,textColor: Colors.black45,),
                  )
                ],
              ),
              SizedBox(height: 30,),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right:15.0),
                    child: ChatComponent(text: 'Of course are you interested in month-to-month or long term',color: Colors.lightBlue,),
                  )
                ],
              ),
              SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.only(left:30.0),
                child: Row(
                  children: [
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(image:AssetImage('assets/dummy.jpg'),fit: BoxFit.cover)

                      ),
                      child: Column(

                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left:32.0,bottom: 7),
                            child: Container(
                              height: 12,

                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.green
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left:60.0),
                    child: ChatComponent(text: 'Of course are you interested in month-to-month or long term',color: Colors.white,textColor: Colors.black45,),
                  )
                ],
              ),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right:15.0),
                    child: ChatComponent(text: 'Of course are you interested in month-to-month or long term',color: Colors.lightBlue,),
                  )
                ],
              ),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right:15.0),
                    child: ChatComponent(text: 'Of course are you interested in month-to-month or long term'*2,color: Colors.lightBlue, ),
                  )
                ],
              ),
              SizedBox(height: 30,),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Row(
               mainAxisSize: MainAxisSize.min,
               children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 4,horizontal: 2),
                    child: TextField(controller: textEditingController,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      cursorColor: Colors.grey,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow:  [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.7),
                            spreadRadius: 2,
                            blurRadius: 2,

                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),

                  ),
                ),
                 const SizedBox(width: 8,),
                 Icon(Icons.emoji_emotions_outlined,color: Colors.grey,size: 32,),
                 const SizedBox(width: 8,),
                 Icon(Icons.image_outlined,color: Colors.grey,size: 32,),
                 const SizedBox(width: 8,),
                 Icon(Icons.attachment_rounded,color: Colors.grey,size: 32,),
                 const SizedBox(width: 8,),
                 GestureDetector(child: Icon(Icons.send,color: Colors.lightBlue,size: 35,),

                 onTap: (){
                   Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ScreenThree()));

                 },
                 )
               ],
             ),
           )
          ],
        ),
      ),
    );
  }
}
