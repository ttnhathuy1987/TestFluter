import 'package:ado_app/models/Constant.dart';
import 'package:flutter/material.dart';

class CustomRowDetail extends StatelessWidget {
  final String title;
  final String valueShow;

  const CustomRowDetail({Key? key, required this.title, required this.valueShow}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10,right: 10),
      constraints: BoxConstraints(
        minHeight: 50,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: kMainGrayColor
      ),
      child: new Row(
        children: [
          Container(width: 16,),
          Text(title, style: TextStyle(
            fontFamily: 'SFUI_Regular', fontSize: 16, color: kMainLightBlackColor
          ), textAlign: TextAlign.left,),
          Spacer(),
          Text(valueShow, style: TextStyle(
              fontFamily: 'SFUI_Regular', fontSize: 16, color: kMainLightBlackColor
          ), textAlign: TextAlign.right,),
          Container(width: 17,)
        ],
      ),
    );
  }
}
