import 'package:ado_app/models/Constant.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {

  final TextEditingController txUsername;
  final String hintText;
  final String iconURL;
  final bool isPass;

  const CustomTextField({Key? key, required this.txUsername, required this.hintText, required this.iconURL, required this.isPass}) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20.0, right: 20.0),
      height: 45,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: kMainColorBorder),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      child: Row( mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              margin: const EdgeInsets.only(top: 12, bottom: 12,left: 19),
              width: 20,
              height: 20,
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: ExactAssetImage(widget.iconURL),
                  fit: BoxFit.fitHeight,
                ),
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
              ),
          ),
          Container(
            width: 23,
          ),
          Flexible(
            child: TextFormField(
              obscureText: widget.isPass,
              controller: widget.txUsername,
              style: TextStyle(
                fontSize: 16,fontFamily: 'SFUI_Regular'
              ),
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
                contentPadding: EdgeInsets.zero,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
              ),
            ),),
        ],
      ),
    );
  }
}
