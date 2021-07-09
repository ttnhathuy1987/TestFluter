import 'package:flutter/material.dart';


class LabeledRadio extends StatelessWidget {
  const LabeledRadio({
    Key? key,
    required this.label,
    required this.padding,
    required this.groupValue,
    required this.value,
    required this.onChanged, this.activeColor,
  }) : super(key: key);

  final Text label;
  final EdgeInsets padding;
  final String groupValue;
  final String value;
  final Function onChanged;
  final Color? activeColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (value != groupValue) {
          onChanged(value);
        }
      },
      child: Padding(
        padding: padding,
        child: Row(
          children: <Widget>[
            label,
            Radio<String>(
              activeColor: (activeColor == null)?Colors.blue:activeColor,
              groupValue: groupValue,
              value: value,
              onChanged: (String? newValue) {
                onChanged(newValue);
              },
            ),
          ],
        ),
      ),
    );
  }
}
