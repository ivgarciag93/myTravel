import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:germany_holidays/widgets/place_card.dart';
import 'package:germany_holidays/services/travel_service.dart';

class DayDetailList extends StatelessWidget {

  final String day;

  const DayDetailList({
    super.key, 
    required this.day
  });

  @override
  Widget build(BuildContext context) {

    final travelService = Provider.of<TravelService>(context);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      width: double.infinity,
      height: double.infinity,
      child: ListView.builder(
        itemCount: travelService.placesSearch.length,
        itemBuilder: (context, index) {
          final place = travelService.placesSearch[index];
          return PlaceCard(place: place);
        },
      )
    );
  }
}