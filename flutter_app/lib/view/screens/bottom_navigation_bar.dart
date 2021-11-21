import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:richardproject/view/constants/assets_constants.dart';
import 'package:richardproject/view/constants/color_constants.dart';
import 'package:richardproject/view/constants/string_constants.dart';
import 'package:richardproject/view/screens/details_screens.dart';
import 'package:richardproject/view/screens/main_screen.dart';
import 'package:richardproject/view/screens/profile_screen.dart';
import 'package:richardproject/view/screens/schedule_screen.dart';
import 'package:richardproject/view/screens/search_screen.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  @override
  _BottomNavigationBarScreenState createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  List<Widget> screens = [
    MainScreen(),
    SearchScreen(),
    ScheduleScreen(),
    DetailsScreen(),
    ProfileScreen(),
  ];

  // next screen
  var _selectedIndex = 0;

  void onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: screens.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          selectedFontSize: 0,
          unselectedFontSize: 0,
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          selectedItemColor: ColorConstants.greyColor,
          unselectedItemColor: ColorConstants.lightBlueColor,
          onTap: (int val) {
            onItemTap(val);
          },
          items: [
            _bottomNavigationBaritem(icon: AssetConstants.homeSVG),
            _bottomNavigationBaritem(icon: AssetConstants.searchSVG),
            _bottomNavigationBaritem(icon: AssetConstants.scheduleSVG),
            _bottomNavigationBaritem(icon: AssetConstants.savedSVG),
            _bottomNavigationBaritem(icon: AssetConstants.profileSVG),
          ],
        ));
  }

  _bottomNavigationBaritem({String icon}) {
    return BottomNavigationBarItem(
        icon: SvgPicture.asset(
          icon,
          color: ColorConstants.greyColor,
        ),
        activeIcon: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: ColorConstants.lightBlueColor.withOpacity(0.1),
          ),
          child: SvgPicture.asset(
            icon,
            color: ColorConstants.lightBlueColor,
          ),
        ),
        label: '');
  }
}
