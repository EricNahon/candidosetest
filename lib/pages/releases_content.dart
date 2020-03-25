import 'package:flutter/material.dart';
import 'dart:html' as html;

import '../models/constants.dart';
import '../components/responsive_widget.dart';

class ReleasesContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/bg_computer.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(children: <Widget>[
        SizedBox(height: 30.0),
        Spacer(),
        Row(children: <Widget>[
          Spacer(flex: ResponsiveWidget.isLargeScreen(context) ? 20 : 6),
          Text("Releases",
              style: TextStyle(color: kTextDarkColour,
                  fontSize: ResponsiveWidget.isLargeScreen(context) ? 22 : 14,
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.normal)),
          Spacer(flex: 1)
        ]),
        Spacer(flex: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: InkWell(
                onTap: () { html.window.open(kUrlGit, ''); },
                child: Container(
                  child: Image.asset('images/GitHub-Mark-Light-32px.png'),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 10.0)
      ]),
    );
  }
}