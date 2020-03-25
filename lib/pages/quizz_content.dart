import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/constants.dart';
import '../models/app_state.dart';
import '../models/question.dart';

class QuizzContent extends StatefulWidget {
  @override
  _QuizzContentState createState() => _QuizzContentState();
}

class _QuizzContentState extends State<QuizzContent> {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    List<Question> questions = appState.questions;

    return Center(
      child: Container(
        child: SingleChildScrollView(
          child: Column(children: <Widget>[
            Text('nb question: ${questions.length}'),
          ]),
        ),
      ),
    );
  }
}
