import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'package:table_calendar/table_calendar.dart';
import 'dart:core';

class PopupCalendar extends StatefulWidget {
  final BuildContext mainContext;
  final Function(DateTime? timeChoice)? dateHasChoice;
  final DateTime? currentDate;
  final DateTime? startDate;

  const PopupCalendar({Key? key, required this.mainContext, this.dateHasChoice, this.currentDate, this.startDate}) : super(key: key);

  @override
  _PopupCalendarState createState() => _PopupCalendarState();
}

class _PopupCalendarState extends State<PopupCalendar> {

  // DateTime _currentDate = DateTime.now();
  // String _currentMonth = DateFormat.yMMM().format(DateTime.now());
  // DateTime _targetDateTime = DateTime.now();

  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  CalendarFormat _calendarFormat = CalendarFormat.month;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("Start Date: ${widget.startDate}");
    if (widget.currentDate != null) {
      _focusedDay = widget.currentDate!;
      _selectedDay = widget.currentDate!;
    }
  }

  @override
  Widget build(BuildContext context) {

//     final _calendarCarouselNoHeader = CalendarCarousel<Event>(
//       todayBorderColor: Colors.green,
//       onDayPressed: (date, events) {
//         print('pressed date $date');
//         setState(() {
//           _currentDate = date;
//           if (widget.dateHasChoice != null) {
//             widget.dateHasChoice!(_currentDate);
//           }
//         });
//       },
//       daysHaveCircularBorder: false,
//       showOnlyCurrentMonthDate: false,
//       weekendTextStyle: TextStyle(
//         color: Colors.black,
//       ),
//       thisMonthDayBorderColor: Colors.transparent,
//       weekFormat: false,
// //      firstDayOfWeek: 4,
//       height: 350.0,
//       selectedDateTime: _currentDate,
//       targetDateTime: _targetDateTime,
//       customGridViewPhysics: NeverScrollableScrollPhysics(),
//       markedDateCustomShapeBorder:
//       CircleBorder(side: BorderSide(color: Colors.yellow)),
//       markedDateCustomTextStyle: TextStyle(
//         fontSize: 18,
//         color: Colors.blue,
//       ),
//       showHeader: true,
//       todayTextStyle: TextStyle(
//         color: Colors.blue,
//       ),
//       todayButtonColor: Colors.yellow,
//       selectedDayTextStyle: TextStyle(
//         color: Colors.yellow,
//       ),
//       minSelectedDate: _currentDate.subtract(Duration(days: 360*2)),
//       maxSelectedDate: _currentDate.add(Duration(days: 360*2)),
//       prevDaysTextStyle: TextStyle(
//         fontSize: 16,
//         color: Colors.grey,
//       ),
//       inactiveDaysTextStyle: TextStyle(
//         color: Colors.tealAccent,
//         fontSize: 16,
//       ),
//       onCalendarChanged: (DateTime date) {
//         this.setState(() {
//           print('pressed target date $date');
//           _targetDateTime = date;
//           _currentMonth = DateFormat.yMMM().format(_targetDateTime);
//         });
//       },
//       onDayLongPressed: (DateTime date) {
//         print('long pressed date $date');
//         this.setState(() {
//           _currentDate = date;
//         });
//       },
//     );
//
//     print(' pressed date $_currentDate');

    return Container(
      child: Column(
        children: [
          // _calendarCarouselNoHeader,
            TableCalendar(
              firstDay: _focusedDay.subtract(Duration(days: 360*2)),
              lastDay: _focusedDay.add(Duration(days: 360*2)),
              focusedDay: _focusedDay,
              calendarFormat: _calendarFormat,
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                if (!isSameDay(_selectedDay, selectedDay)) {
                  if (widget.startDate == null?true:(selectedDay.isAfter(widget.startDate!) || isSameDay(widget.startDate!, selectedDay))) {
                    setState(() {
                      _selectedDay = selectedDay;
                      _focusedDay = focusedDay;
                    });
                  }
                }
              },
              onFormatChanged: (format) {
                if (_calendarFormat != format) {
                  setState(() {
                    _calendarFormat = format;
                  });
                }
              },
              onPageChanged: (focusedDay) {
                _focusedDay = focusedDay;
              },
            ),
          Row( mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: () {
                Navigator.pop(widget.mainContext);
              }, child: Text('Cancel')),
              Container(width: 10,),
              ElevatedButton(onPressed: () {
                // if (_selectedDay != null) {
                  if (widget.dateHasChoice != null) {
                    widget.dateHasChoice!(_selectedDay);
                  }
                // }

                Navigator.pop(widget.mainContext);
              }, child: Text('OK')),
            ],
          ),
        ],
      ),
    );
  }
}
