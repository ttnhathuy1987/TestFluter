import 'package:ado_app/ControllView/AddEditLeaveDay.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfoLeaveDayView extends StatefulWidget {
  InfoLeaveDayView({required this.title}) : super();
  final String title;
  @override
  _InfoLeaveDayViewState createState() => _InfoLeaveDayViewState();
}

class _InfoLeaveDayViewState extends State<InfoLeaveDayView> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Row( mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin:
                  EdgeInsets.only(left: 8.0, top: 8.0, bottom: 8.0, right: 12.0),
                  width: 15.0,
                  height: 15.0,
                  decoration: BoxDecoration(
                      color: Colors.red, borderRadius: BorderRadius.circular(40.0)),
                ),
                new Align(
                  child: Text(
                    '$_counter',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
                new Spacer(),
                ElevatedButton(onPressed: _incrementCounter,
                    child:  Icon(Icons.add)),
                Container(
                  width: 10.0,
                  height: 15.0,
                ),
              ],
            ),
          ],
        );// This trailing comma makes auto-formatting nicer for build methods.
  }
}
