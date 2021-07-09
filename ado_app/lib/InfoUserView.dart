import 'package:ado_app/models/Constant.dart';
import 'package:ado_app/models/UserInfoModel.dart';
import 'package:flutter/material.dart';

import 'ControllView/CustomRowUserInfo.dart';
import 'package:intl/intl.dart';

class InfoUserView extends StatefulWidget {

  final UserInfoModel currentUser;

  const InfoUserView({Key? key, required this.currentUser}) : super(key: key);

  @override
  _InfoUserViewState createState() => _InfoUserViewState();

  String valueRowAtIndex(int index) {

    String valueRow = '';
    switch(index) {
      case 0: {
        valueRow = "Full name: ${currentUser.fullName}";
      }break;
      case 1: {
        valueRow = "Employee code: ${currentUser.employeeCode}";
      }break;
      case 2: {
        valueRow = "Join day ${currentUser.fullName}";
      }break;
      case 3: {
        valueRow = "Position: ${DateFormat("dd/MM/yyyy").format(currentUser.joinDay)}";
      }break;
      case 4: {
        valueRow = "Project: ${currentUser.projectName}";
      }break;
      case 5: {
        valueRow = "Project manager: ${currentUser.projectManager}";
      }break;

      default: {
        //statements;
      }
      break;
    }
    return valueRow;
  }
}

class _InfoUserViewState extends State<InfoUserView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: Text(widget.currentUser.userName, style: TextStyle(color: Colors.black87),),
      ),
      body: SingleChildScrollView(
        child: Column (
          children: [
            Container(height: 12,),
            CustomRowUserInfo(userName: 'team.ado@gmail.com',showArrow: false,),
            Container(height: 12,),
            ListView.builder(itemCount: 6,
                shrinkWrap: true,
                itemBuilder: itemBuilder)
          ],
        ),
      ),
    );
  }

  Widget itemBuilder(BuildContext context, int index) {
    return getRow(index, widget.valueRowAtIndex(index));
  }
}

Widget getRow(int i, String valueShow) {
  return Container( margin: EdgeInsets.only(left: 14, right: 14),
    height: 51,
    child: Column(
      children: [
        Container( margin: EdgeInsets.only(left: 14, right: 14),
          alignment: Alignment.centerLeft,
          height: 49,
          child: Text(valueShow,
            style: TextStyle(fontFamily: 'SFUI_Regular', fontSize: 16, color: kMainLightBlackColor),
          ),
        ),
        Container(
          height: 1,
          color: kMainColorBorder,
        )
      ],
    ),
  );
}


