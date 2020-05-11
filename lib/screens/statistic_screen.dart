import 'package:flutter/material.dart';

class StatisticScreen extends StatefulWidget {
  const StatisticScreen({Key key}) : super(key: key);

  @override
  _StatisticScreenState createState() => new _StatisticScreenState();
}

class _StatisticScreenState extends State<StatisticScreen> with SingleTickerProviderStateMixin {
  final List<Tab> myTabs = <Tab>[
    new Tab(text: 'Month'),
    new Tab(text: 'Week'),
    new Tab(text: 'Day'),
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.redAccent,
        leading: new Icon(Icons.insert_chart),
        title: new Text("Statistic"),
        bottom: new TabBar(
          controller: _tabController,
          tabs: myTabs,
        ),
      ),
      
      body: new TabBarView(
        controller: _tabController,
        children: myTabs.map((Tab tab) {
          return Container(
            child: ListView.separated(
            itemCount: 10,//getCountSearchCars
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('Statistic $index car for '+tab.text),
              );
            },
            separatorBuilder: (context, index) {
              return Divider();
            },
            )
          );
        }).toList(),
      ),
      bottomNavigationBar: BottomNavigationBar(
       currentIndex: 0, // this will be set when a new tab is tapped
       items: [
         BottomNavigationBarItem(
           icon: new Icon(Icons.home),
           title: new Text('Month'),
         ),
         BottomNavigationBarItem(
           icon: new Icon(Icons.home),
           title: new Text('Month'),
         ),
       ],
      )
    );
  }
}