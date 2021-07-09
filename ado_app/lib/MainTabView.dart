import 'package:ado_app/HIstoryView.dart';
import 'package:ado_app/HomeScreenView.dart';
import 'package:ado_app/RequestDayLeaveView.dart';
import 'package:ado_app/models/Constant.dart';
import 'package:flutter/material.dart';

List<Widget> listContents = <Widget>[
  HomeScreenView(),
  AddRequestView(),
  HistoryView(),
];

List<String> listText = <String>[
  'Home',
  'Add Leave Day',
  'Information',
];

// ignore: must_be_immutable
class MainTabView extends StatefulWidget {

  @override
  _MainTabViewState createState() => _MainTabViewState();

}

class _MainTabViewState extends State<MainTabView> {
  int tabIndex = 0;
  int role = 0;//0 is Admin, 1 is User

  final _selectedItemColor = kMainGreenColor;
  final _unselectedItemColor = kMainBlackColor;
  final _selectedBgColor = kMainLightBlackColor;
  final _unselectedBgColor = kMainLightGrayColor;

  void _onItemTapped(int index) {
    setState(() {
      tabIndex = index;
    });
  }

  void gotoNotification() {
    _onItemTapped(2);
  }

  Color _getBgColor(int index) =>
      tabIndex == index ? _selectedBgColor : _unselectedBgColor;

  Color _getItemColor(int index) =>
      tabIndex == index ? _selectedItemColor : _unselectedItemColor;

  Widget _buildIcon(Image image, String text, int index) => Container(
    width: double.infinity,
    height: kBottomNavigationBarHeight,
    child: Material(
      color: _getBgColor(index),
      child: InkWell(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(height: 4,),
            image,
            Container(height: 6,),
            Text(text,
                style: TextStyle(fontSize: 12, color: _getItemColor(index))),
          ],
        ),
        onTap: () => _onItemTapped(index),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: tabIndex==0?HomeScreenView(goToNotification: gotoNotification,):listContents[tabIndex],
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
         showUnselectedLabels: false,
            selectedFontSize: 0,
         selectedItemColor: kMainGreenColor,
        // unselectedItemColor: kMainBlackColor,
        backgroundColor: kMainLightGrayColor,
    type: BottomNavigationBarType.fixed,
    currentIndex: tabIndex,
    // onTap: (int index) {
    // setState(() {
    //   if (role == 1 && index == 1)
    //     return;
    //   tabIndex = index;
    // });
    // },
    items: [
      BottomNavigationBarItem(
        icon: _buildIcon(tabIndex==0?Image.asset('images/icon_home.png',height: 25, width: 25,):Image.asset('images/icon_home_gray.png',height: 25,
                       width: 25,), 'Home', 0),
        label: 'Home',
      ),
      // BottomNavigationBarItem(
      //    icon: new Image.asset('images/icon_home_gray.png',height: 25,
      //      width: 25,),
      //    activeIcon: new Image.asset('images/icon_home.png',height: 25,
      //      width: 25,),
      //    label: 'Home',
      //   backgroundColor: Colors.redAccent,
      //  // backgroundColor: Colors.red

      BottomNavigationBarItem(
         // icon: new Image.asset('images/icon_contract_gray.png',height: 25,
         //   width: 25,),
         // activeIcon: new Image.asset('images/icon_contract.png',height: 25,
         //   width: 25,),
         // label: 'Add Leave Day',
        icon: _buildIcon(tabIndex==1?Image.asset('images/icon_contract.png',height: 25, width: 25,):Image.asset('images/icon_contract_gray.png',height: 25,
          width: 25,), 'Add Leave Day', 1),
        label: 'Add Leave Day',
          //backgroundColor: tabIndex == 1?kMainLightBlackColor:kMainLightGrayColor
    ),
      BottomNavigationBarItem(
        icon: _buildIcon(tabIndex==2?Image.asset('images/icon_view_files.png',height: 25, width: 25,):Image.asset('images/icon_view_files_gray.png',height: 25,
          width: 25,), 'Information', 2),
        //  icon: new Image.asset('images/icon_view_files_gray.png',height: 25,
        //    width: 25,),
        // activeIcon: new Image.asset('images/icon_view_files.png',height: 25,
        //   width: 25,),
        label: 'Information',
          //backgroundColor: tabIndex == 2?kMainLightBlackColor:kMainLightGrayColor
      ),
    ]),
    backgroundColor: Colors.white,
    );
  }
}

