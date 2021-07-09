import 'package:ado_app/ControllView/CustomDateField.dart';
import 'package:ado_app/ControllView/CustomDropdown.dart';
import 'package:ado_app/models/Constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ControllView/CustomRadioButton.dart';
import 'ControllView/PopupCalendar.dart';

class AddRequestView extends StatefulWidget {
  @override
  _AddRequestViewState createState() => _AddRequestViewState();
}

class _AddRequestViewState extends State<AddRequestView> {

  TextEditingController txtReason = TextEditingController();

  // Group Leave Day counting
  double leaveDays = 0;
  int indexChoice = -1;
  DateTime? fromDate;
  DateTime? toDate;

  //Group Leave 1 Day morning and afternoon
  List<String> listGroupTime = ['morning','afternoon'];
  String valueGroupTime = 'morning';

  void showPopupToDate() {
    FocusManager.instance.primaryFocus!.unfocus();
    showDialog(context: context, builder: (context)
    {
      return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          child: Column(mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container( margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                child: PopupCalendar(mainContext: context,
                  currentDate: toDate,
                  startDate: fromDate,
                  dateHasChoice: (DateTime? timeChoice) {
                    if (timeChoice != null) {
                      this.setState(() {
                        toDate = timeChoice;
                        indexChoice = -1;
                        leaveDays = 0;
                      });
                    }
                  },
                ),
              ),
            ],
          )
      );
    });
  }

  void showPopupFromDate() {
    FocusManager.instance.primaryFocus!.unfocus();
    showDialog(context: context, builder: (context)
    {
      return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          child: Column(mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container( margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                child: PopupCalendar(mainContext: context,
                  currentDate: fromDate,
                  startDate: fromDate,
                  dateHasChoice: (DateTime? timeChoice) {
                    if (timeChoice != null) {
                      this.setState(() {
                        fromDate = timeChoice;
                        if (toDate != null && fromDate!.isAfter(toDate!))
                          toDate = null;
                        indexChoice = -1;
                        leaveDays = 0;
                      });
                    }
                  },
                ),
              ),
            ],
          )
      );
    });
  }

  Widget dropdownDaysLeave() {
    if (fromDate != null && toDate != null) {
      int countDays = toDate!.difference(fromDate!).inDays + 1;
      List<String> listItem = ['${countDays - 0.5} days','$countDays days'];
      int idChoice = 1;
      if (indexChoice != -1)
        idChoice = indexChoice;
      else
        indexChoice = idChoice;
      return Container( margin: EdgeInsets.only(top:20, left: 14, right: 14),
          decoration: new BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              border: Border.all(
                  color: kMainColorBorder,
                  width: 1
              )
          ),
          height: 40,
          child: Container(margin: EdgeInsets.only(left: 15, top: 4, bottom: 4),
          child: CustomDropdown(listItem: listItem, valueChoice: listItem[idChoice], changedValue: (int index){

            setState(() {
              indexChoice = index;
              if (index == 0) {
                leaveDays = countDays - 0.5;
              } else {
                leaveDays = countDays.ceilToDouble();
              }
            });

          }),)
      );
    }
    return Container();
  }

  Widget radioTimeLine() {
    if (indexChoice == 0) {
      return Container(margin: EdgeInsets.only(top: 0, left: 14, right: 14),
          child: Container(
            margin: EdgeInsets.only(left: 15, right: 15),
            child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(child: LabeledRadio(
                  label: Text(listGroupTime[0],
                            style: TextStyle(
                            fontFamily: 'SFUI_Regular',
                            fontSize: 16, color: kMainLightBlackColor
                            ),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  activeColor: kMainGreenColor,
                  value: listGroupTime[0],
                  groupValue: valueGroupTime,
                  onChanged: (String newValue) {
                    setState(() {
                      valueGroupTime = newValue;
                    });
                  },
                ),),
                Flexible(child: LabeledRadio(
                  label: Text(listGroupTime[1],
                    style: TextStyle(
                        fontFamily: 'SFUI_Regular',
                        fontSize: 16, color: kMainLightBlackColor
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  activeColor: kMainGreenColor,
                  value: listGroupTime[1],
                  groupValue: valueGroupTime,
                  onChanged: (String newValue) {
                    setState(() {
                      valueGroupTime = newValue;
                    });
                  },
                ),),
                // Flexible(
                //   fit: FlexFit.tight,
                //   child: RadioListTile(
                //     activeColor: kMainGreenColor,
                //     dense: true,
                //     title: Text(listGroupTime[0],
                //     style: TextStyle(
                //         fontFamily: 'SFUI_Regular',
                //         fontSize: 16, color: kMainLightBlackColor
                //     ),
                //   ),
                //   contentPadding: EdgeInsets.all(4),
                //   value: listGroupTime[0],
                //   groupValue: valueGroupTime,
                //   onChanged: (String? valueChoice) {
                //     setState(() {
                //       valueGroupTime = valueChoice!;
                //     });
                //   },
                // ),),
                // Flexible(
                //   fit: FlexFit.tight,
                //   child:  RadioListTile(
                //     activeColor: kMainGreenColor,
                //     contentPadding: EdgeInsets.all(4),
                //     dense: true,
                //     title: Text(listGroupTime[1],
                //     style: TextStyle(
                //         fontFamily: 'SFUI_Regular',
                //         fontSize: 16, color: kMainLightBlackColor
                //     ),),
                //   value: listGroupTime[1],
                //   groupValue: valueGroupTime,
                //   onChanged: (String? valueChoice) {
                //     setState(() {
                //       valueGroupTime = valueChoice!;
                //     });
                //   },
                // ),),
              ],
            ),
          )
      );
    }
    return Container();
  }

  bool checkInputFullInfo() {
    if (fromDate != null && toDate != null && txtReason.text.isNotEmpty) {
      return true;
    }
    return false;
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    txtReason.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    CustomDateField fromDateView = CustomDateField(
      hintText: 'From date',
      currentDate: fromDate, openPopupCalendar: (){
        showPopupFromDate();
    },);
    CustomDateField toDateView = CustomDateField(
      currentDate: toDate,
      hintText: 'To date',openPopupCalendar: (){
        showPopupToDate();
    },);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text('Send Leave Form', style: TextStyle(color: Colors.black87),),
      ),
      body: Container(
        alignment: Alignment.center,
        child: ListView( padding: const EdgeInsets.only(top: 10),
          children: [
            new Row( mainAxisSize: MainAxisSize.max,
              children: [
                Expanded (
                  child:  Container(margin: EdgeInsets.only(left: 14, right: 12),
                    child: fromDateView,
                  ),
                ),
                Expanded (
                  child:  Container(margin: EdgeInsets.only(left: 12, right: 14),
                    child: toDateView,
                  ),
                ),
              ],
            ),
            dropdownDaysLeave(),
            radioTimeLine(),
            Container( margin: EdgeInsets.only(top:(indexChoice == 0)?0:20, left: 14, right: 14),
              constraints: BoxConstraints(
                minHeight: 100
              ),
              decoration: new BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                border: Border.all(
                  color: kMainColorBorder,
                  width: 1
                )
              ),
              child: Container(margin: EdgeInsets.only(left: 15, top: 0, bottom: 10),
                  child: TextFormField(
                    controller: txtReason,
                    style: TextStyle(
                        fontSize: 16,fontFamily: 'SFUI_Regular'
                    ),
                    decoration: InputDecoration(
                      hintText: 'Reason.....',
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
                    onChanged: (String newValue){
                      checkInputFullInfo();
                    },
                  ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 50, left: 90, right: 90),
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(checkInputFullInfo()?kMainLightBlackColor:kMainGrayColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(45/2),
                          side: BorderSide.none
                        )
                    ),
                  shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
                ),
                onPressed: () {
                  // Navigate back to first route when tapped.
                  FocusManager.instance.primaryFocus!.unfocus();
                },
                child: Text('Check info',style: TextStyle(color: checkInputFullInfo()?kMainGreenColor:kMainLightGrayColor,fontFamily: 'SFUI_Regular',fontSize: 18),),),
            ),
          ],
        ),
      ),
    );
  }
}