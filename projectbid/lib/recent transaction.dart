import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projectbid/customColor.dart';
import 'package:projectbid/recent_transaction.dart';

class Transactions extends StatelessWidget {
  final List<RecentTransaction> recentItem = RecentTransaction.getTransaction();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(



      body: Stack(
        children: [
    Positioned(
      top: 0.0,
      left: 0.0,
      right: 0.0,
      child: AppBar(
      toolbarHeight: 100,
        backgroundColor:Color(CustomColors.color('2C2C2C')) ,
        // backgroundColor: Colors.pink,
        title: Padding(
          padding: const EdgeInsets.only(bottom:30.0),
          child: Text('Billshub',style: TextStyle(color: Color(CustomColors.color('FFFFFF')),fontSize: 30,),),
        ),
        centerTitle: true,

      ),
    ),
          Positioned(
            top: 110.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              width: size.width,
              height: size.height,

              decoration: BoxDecoration(

                color: Color(CustomColors.color('1E1E1E')),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(35),topRight:Radius.circular(35) )
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 30,
                    left: 30,
                    child: Text(
                      ' Transaction',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                          color: Color(CustomColors.color('C4C4C4'))),
                    ),
                  ),
                  Positioned(

                    top: 30,
                    child: Container(

                      height: size.height*0.8,
                      width: size.width,
                      child: ListView.builder(
                        itemCount: recentItem.length,
                        itemBuilder: (context, int index) {
                          String format = DateFormat()
                              .add_MMMd()
                              .format(recentItem[index].dateTime);
                          return Container(
                            height: size.height * 0.08,
                            child: Card(
                              elevation: 0,
                              color: Color(CustomColors.color('1E1E1E')),
                              child: Padding(
                                padding:
                                const EdgeInsets.only(left: 20.0, right: 20),
                                child: ListTile(
                                  subtitle: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        format,
                                        style: TextStyle(
                                            fontSize: 8,
                                            fontWeight: FontWeight.w500,
                                            color: Color(
                                                CustomColors.color('DCD7FF'))),
                                      ),
                                      Text(
                                        recentItem[index].number,
                                        style: TextStyle(
                                            fontSize: 8,
                                            fontWeight: FontWeight.w500,
                                            color: Color(
                                                CustomColors.color('DCD7FF'))),
                                      ),
                                    ],
                                  ),
                                  leading: Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: recentItem[index].svgPicture,
                                  ),
                                  title: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        recentItem[index].name,
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                            color: Color(
                                                CustomColors.color('FFFFFF'))),
                                      ),
                                      Text(
                                        recentItem[index].amount,
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                            color: Color(
                                                CustomColors.color('FFFFFF'))),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                    ),
                  ),
              ]),
            ),
          ),

        ],
      )
    );
  }
}
