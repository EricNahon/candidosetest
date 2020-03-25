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

  int _currentQuestionIndex = 0;
  int get currentQuestionIndex => _currentQuestionIndex;
  set currentQuestionIndex(int newValue) {
    _currentQuestionIndex = newValue;
    notifyListeners();
  }

  HomePageContent _currentContentIndex = HomePageContent.start;
  HomePageContent get currentContentIndex => _currentContentIndex;
  set currentContentIndex(HomePageContent newValue) {
    _currentContentIndex = newValue;
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
    //questions = await getQuestionsList();

    String jsondata;
    dynamic _response;

    _response = await http.get(kUrlQuestions);
    if (_response.statusCode == 200) {
      jsondata = _response.body;
      print(jsondata);
    }

    questions = parseQuestions(jsondata);

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
