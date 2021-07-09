import 'package:ado_app/ControllView/CustomRowInfo.dart';
import 'package:ado_app/ControllView/CustomRowLeaveDay.dart';
import 'package:ado_app/ControllView/CustomRowUserInfo.dart';
import 'package:ado_app/InfoUserView.dart';
import 'package:ado_app/MainTabView.dart';
import 'package:ado_app/models/UserInfoModel.dart';
import 'package:flutter/material.dart';
import 'package:ado_app/ControllView/AddEditLeaveDay.dart';
import 'package:ado_app/ControllView/InfoLeaveDayView.dart';


class HomeScreenView extends StatefulWidget {
  final Function? goToNotification;

  const HomeScreenView({Key? key, this.goToNotification}) : super(key: key);

  @override
  _HomeScreenViewState createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  UserInfoModel currentUser = UserInfoModel.createUserFake();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text('Statistical', style: TextStyle(color: Colors.black87),),
        actions: [
          new IconButton(icon: Image.asset('images/icon_bell.png', height: 24, width: 24,), onPressed: (){
            if (widget.goToNotification != null) {
              widget.goToNotification!();
            }
          })
        ],
      ),
      body: SingleChildScrollView(
        child:
          Column(
            children: [
              Container(height: 12,),
              CustomRowUserInfo(userName: 'team.ado@gmail.com',showArrow: true, currentUser: currentUser,),
              Container(height: 56,),
              CustomRowLeaveDay(licenseDay: '10', totalDayOff: '03'),
              Container(height: 57,),
              CustomRowDetail(title: 'Annual leave', valueShow: '12'),
              Container(height: 12,),
              CustomRowDetail(title: 'Days of advance leave', valueShow: '8'),
              Container(height: 12,),
              CustomRowDetail(title: 'Cumulative leave days', valueShow: '9'),
          ],
        ),
        )
    );
  }
}
