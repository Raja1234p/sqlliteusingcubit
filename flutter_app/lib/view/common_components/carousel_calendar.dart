import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:richardproject/view/constants/color_constants.dart';

class CalendarComponent extends StatefulWidget {
  final Function(DateTime) onDateSelect;

  CalendarComponent({this.onDateSelect(_)});



  @override
  _CalendarComponentState createState() => _CalendarComponentState();
}

class _CalendarComponentState extends State<CalendarComponent> {
  _weekWidget(String weekDay) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: Container(
            // decoration: BoxDecoration(
            //     color: ColorConstants.greyColor,
            //     border: Border.all(
            //       color: ColorConstants.greyColor,
            //     )),
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 14),
            child: Text(weekDay, textScaleFactor: 0.9)),
      ),
    );
  }
  static DateTime _currentDate = DateTime.now();
  DateTime minDate = _currentDate.subtract(Duration(days: 360));
  DateTime maxDate = _currentDate.add(Duration(days: 360));
  _onDayPressed(DateTime selectedDate) {
    setState(() => _currentDate = selectedDate);
    widget.onDateSelect(selectedDate);


  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: CalendarCarousel(

        height: 410,
        dayPadding: 6,
        firstDayOfWeek: 1,
        isScrollable: true,
        minSelectedDate: minDate,
        maxSelectedDate: maxDate,
        markedDateShowIcon: true,
        markedDateIconMaxShown: 20,
        showOnlyCurrentMonthDate: false,
        daysHaveCircularBorder: false,
        nextMonthDayBorderColor: Colors.transparent,

        leftButtonIcon: Icon(Icons.arrow_back_ios_rounded,color: ColorConstants.greyColor,),
        rightButtonIcon: Icon(Icons.arrow_forward_ios_rounded,color: ColorConstants.greyColor,),
        selectedDateTime: _currentDate,
        todayBorderColor: Colors.transparent,
        todayButtonColor: Colors.blue,

        selectedDayBorderColor: Colors.transparent,
        weekendTextStyle: TextStyle(color: Colors.black),
        selectedDayButtonColor: Colors.blue,
        weekdayTextStyle: TextStyle(color: Colors.black),
        selectedDayTextStyle: TextStyle(color: Colors.white),
        customGridViewPhysics: NeverScrollableScrollPhysics(),
        thisMonthDayBorderColor: ColorConstants.greyColor,

        daysTextStyle: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
        todayTextStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        onDayPressed: (date, events) => _onDayPressed(date),
        customWeekDayBuilder: (int _, String __) => _weekWidget(__),



      ),
    );
  }
}
