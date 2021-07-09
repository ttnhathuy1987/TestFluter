import 'package:flutter/material.dart';


const kMainColor = Color(0xFF573851);

const List<Tab> tabs = <Tab>[
  Tab(child: Text('Individual',
    textAlign: TextAlign.center,
    style: TextStyle(color: Colors.black87),
     ),
  ),
  Tab(child: Text('Staff',
    textAlign: TextAlign.center,
    style: TextStyle(color: Colors.black87),
    ),
  ),
];


class HistoryView extends StatefulWidget {
  @override
  _HistoryViewState createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      // The Builder widget is used to have a different BuildContext to access
      // closest DefaultTabController.
      child: Builder(builder: (BuildContext context) {
        final TabController tabController = DefaultTabController.of(context)!;
        tabController.addListener(() {
          if (!tabController.indexIsChanging) {
            // Your code goes here.
            // To get index of current tab use tabController.index
          }
        });
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            automaticallyImplyLeading: false,
            bottom: const TabBar(
              tabs: tabs,
            ),
            backgroundColor: Colors.white,
            title: Text('Information', style: TextStyle(color: Colors.black87),),
          ),
          body: TabBarView(
            children: [
              Text(''),
              Text(''),
            ],
          ),
        );
      }),
    );
  }
}
