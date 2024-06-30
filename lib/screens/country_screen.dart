import 'package:flutter/material.dart';
import 'package:germany_holidays/services/travel_service.dart';

import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:germany_holidays/services/day_service.dart';
import 'package:germany_holidays/widgets/days_list.dart';
import 'package:germany_holidays/widgets/day_detail_list.dart';
import 'package:germany_holidays/utils/utils.dart';

class CountryScreen extends StatefulWidget {

  final String country; 
  final List<Map<String,String>> days;
   
  const CountryScreen({
    super.key, 
    required this.country, 
    required this.days
  });

  @override
  State<CountryScreen> createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    final dayModel = Provider.of<DayService>(context);
    final travelService = Provider.of<TravelService>(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            dayModel.currentDay = '';
            travelService.clearPlaces();
            Navigator.pop(context);
          },
          icon: const Icon(Icons.chevron_left, size: 40),
        ),
        actions: [
          IconButton(
            onPressed: () {
              String coordenadas = '';
              if (widget.country == 'Berlín') {
                coordenadas = '52.49463099502936, 13.438340669368404';
              } else if (widget.country == 'Munich') {
                coordenadas = '48.126492135768316, 11.55325865710553';
              } else if (widget.country == 'Londres') {
                coordenadas = '51.51412822372855, -0.20732076019902757';
              }
              openMap(coordenadas);
            },
            icon: Icon(Icons.hotel),
          )
        ],
        backgroundColor: Color(0xff4B92FF),
        elevation: 0,
        title: Text(widget.country, style: GoogleFonts.cabin()),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          if (size.width < 700)
          Container(
            child: DaysList(days: widget.days)
          ),
          if (size.width >= 700 && size.width <= 1366)
          Container(
            margin: EdgeInsets.symmetric(horizontal: size.width * 0.15),
            width: double.infinity,
            child: DaysList(days: widget.days)
          ),
          if (size.width > 1366)
          Container(
            margin: EdgeInsets.symmetric(horizontal: size.width * 0.25),
            width: 1366,
            child: DaysList(days: widget.days)
          ),

          if (size.width < 700)
          Expanded(
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: DayDetailList(day: dayModel.currentDay),
            ),
          ),
          if (size.width >= 700 && size.width <= 1366)
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: size.width * 0.15),
              width: double.infinity,
              height: double.infinity,
              child: DayDetailList(day: dayModel.currentDay),
            ),
          ),
          if (size.width > 1366)
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: size.width * 0.25),
              width: 1366,
              height: double.infinity,
              child: DayDetailList(day: dayModel.currentDay),
            ),
          ),

          const SizedBox(height: 20)
        ]
      ),
    );
  }
}