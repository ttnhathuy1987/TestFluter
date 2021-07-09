import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';

import 'PopupCalendar.dart';

// ignore: must_be_immutable
class CustomDateField extends StatefulWidget {

  final String hintText;
  late DateTime? currentDate;
  final Function? openPopupCalendar;

  CustomDateField({Key? key, required this.hintText, this.currentDate, this.openPopupCalendar}) : super(key: key);

  @override
  _CustomDateFieldState createState() => _CustomDateFieldState();
}

class _CustomDateFieldState extends State<CustomDateField> {

  String strCurrentDate() {
    String value = widget.hintText;
    if (widget.currentDate != null) {
      value = DateFormat("MMM, dd").format(widget.currentDate!);
    }
    return value;
  }

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: (){
        if (widget.openPopupCalendar != null)
            widget.openPopupCalendar!();
      },
      child: Container(
        height: 45,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey,width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(top: 14, bottom: 14,left: 15, right: 8),
              child: Text(strCurrentDate(),style: TextStyle(
                  fontFamily: 'SFUI_Regular',
                  fontStyle: FontStyle.normal
              ),),
            ),
            Spacer(),
            Container(
                margin: EdgeInsets.only(top: 13, bottom: 13),
                width: 20.00,
                height: 20.00,
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                    image: ExactAssetImage('images/icon_calendar.png'),
                    fit: BoxFit.fitWidth,
                  ),
                )
            ),
            Container(width: 10,),
          ],
        ),
      ),
    );
  }
}
