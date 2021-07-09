import 'package:ado_app/models/Constant.dart';
import 'package:flutter/material.dart';

class CustomRowLeaveDay extends StatelessWidget {

  final String licenseDay;
  final String totalDayOff;

  const CustomRowLeaveDay({Key? key, required this.licenseDay, required this.totalDayOff}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: new Row( mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(child: Container( margin: EdgeInsets.only(left: 20,right: 10),
            height: 120,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: kMainLightBlackColor
            ),
            child: Column( mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('LICENSE DATE', style: TextStyle(
                    fontFamily: 'SFUI_Semibold', fontSize: 16, color: kMainGreenColor
                ), textAlign: TextAlign.center,),
                Container(height: 10,),
                Text(licenseDay, style: TextStyle(
                    fontFamily: 'SFUI_Semibold', fontSize: 40, color: kMainGreenColor
                ), textAlign: TextAlign.center,),
              ],
            ),
          )),
          Expanded(child: Container( margin: EdgeInsets.only(left: 10,right: 20),
            height: 120,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: kMainGreenColor
            ),
            child: Column( mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('TOTAL DAYS OFF', style: TextStyle(
                    fontFamily: 'SFUI_Semibold', fontSize: 16, color: kMainLightBlackColor
                ), textAlign: TextAlign.center,),
                Container(height: 10,),
                Text(totalDayOff, style: TextStyle(
                    fontFamily: 'SFUI_Semibold', fontSize: 40, color: kMainLightBlackColor
                ), textAlign: TextAlign.center,),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
