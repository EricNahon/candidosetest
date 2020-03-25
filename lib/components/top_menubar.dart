import 'package:flutter/material.dart';

class TopMenubar extends StatefulWidget {

  @override
  _TopMenubarState createState() => _TopMenubarState();
}

class _TopMenubarState extends State<TopMenubar> with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 3);
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
        indicatorColor: Colors.black,
        indicatorSize: TabBarIndicatorSize.label,
        labelColor: Colors.grey,
        unselectedLabelColor: Colors.grey.withOpacity(0.6),
        tabs: [
          Tab(
            icon: Icon(Icons.directions_transit),
            child: Text(
              "About",
              style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
            ),
          ),
          Tab(
            icon: Icon(Icons.directions_transit),
            child: Text(
              "Experience",
              style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
            ),
          ),
          Tab(
            icon: Icon(Icons.directions_transit),
            child: Text(
              "Skills",
              style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
            ),
          ),
        ]);
  }
}
