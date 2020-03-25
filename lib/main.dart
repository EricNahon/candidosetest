import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/constants.dart';
import 'models/app_state.dart';
import 'pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AppState()),
      ],
      child: MaterialApp(
        title: kAppTitle,
        debugShowCheckedModeBanner: false,
        home: MaterialApp(
          title: kAppTitle,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: HomePage(title: 'Questionnaire Candidose'),
        ),
      ),
    );
  }
}
