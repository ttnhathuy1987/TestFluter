import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class ViewAddEditLeaveDay extends StatefulWidget {
  @override
  _ViewAddEditLeaveDayState createState() => _ViewAddEditLeaveDayState();
}

class _ViewAddEditLeaveDayState extends State<ViewAddEditLeaveDay> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TableCalendar(
        firstDay: DateTime.utc(2010, 10, 16),
        lastDay: DateTime.utc(2030, 3, 14),
        focusedDay: DateTime.now(),
      ),
    );
  }
}
