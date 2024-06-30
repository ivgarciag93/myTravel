import 'dart:convert';

class TravelModel {
    TravelModel({
        required this.travel,
    });

    List<Travel> travel;

    factory TravelModel.fromRawJson(String str) => TravelModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory TravelModel.fromJson(Map<String, dynamic> json) => TravelModel(
        travel: List<Travel>.from(json["viaje"].map((x) => Travel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "viaje": List<dynamic>.from(travel.map((x) => x.toJson())),
    };
}

class Travel {
    Travel({
        required this.day,
        required this.country,
        required this.places
    });

    String day;
    String country;
    List<Place> places;

    factory Travel.fromRawJson(String str) => Travel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Travel.fromJson(Map<String, dynamic> json) => Travel(
        day: json["dia"],
        country: json["ciudad"],
        places: List<Place>.from(json["lugares"].map((x) => Place.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "dia": day,
        "ciudad": country,
        "lugares": List<dynamic>.from(places.map((x) => x.toJson())),
    };
}

class Place {
    Place({
        required this.name,
        required this.shortDesc,
        required this.desc,
        required this.img,
        required this.maps,
        this.schedule,
        this.price,
        this.url
    });

    String name;
    String shortDesc;
    String desc;
    String img;
    String maps;
    String? schedule;
    String? price;
    String? url;

    factory Place.fromRawJson(String str) => Place.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Place.fromJson(Map<String, dynamic> json) => Place(
        name: json["nombre"],
        shortDesc: json["descCorta"],
        desc: json["desc"],
        img: json["img"],
        maps: json["maps"],
        schedule: json["horario"],
        price: json["precio"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "nombre": name,
        "descCorta": shortDesc,
        "desc": desc,
        "img": img,
        "maps": maps,
        "horario": schedule,
        "precio": price,
        "url": url,
    };
}
