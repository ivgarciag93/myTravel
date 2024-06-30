import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:germany_holidays/screens/country_screen.dart';
import 'package:germany_holidays/widgets/mytravel_header.dart';

class MainScreen extends StatelessWidget {
   
  const MainScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    // Alemania
    const String germanyTitle = 'Alemania';
    const String exploreBerlin = 'Explorar Berlín';
    const String datesBerlin = ' 1 al 7 de julio (2023)';
    const String exploreMunich = 'Explorar Múnich';
    const String datesMunich = ' 7 al 11 de julio (2023)';

    //Londres
    const String londonTitle = 'Londres';
    const String exploreLondon = 'Explorar Londres';
    const String datesLondon = ' 14 al 17 de agosto (2024)';

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const MyTravelHeader(),
            if (size.width < 700 )
            Container(
              width: double.infinity,
              child: Column(
                children: [
                  // Alemania
                  Container(
                    margin:  const EdgeInsets.only(top: 15, left: 15, right: 10),
                    width: double.infinity,
                    height: 50,
                    child: Text(germanyTitle, style: GoogleFonts.cabin(fontWeight: FontWeight.bold, fontSize: 30, color: Color(0xff142D55))),
                  ),
                  const _MainCard(title: exploreBerlin, dates: datesBerlin),
                  const _MainCard(title: exploreMunich, dates: datesMunich),
                  // Londres
                  Container(
                    margin:  const EdgeInsets.only(top: 15, left: 15, right: 10),
                    width: double.infinity,
                    height: 50,
                    child: Text(londonTitle, style: GoogleFonts.cabin(fontWeight: FontWeight.bold, fontSize: 30, color: Color(0xff142D55))),
                  ),
                  const _MainCard(title: exploreLondon, dates: datesLondon)
                ],
              ),
            ),
            if (size.width > 700 && size.width <= 1366)
            Container(
              margin: EdgeInsets.symmetric(horizontal: size.width * 0.15),
              width: double.infinity,
              child: Column(
                children: [
                  Container(
                    margin:  const EdgeInsets.only(top: 15, left: 15, right: 10),
                    width: double.infinity,
                    height: 50,
                    child: Text(germanyTitle, style: GoogleFonts.cabin(fontWeight: FontWeight.bold, fontSize: 30, color: Color(0xff142D55))),
                  ),
                  const _MainCard(title: exploreBerlin, dates: datesBerlin),
                  const _MainCard(title: exploreMunich, dates: datesMunich),
                  // Londres
                  Container(
                    margin:  const EdgeInsets.only(top: 15, left: 15, right: 10),
                    width: double.infinity,
                    height: 50,
                    child: Text(londonTitle, style: GoogleFonts.cabin(fontWeight: FontWeight.bold, fontSize: 30, color: Color(0xff142D55))),
                  ),
                  const _MainCard(title: exploreLondon, dates: datesLondon)
                ],
              ),
            ),
            if (size.width > 1366)
            Container(
              margin: EdgeInsets.symmetric(horizontal: size.width * 0.25),
              width: 1366,
              child: Column(
                children: [
                  Container(
                    margin:  const EdgeInsets.only(top: 15, left: 15, right: 10),
                    width: double.infinity,
                    height: 50,
                    child: Text(germanyTitle, style: GoogleFonts.cabin(fontWeight: FontWeight.bold, fontSize: 30, color: Color(0xff142D55))),
                  ),
                  const _MainCard(title: exploreBerlin, dates: datesBerlin),
                  const _MainCard(title: exploreMunich, dates: datesMunich),
                  // Londres
                  Container(
                    margin:  const EdgeInsets.only(top: 15, left: 15, right: 10),
                    width: double.infinity,
                    height: 50,
                    child: Text(londonTitle, style: GoogleFonts.cabin(fontWeight: FontWeight.bold, fontSize: 30, color: Color(0xff142D55))),
                  ),
                  const _MainCard(title: exploreLondon, dates: datesLondon)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _MainCard extends StatelessWidget {

  final String title;
  final String dates;
  
  const _MainCard({
    required this.title, 
    required this.dates,
  });

  @override
  Widget build(BuildContext context) {

    const String countryBerlin = 'Berlín';
    List<Map<String,String>> daysBerlin = [
      {"SÁB": "1"},
      {"DOM": "2"},
      {"LUN": "3"},
      {"MAR": "4"},
      {"MIÉ": "5"},
      {"JUE": "6"},
      {"VIE": "7"}
    ];
    const String countryMunich = 'Múnich';
    List<Map<String,String>> daysMunich = [
      {"SÁB": "8"},
      {"DOM": "9"},
      {"LUN": "10"},
      {"MAR": "11"}
    ];
    const String countryLondon = 'Londres';
    List<Map<String,String>> daysLondon = [
      {"MIÉ": "14"},
      {"JUE": "15"},
      {"VIE": "16"},
      {"SÁB": "17"}
    ];

    return GestureDetector(
      onTap: () {
        if (title.contains(countryBerlin)) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => CountryScreen(country: countryBerlin, days: daysBerlin)));
        } else if (title.contains(countryMunich)) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => CountryScreen(country: countryMunich, days: daysMunich)));
        } else if (title.contains(countryLondon)) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => CountryScreen(country: countryLondon, days: daysLondon)));
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        width: double.infinity,
        height: 120,
        decoration: BoxDecoration(
          color: Color(0xff0856CF).withOpacity(0.2),
          borderRadius: const BorderRadius.all(Radius.circular(20))
        ),
        child: Row(
          children: [
            Container(
              margin:  const EdgeInsetsDirectional.only(start: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: GoogleFonts.cabin(fontSize: 26, fontWeight: FontWeight.bold, color: Color(0xff142D55))),
                  Row(
                    children: [
                      const Icon(Icons.calendar_month, color: Color(0xff142D55)),
                      Text(dates, style: GoogleFonts.cabin(fontSize: 18, color: Color(0xff142D55))),
                    ],
                  ),
                ],
              )
            ),
             const Spacer(),
            Container(
              margin:  const EdgeInsetsDirectional.only(end: 15),
              decoration: BoxDecoration(
                color: Color(0xff4B92FF),
                borderRadius: BorderRadius.circular(100)
              ),
              child:  const Icon(Icons.chevron_right, color: Colors.white, size: 40,)
            )
          ],
        ),
      )
    );
  }
}