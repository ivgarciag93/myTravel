import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:germany_holidays/models/travel_model.dart';

class TravelService with ChangeNotifier {

  List<Place> placesSearch = [];

  loadPlacesByDay(String day) async {
    placesSearch.clear();

    final response = await rootBundle.loadString('assets/viaje_data.json');
    final travel = TravelModel.fromRawJson(response).travel;

    placesSearch.addAll(travel.where((element) => element.day == day).first.places);
    notifyListeners();
  }

  clearPlaces() {
    placesSearch.clear();
    notifyListeners();
  }
}