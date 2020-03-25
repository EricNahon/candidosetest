import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/constants.dart';
import '../models/app_state.dart';
import '../components/content_frame.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  HomePageContent selectedOption = HomePageContent.start;

  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 2);
    tabController.addListener(tabbarHasChanged);
  }

  void tabbarHasChanged() {
    if (tabController.index == 0) { loadContent(context, HomePageContent.start); }
    if (tabController.index == 1) { loadContent(context, HomePageContent.videos); }
  }

  void loadContent(BuildContext context, HomePageContent selectedContent) {
    setState(() {
      this.selectedOption = selectedContent;
    });
  }

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black, size: 20, opacity: 0.9),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(width: 5),

            MaterialButton(
              onPressed: () {
                loadContent(context, HomePageContent.start);
              },
              child: Text(
                widget.title,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Quicksand",
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
                maxLines: 1,
              ),
              splashColor: Colors.indigo[700],
              highlightColor: Colors.indigo[700],
              minWidth: 100.0,
            ),
          ],
        ),
        titleSpacing: 0.0,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          TabBar(
            controller: tabController,
            indicatorColor: Colors.black,
            indicatorSize: TabBarIndicatorSize.label,
            labelColor: Colors.grey,
            unselectedLabelColor: Colors.grey.withOpacity(0.6),
            isScrollable: true,
            tabs: <Widget>[
              Tab(
                child: Text(
                  "Accueil",
                  style: TextStyle(
                    fontFamily: "Quicksand",
                    color: Colors.black,
                    fontSize: 16.0,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  "A propos",
                  style: TextStyle(
                    fontFamily: "Quicksand",
                    color: Colors.black,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: ContentFrame(selectedContent: selectedOption),
    );
  }
}
