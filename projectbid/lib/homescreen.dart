import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:projectbid/recent_transaction.dart';
import 'package:projectbid/svgiimages.dart';

import 'customColor.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool changeSlide = false;

  final List<RecentTransaction> recentItem = RecentTransaction.getTransaction();
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<Widget> _widgetOptions = <Widget>[
    Text('Home Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Search Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Profile Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(CustomColors.color('2C2C2C')),
        title: SvgPicture.asset(
          logo,
          color: Colors.white,
        ),
        centerTitle: true,
      ),
      backgroundColor: Color(CustomColors.color('1E1E1E')),
      body: homeitem(size),
      bottomNavigationBar:

      Card(
        color: Color(CustomColors.color('1E1E1E')),
        elevation: 0,
        child: Container(
          height: size.height * 0.07,
          padding: EdgeInsets.only(left: 20, right: 20),
          color: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomNavigation(
                size,
                'images/home.svg',
                true,
                0,
              ),
              CustomNavigation(
                size,
                'images/trello.svg',
                false,
                1,
              ),
              CustomNavigation(
                size,
                'images/user.svg',
                false,
                2,
              ),
            ],
          ),
        ),
      ),
    );
  }

  SafeArea homeitem(Size size) {
    return SafeArea(
      child: Container(
        color: Color(CustomColors.color('1E1E1E')),
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Container(
              width: size.width,
              height: size.height * 0.25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(60),
                  bottomRight: Radius.circular(60),
                ),
                color: Color(CustomColors.color('2C2C2C')),
              ),
              child: Stack(
                children: [CircleAvatar(backgroundImage: AssetImage(profile))],
              ),
            ),
            Positioned(
              width: size.width,
              top: 146,
              child: Padding(
                padding: EdgeInsets.only(left: 30, right: 30),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  color: Color(CustomColors.color('1E1E1E')),
                  elevation: 6,
                  child: Container(
                    width: size.width * 1,
                    height: size.height * 0.11,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(CustomColors.color('1E1E1E')),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 26.0, top: 9),
                            child: Text(
                              'Wallet Balance',
                              style: TextStyle(
                                  color: Color(CustomColors.color('F7CD2E')),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 30,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 26.0,
                              top: 13,
                            ),
                            child: Text(
                              '\$',
                              style: TextStyle(
                                fontSize: 20,
                                color: Color(CustomColors.color('F7CD2E')),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 30,
                          left: 37,
                          child: Text(
                            '500,000',
                            style: TextStyle(
                                color: Color(CustomColors.color('F7CD2E')),
                                fontWeight: FontWeight.bold,
                                fontSize: 40),
                          ),
                        ),
                        Positioned(
                          right: 20,
                          top: 28,
                          child: Container(
                            width: size.width * 0.068,
                            height: size.height * 0.032,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(
                                  width: 2,
                                  color: Color(
                                    CustomColors.color('F7CD2E'),
                                  ),
                                )),
                            child: Center(
                              child: Icon(
                                Icons.add,
                                color: Color(CustomColors.color('F7CD2E')),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 15,
                          left: 280,
                          top: 57,
                          child: Text(
                            'Add Money',
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(CustomColors.color('F7CD2E')),
                                fontWeight: FontWeight.w500,
                                fontSize: 8),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Stack(
              children: [
                Positioned(
                  top: 268,
                  left: 30,
                  child: Container(
                    width: size.width * 0.14,
                    height: size.height * 0.068,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        width: 2,
                        color: Color(CustomColors.color('FFFFFF')),
                      ),
                    ),
                    child: SvgPicture.asset(
                      electricity,
                      color: Color(CustomColors.color('FFFFFF')),
                    ),
                  ),
                ),
                Positioned(
                  top: 335,
                  left: 20,
                  child: Text(
                    'Electricity Bill',
                    style: TextStyle(
                        color: Color(CustomColors.color('FFFFFF')),
                        fontWeight: FontWeight.w500,
                        fontSize: 12),
                  ),
                ),
              ],
            ),
            Stack(
              children: [
                Positioned(
                    top: 250,
                    left: 125,
                    child: SizedBox(
                        width: size.width * 0.1,
                        height: size.height * 0.1,
                        child: SvgPicture.asset(
                          calling,
                          color: Color(CustomColors.color('FFFFFF')),
                        ))),
                Positioned(
                  top: 333,
                  left: 120,
                  child: Text(
                    'Buy Airtime',
                    style: TextStyle(
                        color: Color(CustomColors.color('FFFFFF')),
                        fontWeight: FontWeight.w500,
                        fontSize: 12),
                  ),
                ),
              ],
            ),
            Stack(
              children: [
                Positioned(
                    top: 250,
                    left: 230,
                    child: SizedBox(
                        width: size.width * 0.1,
                        height: size.height * 0.1,
                        child: SvgPicture.asset(
                          airplay,
                          color: Color(CustomColors.color('FFFFFF')),
                        ))),
                Positioned(
                  top: 333,
                  left: 210,
                  child: Text(
                    'Tv Subscription',
                    style: TextStyle(
                        color: Color(CustomColors.color('FFFFFF')),
                        fontWeight: FontWeight.w500,
                        fontSize: 12),
                  ),
                ),
              ],
            ),
            Stack(
              children: [
                Positioned(
                    top: 250,
                    left: 320,
                    child: SizedBox(
                        width: size.width * 0.1,
                        height: size.height * 0.1,
                        child: SvgPicture.asset(
                          database,
                          color: Color(CustomColors.color('FFFFFF')),
                        ))),
                Positioned(
                  top: 333,
                  left: 320,
                  child: Text(
                    'Buy Data',
                    style: TextStyle(
                        color: Color(CustomColors.color('FFFFFF')),
                        fontWeight: FontWeight.w500,
                        fontSize: 12),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 400,
              left: 20,
              child:
              Text(
                'Recent Transaction',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color(CustomColors.color('C4C4C4'))),
              ),
            ),
            Positioned(
              top: 430,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 40.0),
                child:
                Container(
                  width: size.width,
                  height: size.height * 0.36,
                  child: ListView.builder(
                      itemCount: 5,
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
            )
          ],
        ),
      ),
    );
  }



  Widget CustomNavigation(Size size, String pic, bool isActive, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
          width: size.width * 0.11,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: index == _selectedIndex
                  ? Color(CustomColors.color('F7CD2E')).withOpacity(0.3)
                  : Color(CustomColors.color('1E1E1E'))),

          // color: Color(CustomColors.color('2C2C2C')),
          child: Tab(
            icon: SvgPicture.asset(
              pic,
              color: index == _selectedIndex
                  ? Color(CustomColors.color('F7CD2E'))
                  : Color(CustomColors.color('C4C4C4')),
            ),
          )),
    );
  }
}
