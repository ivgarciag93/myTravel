import 'package:url_launcher/url_launcher.dart';

import 'package:germany_holidays/models/travel_model.dart';

Future<void> launch(Place place) async {
  final Uri url = Uri.parse(place.url!);

  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}

Future<void> openMap(String coordenadas) async {
  final query = coordenadas;
  final url = Uri(scheme: 'geo', host: '0,0', queryParameters: {'q': query});

  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}