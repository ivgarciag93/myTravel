import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:germany_holidays/widgets/travel_card.dart';
import 'package:germany_holidays/services/day_service.dart';
import 'package:germany_holidays/models/travel_info.dart';
import 'package:germany_holidays/models/travel_model.dart';
import 'package:germany_holidays/utils/utils.dart';

class PlaceScreen extends StatelessWidget {

  final Place place;

  const PlaceScreen({
    super.key,
    required this.place,
  });

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    final dayModel = Provider.of<DayService>(context);

    final TravelInfo fromMadrid = TravelInfo('1 de julio', '3h 05min', 'Origen', 'MAD', 'Barajas, T4', '15:55h');
    final TravelInfo toBerlin = TravelInfo('1 de julio', '3h 05min', 'Destino', 'BER', 'Branderburgo, T1', '19:00h');

    final TravelInfo fromBerlin = TravelInfo('7 de julio', '1h 10min', 'Origen', 'BER', 'Branderburgo, T1', '12:50h');
    final TravelInfo toMunich = TravelInfo('7 de julio', '1h 10min', 'Llegada', 'MUN', 'FJ Strauss, T2', '14:00h');

    final TravelInfo fromMunich = TravelInfo('11 de julio', '2h 40min', 'Origen', 'MUN', 'FJ Strauss, T2', '12:00h');
    final TravelInfo toMadrid = TravelInfo('7 de julio', '2h 40min', 'Llegada', 'MAD', 'Barajas, T2', '14:40h');

    final TravelInfo fromMadridLondon = TravelInfo('14 de agosto', '1h 30min', 'Origen', 'MAD', 'Barajas', '08:00h');
    final TravelInfo toLondonMadrid = TravelInfo('14 de agosto', '1h 30min', 'Llegada', 'LON', 'Heathrow', '09:30h');

    final TravelInfo fromLondonMadrid = TravelInfo('17 de agosto', '3h 25min', 'Origen', 'LON', 'Heathrow', '18:45h');
    final TravelInfo toMadridLondon = TravelInfo('17 de agosto', '3h 25min', 'Llegada', 'MAD', 'Barajas', '22:10h');

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (size.width < 700)
          _PlaceImage(place: place),
          if (size.width < 700)
          _PlaceName(place: place),
          if (size.width < 700)
          _PlaceMaps(place: place),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  if (size.width >= 700)
                  _PlaceImage(place: place),

                  if (size.width >= 700)
                  _PlaceName(place: place),

                  if (size.width >= 700)
                  _PlaceMaps(place: place),

                  if (place.schedule != null && place.price != null && size.width < 700)
                  Container(
                    child: _PlacePriceSchedule(place: place)
                  ),
                  if (place.schedule != null && place.price != null && size.width >= 700 && size.width <= 1366)
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: size.width * 0.15),
                    width: double.infinity,
                    child: _PlacePriceSchedule(place: place)
                  ),
                  if (place.schedule != null && place.price != null && size.width > 1366)
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: size.width * 0.25),
                    width: 1366,
                    child: _PlacePriceSchedule(place: place)
                  ),

                  if (size.width < 700)
                  Container(
                    child: _PlaceDescription(place: place)
                  ),
                  if (size.width >= 700 && size.width <= 1366)
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: size.width * 0.15),
                    width: double.infinity,
                    child: _PlaceDescription(place: place)
                  ),
                  if (size.width > 1366)
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: size.width * 0.25),
                    width: 1366,
                    child: _PlaceDescription(place: place)
                  ),

                  if(dayModel.currentDay == '1' && place.name.contains("Aeropuerto"))
                  TravelCard(from: fromMadrid, to: toBerlin),
                  if(dayModel.currentDay == '7' && place.name.contains("Aeropuerto"))
                  TravelCard(from: fromBerlin, to: toMunich),
                  if(dayModel.currentDay == '11' && place.name.contains("Aeropuerto"))
                  TravelCard(from: fromMunich, to: toMadrid),
                  if(dayModel.currentDay == '14' && place.name.contains("Aeropuerto"))
                  TravelCard(from: fromMadridLondon, to: toLondonMadrid),
                  if(dayModel.currentDay == '17' && place.name.contains("Aeropuerto"))
                  TravelCard(from: fromLondonMadrid, to: toMadridLondon),
                  const SizedBox(height: 20)
                ],
              ),
            ),
          )
          
        ]
      ));
  }
}

class _PlaceImage extends StatelessWidget {

  final Place place;

  const _PlaceImage({
    required this.place,
  });

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        if (size.width < 700)
        Container(
          color: Color(0xff4B92FF),
          width: double.infinity,
          height: 35
        ),
        Stack(
          children: [
            if (size.width < 700)
            Container(
              height: 250,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
              child: CachedNetworkImage(
                imageUrl: place.img, 
                fit: BoxFit.cover,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    image: DecorationImage(
                      image: imageProvider, fit: BoxFit.cover
                    )
                  ),
                )
              )
            ),
            if (size.width >= 700 && size.width <= 1366)
            Container(
              height: 300,
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: size.width * 0.15, vertical: 10),
              child: CachedNetworkImage(
                imageUrl: place.img, 
                fit: BoxFit.cover,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    image: DecorationImage(
                      image: imageProvider, fit: BoxFit.cover
                    )
                  ),
                )
              )
            ),
            if (size.width > 1366)
            Container(
              height: 350,
              width: 1366,
              margin: EdgeInsets.symmetric(horizontal: size.width * 0.25, vertical: 10),
              child: CachedNetworkImage(
                imageUrl: place.img, 
                fit: BoxFit.cover,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    image: DecorationImage(
                      image: imageProvider, fit: BoxFit.cover
                    )
                  ),
                )
              )
            ),
            Positioned(
              top: (size.width < 700) ? 20 : 30,
              left: (size.width < 700) ? 20 : size.width * 0.15,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.chevron_left, size: 40, color: Colors.white70),
              ),
            )
          ],
        )
      ],
    );
  }
}

class _PlaceName extends StatelessWidget {

  final Place place;

  const _PlaceName({
    required this.place,
  });

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (size.width < 700)
          Container(
            child: Text(place.name, style: GoogleFonts.cabin(fontSize: 30, fontWeight: FontWeight.bold, color: Color(0xff142D55)))
          ),
          if (size.width >= 700 && size.width <= 1366)
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: size.width * 0.15),
            child: Text(place.name, style: GoogleFonts.cabin(fontSize: 30, fontWeight: FontWeight.bold, color: Color(0xff142D55)))
          ),
          if (size.width > 1366)
          Container(
            width: 1366,
            margin: EdgeInsets.symmetric(horizontal: size.width * 0.25),
            child: Text(place.name, style: GoogleFonts.cabin(fontSize: 30, fontWeight: FontWeight.bold, color: Color(0xff142D55)))
          ),
        ],
      )
    );
  }
}

class _PlaceMaps extends StatelessWidget {

  final Place place;

  const _PlaceMaps({
    required this.place
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _MyCustomButton(place: place, icon: Icons.place_outlined, text: 'Cómo llegar', onPressed: () => openMap(place.maps)),
          const SizedBox(width: 10),
          _MyCustomButton(place: place, icon: Icons.public_outlined, text: 'Información', onPressed: () => launch(place)),
        ],
      ),
    );
  }
}

class _MyCustomButton extends StatelessWidget {

  final Place place;
  final IconData icon;
  final String text;
  final Function onPressed;
  
  const _MyCustomButton({
    required this.place, 
    required this.icon, 
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Color(0xff0856CF).withOpacity(0.2)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          )
        ),
        padding: MaterialStateProperty.all(const EdgeInsets.all(10))
      ),
      onPressed: () => onPressed(),
      child: Row(
        children: [
          Icon(icon, color: Color(0xff142D55), size: 19),
          const SizedBox(width: 5),
          Text(text, style: GoogleFonts.cabin(color: Color(0xff142D55), fontSize: 16))
        ],
      ),
    );
  }
}

class _PlacePriceSchedule extends StatelessWidget {

  final Place place;

  const _PlacePriceSchedule({
    required this.place,
  });

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 25),
          constraints: BoxConstraints(maxWidth: size.width * 0.40),
          child: Text(place.price!, style: GoogleFonts.cabin(color: Color(0xff4B92FF), fontWeight: FontWeight.bold, fontSize: 25))),
        Container(
          margin: const EdgeInsets.only(left: 30, right: 15),
          constraints: BoxConstraints(maxWidth: size.width * 0.60),
          child: Text(place.schedule!, style: GoogleFonts.cabin(fontSize: 16, color: Color(0xff142D55))),
        ),
      ],
    );
  }
}

class _PlaceDescription extends StatelessWidget {

  final Place place;

  const _PlaceDescription({
    required this.place,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(place.shortDesc, style: GoogleFonts.cabin(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xff142D55))),
          _HorizontalSpacer(),
          const SizedBox(height: 10),
          Text(place.desc, style: GoogleFonts.cabin(fontSize: 18, color: Color(0xff142D55)), textAlign: TextAlign.left),
        ],
      )
    );
  }
}

class _HorizontalSpacer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 2,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
          Color(0xff4B92FF),
          Color(0xff4B92FF).withOpacity(0.2),
          Color(0xff4B92FF).withOpacity(0.01),
          ],
          stops: const [0.0, 0.7, 1]
        )
      ),
    );
  }
}