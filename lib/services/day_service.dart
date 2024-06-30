import 'package:flutter/material.dart';

class DayService with ChangeNotifier {

  String _currentDay = '';

  String get currentDay => _currentDay;
  set currentDay(String day) {
    _currentDay = day;
    notifyListeners();
  }
  
}