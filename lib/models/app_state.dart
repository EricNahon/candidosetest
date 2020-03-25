import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'constants.dart';
import 'question.dart';

class AppState with ChangeNotifier {
  AppState() {
    fetchData();
  }

  List<Question> questions = [];

  int _currentPageIndex = 0;
  int get currentPageIndex => _currentPageIndex;
  set currentPageIndex(int newValue) {
    _currentPageIndex = newValue;
    notifyListeners();
  }

  bool _isFetching = false;
  bool get isFetching => _isFetching;
  set isFetching(bool newValue) {
    _isFetching = newValue;
    notifyListeners();
  }

  //
  Future<void> fetchData() async {
    isFetching = true;
    questions = await getQuestionsList();
    _isFetching = false;
    notifyListeners();
  }

  Future<List<Question>> getQuestionsList() async {
    String jsondata;
    dynamic _response;

    _response = await http.get(kUrlQuestions);
    if (_response.statusCode == 200) {
      jsondata = _response.body;
    }

    return parseQuestions(jsondata);
  }

  List<Question> parseQuestions(String jsondata) {
    if (jsondata == null) {
      return [];
    }
    final parsed = json.decode(jsondata.toString()).cast<Map<String, dynamic>>();
    return parsed.map<Question>((json) => Question.fromMap(json)).toList();
  }
}
