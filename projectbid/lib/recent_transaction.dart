import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:projectbid/svgiimages.dart';

import 'customColor.dart';

class RecentTransaction{

  SvgPicture svgPicture;



  RecentTransaction(this.svgPicture, this.name, this.amount, this.number,
      this.dateTime, );

  String name;
  String amount;
  String number;
  DateTime dateTime;




  static List<RecentTransaction> getTransaction()=>[
    RecentTransaction(SvgPicture.asset(transactionLogo,color: Color(CustomColors.color('FFFFFF')),), 'Electricity Bill', '\$ 10', '00000000000', DateTime.now(), ),
    RecentTransaction(SvgPicture.asset(transactionLogo,color: Color(CustomColors.color('FFFFFF')),), 'Electricity Bill', '\$ 10', '00000000000', DateTime.now(), ),
    RecentTransaction(SvgPicture.asset(transactionLogo,color: Color(CustomColors.color('FFFFFF')),), 'Electricity Bill', '\$ 10', '00000000000', DateTime.now(), ),

    RecentTransaction(SvgPicture.asset(transactionLogo,color: Color(CustomColors.color('FFFFFF')),), 'Electricity Bill', '\$ 10', '00000000000', DateTime.now(), ),
    RecentTransaction(SvgPicture.asset(transactionLogo,color: Color(CustomColors.color('FFFFFF')),), 'Electricity Bill', '\$ 10', '00000000000', DateTime.now(), ),
    RecentTransaction(SvgPicture.asset(transactionLogo,color: Color(CustomColors.color('FFFFFF')),), 'Electricity Bill', '\$ 10', '00000000000', DateTime.now(), ),

    RecentTransaction(SvgPicture.asset(transactionLogo,color: Color(CustomColors.color('FFFFFF')),), 'Electricity Bill', '\$ 10', '00000000000', DateTime.now(), ),
    RecentTransaction(SvgPicture.asset(transactionLogo,color: Color(CustomColors.color('FFFFFF')),), 'Electricity Bill', '\$ 10', '00000000000', DateTime.now(), ),
    RecentTransaction(SvgPicture.asset(transactionLogo,color: Color(CustomColors.color('FFFFFF')),), 'Electricity Bill', '\$ 10', '00000000000', DateTime.now(), ),

    RecentTransaction(SvgPicture.asset(transactionLogo,color: Color(CustomColors.color('FFFFFF')),), 'Electricity Bill', '\$ 10', '00000000000', DateTime.now(), ),
    RecentTransaction(SvgPicture.asset(transactionLogo,color: Color(CustomColors.color('FFFFFF')),), 'Electricity Bill', '\$ 10', '00000000000', DateTime.now(), ),
    RecentTransaction(SvgPicture.asset(transactionLogo,color: Color(CustomColors.color('FFFFFF')),), 'Electricity Bill', '\$ 10', '00000000000', DateTime.now(), ),

    RecentTransaction(SvgPicture.asset(transactionLogo,color: Color(CustomColors.color('FFFFFF')),), 'Electricity Bill', '\$ 10', '00000000000', DateTime.now(), ),
    RecentTransaction(SvgPicture.asset(transactionLogo,color: Color(CustomColors.color('FFFFFF')),), 'Electricity Bill', '\$ 10', '00000000000', DateTime.now(), ),
    RecentTransaction(SvgPicture.asset(transactionLogo,color: Color(CustomColors.color('FFFFFF')),), 'Electricity Bill', '\$ 10', '00000000000', DateTime.now(), ),

  ];

}