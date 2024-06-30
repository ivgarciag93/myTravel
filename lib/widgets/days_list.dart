import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:germany_holidays/services/day_service.dart';
import 'package:germany_holidays/services/travel_service.dart';

class DaysList extends StatelessWidget {

  final List<Map<String,String>> days;

  const DaysList({
    super.key, 
    required this.days,
  });

  @override
  Widget build(BuildContext context) {

    final dayModel = Provider.of<DayService>(context);
    final travelService = Provider.of<TravelService>(context);

    return SizedBox(
      width: double.infinity,
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: days.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              travelService.loadPlacesByDay(days[index].values.first);
              dayModel.currentDay = days[index].values.first;
            },
            child: Container(
              width: 80,
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: (days[index].values.first == dayModel.currentDay) ? Color(0xff4B92FF) : Color(0xff0856CF).withOpacity(0.2),
                borderRadius: BorderRadius.circular(15)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(days[index].keys.first, style: GoogleFonts.cabin(
                    color: (days[index].values.first == dayModel.currentDay) ? Colors.white : Color(0xff142D55)
                  )),
                  Text(days[index].entries.first.value, style: GoogleFonts.cabin(
                    fontSize: 20, 
                    fontWeight: FontWeight.bold, 
                    color: (days[index].values.first == dayModel.currentDay) ? Colors.white : Color(0xff142D55))
                  )
                ],
              ),
            ),
          );
        } 
      )
    );
  }
}