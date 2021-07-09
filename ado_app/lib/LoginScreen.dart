
import 'package:ado_app/MainTabView.dart';
import 'package:ado_app/models/Constant.dart';
import 'package:flutter/material.dart';
import 'ControllView/CustomTextField.dart';

import 'HomeScreenView.dart';

class LoginScreenView extends StatefulWidget {
  @override
  _LoginScreenViewState createState() => _LoginScreenViewState();
}

class _LoginScreenViewState extends State<LoginScreenView> {

  // ignore: non_constant_identifier_names
  var tx_username = TextEditingController();
  // ignore: non_constant_identifier_names
  var tx_password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title:Center(
      //     child: Text("Login Screen",textAlign: TextAlign.center,),
      //   ),
      // ),
      body: Column(  mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 40,
          ),
          Container(
            width:  200.00,
            height: 87.00,
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: ExactAssetImage('images/logo_icon.png'),
                fit: BoxFit.fitHeight,
                ),
              )),
          Container(
            height: 89,
          ),
          CustomTextField(txUsername: tx_username, hintText: 'Username',iconURL :'images/icon_human.png',isPass: false,),
          Container(
            height: 19,
          ),
          CustomTextField(txUsername: tx_password, hintText: 'Password',iconURL :'images/icon_lock.png',isPass: true,),
          Container(
            height: 79,
          ),
          Container(
            margin: const EdgeInsets.only(left: 22.0, right: 22.0),
            width: double.infinity,
            height: 45,
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(kMainLightBlackColor),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(45/2),
                      )
                  )
              ),

              onPressed: () {
                // Navigate back to first route when tapped.
                FocusManager.instance.primaryFocus!.unfocus();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MainTabView()),
                );
                // showDialog(context: context, builder: (context) {
                //   return AlertDialog(
                //     // Retrieve the text the that user has entered by using the
                //     // TextEditingController.
                //     content: Text(tx_username.text + ' ' + tx_password.text),
                //   );
                // });
              },
              child: Text('LOGIN',style: TextStyle(color: kMainGreenColor,fontFamily: 'SFUI_Bold',fontSize: 18),),),
          ),
        ],
      ),
    );
  }
}
