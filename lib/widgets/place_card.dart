import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:germany_holidays/screens/place_screen.dart';
import 'package:germany_holidays/models/travel_model.dart';

class PlaceCard extends StatelessWidget {

  final Place place;

  const PlaceCard({
    super.key,
    required this.place,
  });

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.only(top: 10),
      width: double.infinity,
      height: (size.width < 700) ? 200 : 350,
      decoration: BoxDecoration( 
        color: Colors.blueAccent.withOpacity(0.6),
        borderRadius: BorderRadius.circular(20)
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => PlaceScreen(place: place)));
        },
        child: Stack(
          children: [
            Hero(
              tag: place.name,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: CachedNetworkImage(
                  imageUrl: place.img, 
                  fit: BoxFit.cover,
                  height: (size.width < 700) ? 200 : 350,
                  width: double.infinity,
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 10,
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Color(0xff142D55).withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(place.name, style: GoogleFonts.cabin(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold)),
                    Text(place.shortDesc, style: GoogleFonts.cabin(fontSize: 18, color: Colors.white)),
                  ],
                ),
              ),
            ),
            if (place.price != null)
            Positioned(
              bottom: 10,
              right: 10,
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.blueAccent.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Text(place.price!, style: GoogleFonts.cabin(fontSize: 18, color: Colors.white)),
              )
            )
          ],
        ),
      ),
    );
  }
}