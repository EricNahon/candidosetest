import 'package:flutter/material.dart';

import '../models/constants.dart';
import '../pages/about_content.dart';
import '../pages/start_content.dart';
import '../pages/releases_content.dart';
import '../pages/gif_content.dart';

class ContentFrame extends StatelessWidget {
  ContentFrame({this.selectedContent});

  final HomePageContent selectedContent;

  @override
  Widget build (BuildContext context) {
    return getHomeContainer();
  }

  Widget getHomeContainer() {
    switch (selectedContent) {
      case HomePageContent.start:
        return StartContent();
      case HomePageContent.about:
        return AboutContent();
      case HomePageContent.releases:
        return ReleasesContent();
      case HomePageContent.videos:
        return GifContent();
    }
    return StartContent();
  }
}
