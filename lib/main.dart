import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "TabBar Inside AppBar Demo",
      home: TabBarInsideAppBarDemo(),
    ));

class TabBarInsideAppBarDemo extends StatefulWidget {
  @override
  _TabBarInsideAppBarDemoState createState() => _TabBarInsideAppBarDemoState();
}

class _TabBarInsideAppBarDemoState extends State<TabBarInsideAppBarDemo>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  Widget getTabBar() {
    return TabBar(controller: tabController, tabs: [
      Tab(text: "Add", icon: Icon(Icons.add)),
      Tab(text: "Edit", icon: Icon(Icons.edit)),
      Tab(text: "Delete", icon: Icon(Icons.delete)),
    ]);
  }

  Widget getTabBarPages() {
    return TabBarView(controller: tabController, children: <Widget>[
      Container(color: Colors.red),
      Container(color: Colors.green),
      Container(color: Colors.blue)
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          flexibleSpace: SafeArea(
            child: getTabBar(),
          ),
        ),
        body: getTabBarPages());
  }
}
