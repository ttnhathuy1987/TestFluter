import 'package:ado_app/models/Constant.dart';
import 'package:flutter/material.dart';


class CustomDropdown extends StatefulWidget {

  final List<String> listItem;
  final String? valueChoice;
  final Function(int indexChoice) changedValue;

  const CustomDropdown({Key? key, required this.listItem, required this.valueChoice, required this.changedValue}) : super(key: key);

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {

  @override
  Widget build(BuildContext context) {
    int indexChoice = (widget.valueChoice != null)?widget.listItem.indexOf(widget.valueChoice!):0;
    return Container(
      child: new DropdownButton(items: widget.listItem.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
            value: value,
            child: Text(value));
      }).toList(),
      value: widget.listItem[indexChoice],
      onChanged: (String? newValue) {
        setState(() {
          indexChoice = widget.listItem.indexOf(newValue!);
          widget.changedValue(indexChoice);
        });
      }, elevation: 16,
        underline: SizedBox(),
        isExpanded: true,
        style: TextStyle(
          fontFamily: 'SFUI-Regular',
          fontSize: 16,
          color: kMainLightBlackColor
        ),
      ),

    );
  }
}
