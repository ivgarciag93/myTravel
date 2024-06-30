import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;

import 'package:germany_holidays/models/travel_info.dart';

class TravelCard extends StatelessWidget {

  final TravelInfo from;
  final TravelInfo to;

  const TravelCard({
    super.key,
    required this.from, 
    required this.to
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: double.infinity,
      height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _IconDestination(duration: from.duration),
              const SizedBox(width: 20),
              _OriginDestination(from: from, to: to),
              const SizedBox(width: 70),
              _OriginDestinationIcon(from: from, to: to)
            ],
          )
        ],
      ),
    );
  }
}

class _IconDestination extends StatelessWidget {

  final String duration;

  const _IconDestination({
    required this.duration
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Transform.rotate(
          angle: 180 * math.pi / 180,
          child: Icon(Icons.airplanemode_active, size: 30, color: Color(0xff4B92FF))
        ),
        for(int i = 0; i < 4; i++)
        Icon(Icons.fiber_manual_record, size: 12, color: Color(0xff4B92FF)),
        Text(duration, style: GoogleFonts.cabin(color: Color(0xff4B92FF), fontSize: 14)),
        for(int i = 0; i < 4; i++)
        Icon(Icons.fiber_manual_record, size: 12, color: Color(0xff0856CF).withOpacity(0.2)),
        Icon(Icons.location_on, size: 30, color: Color(0xff0856CF).withOpacity(0.2)),
      ],
    );
  }
}

class _OriginDestination extends StatelessWidget {

  final TravelInfo from;
  final TravelInfo to;

  const _OriginDestination({
    required this.from, 
    required this.to
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(text: "${from.flight}\n", style: GoogleFonts.cabin(color: Color(0xff142D55), fontSize: 18)),
              TextSpan(text: from.airport, style: GoogleFonts.cabin(color: Color(0xff142D55), fontSize: 18, fontWeight: FontWeight.bold))
            ]
          )
        ), 
        const SizedBox(height: 65),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(text: "${to.flight}\n", style: GoogleFonts.cabin(color: Color(0xff142D55), fontSize: 18)),
              TextSpan(text: to.airport, style: GoogleFonts.cabin(color: Color(0xff142D55), fontSize: 18, fontWeight: FontWeight.bold))
            ]
          )
        ), 
      ],
    );
  }
}

class _OriginDestinationIcon extends StatelessWidget {

  final TravelInfo from;
  final TravelInfo to;

  const _OriginDestinationIcon({
    required this.from, 
    required this.to
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(from.country, style: GoogleFonts.cabin(fontSize: 26, fontWeight: FontWeight.bold, color: Color(0xff142D55))),
        Text(from.time, style: GoogleFonts.cabin(fontSize: 18, color: Color(0xff142D55))),
        const SizedBox(height: 10),
        Container(
          margin: const EdgeInsets.only(left: 5),
          child: Icon(Icons.swap_vert, size: 40, color: Color(0xff4B92FF))
        ),
        const SizedBox(height: 10),
        Text(to.time, style: GoogleFonts.cabin(fontSize: 18, color: Color(0xff142D55))),
        Text(to.country, style: GoogleFonts.cabin(fontSize: 26, fontWeight: FontWeight.bold, color: Color(0xff142D55))),
        
      ],
    );
  }
}