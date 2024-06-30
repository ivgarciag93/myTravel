import 'package:flutter/material.dart';
import 'package:germany_holidays/services/travel_service.dart';

import 'package:provider/provider.dart';

import 'package:germany_holidays/screens/main_screen.dart';
import 'package:germany_holidays/services/day_service.dart';

void main() {
  return runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => DayService()),
      ChangeNotifierProvider(create: (_) => TravelService())
    ],
    child: const MyApp())
  );
} 

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'MyTravel',
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}