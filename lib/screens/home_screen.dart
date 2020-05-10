import 'package:flutter/material.dart';
// import 'package:flut1/screen/search_screen.dart';
// import 'package:flut1/screen/statistic_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
List<DynamicTabContent> myList = new List();

  TabController _cardController;

  TabPageSelector _tabPageSelector;

  @override
  void initState() {
    super.initState();

    myList.add(new DynamicTabContent(Icons.search, "Favorited"));

    _cardController = new TabController(vsync: this, length: myList.length);
    _tabPageSelector = new TabPageSelector(controller: _cardController,);
  }

  @override
  void dispose() {
    _cardController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
         backgroundColor: Colors.redAccent,
         title: new Text('Find car'),
          actions: <Widget>[
            new Padding(
              padding: const EdgeInsets.all(1.0),
              child: new IconButton(
                icon: const Icon(
                  Icons.add,
                  size: 30.0,
                  color: Colors.white,
                ),
                tooltip: 'Add Tabs',

                onPressed: () {
                  if(_cardController.length == 1){
                   List<DynamicTabContent> tempList = new List();

                  myList.forEach((dynamicContent) {
                    tempList.add(dynamicContent);
                  });

                  tempList.add(new DynamicTabContent(Icons.camera, "camera"));

                  setState(() {
                    myList.clear();
                  });
                  myList = tempList;

                  setState(() {
                    _cardController = new TabController(vsync: this, length: myList.length);
                    _tabPageSelector = new TabPageSelector(controller: _cardController);
                  });
                  };                  
                },
              ),
            ),
          ],
          
          bottom: new PreferredSize(
            preferredSize: const Size.fromHeight(10.0),
            child: new Theme(
              data: Theme.of(context).copyWith(accentColor: Colors.blueGrey),
              child: myList.isEmpty
                  ? new Container(
                      height: 30.0,
                    )
                  : new Container(
                      height: 30.0,
                      alignment: Alignment.center,
                      child: _tabPageSelector,
                    ),
            )
          )
      ),
      drawer: Drawer(
        child: Container(
          // color: Colors.red,
          child: ListView(
            padding: EdgeInsets.all(10.0),
            children: <Widget>[
              
              ListTile(
                title: new Text('Statistics'),
                trailing: new Icon(Icons.assessment),
                onTap: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      // builder: (BuildContext context) => StatisticScreen()
                    )
                  );
                }
              ),
            ]
          ),
          
        )
      ),
      body: new TabBarView(
        controller: _cardController,
        children: myList.isEmpty
            ? <Widget>[]
            : myList.map((dynamicContent) {
                return new Card(
                  child: new Container(
                      child:
                        new IconButton(
                        icon: new Icon(dynamicContent.icon, size: 100.0),
                        tooltip: dynamicContent.tooTip,
                        onPressed: null,
                      ),
                      ),
                );
              }).toList(),
      ),
    );
  }
}

class DynamicTabContent {
  IconData icon;
  String tooTip;

  DynamicTabContent(this.icon, this.tooTip);
}