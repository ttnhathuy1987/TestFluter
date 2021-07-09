import 'package:ado_app/InfoUserView.dart';
import 'package:ado_app/models/Constant.dart';
import 'package:ado_app/models/UserInfoModel.dart';
import 'package:flutter/material.dart';

class CustomRowUserInfo extends StatelessWidget {
  final String userName;
  final String? avatar;
  final bool showArrow;

  final UserInfoModel? currentUser;


  const CustomRowUserInfo({Key? key, required this.userName, this.avatar, required this.showArrow, this.currentUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (currentUser != null) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => InfoUserView(currentUser: currentUser!)));
        }

      },
      child: Container(
        margin: EdgeInsets.only(left: 10,right: 10),
        constraints: BoxConstraints(
          minHeight: 70,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: kMainGrayColor
        ),
        child: new Row(
          children: [
            Container(width: 10,),
            Container(
              margin: EdgeInsets.only(left: 7, top: 5, bottom: 6),
              width: 39,
              height: 39,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(39/2),
                child: Image.asset(avatar!=null?avatar!:'images/icon_temp_human.jpg',fit: BoxFit.fill, width: 39, height: 39,),
              ),
            ),
            Container(width: 16,),
            Text(userName, style: TextStyle(
                fontFamily: 'SFUI_Regular', fontSize: 16, color: kMainLightBlackColor
            ), textAlign: TextAlign.left,
            ),
            Spacer(),
            showArrow?Icon(Icons.arrow_forward_ios_outlined):Container(),
            Container(width: 15,)
          ],
        ),
      ),
    );
  }
}
