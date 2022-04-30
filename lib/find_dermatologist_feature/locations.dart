import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/services.dart' show rootBundle;
part 'locations.g.dart';


@JsonSerializable()
class LatitudeLongitude {
  LatitudeLongitude({
    required this.lat,
    required this.lng,
  });

  factory LatitudeLongitude.fromJson(Map<String, dynamic> json) => _$LatitudeLongitudeFromJson(json);
  Map<String, dynamic> toJson() => _$LatitudeLongitudeToJson(this);

  final double lat;
  final double lng;
}

@JsonSerializable()
class Area {
  Area({
    required this.coords,
    required this.address,
    required this.id,
    required this.name,
    required this.phone,
  });

  factory Area.fromJson(Map<String, dynamic> json) => _$AreaFromJson(json);
  Map<String, dynamic> toJson() => _$AreaToJson(this);

  final String address;
  final String id;
  final String name;
  final String phone;
  final LatitudeLongitude coords;
}

@JsonSerializable()
class Locations {
  Locations({
    required this.areaName,
    required this.areaLocation,
    required this.areas
  });

  factory Locations.fromJson(Map<String, dynamic> json) =>
      _$LocationsFromJson(json);
  Map<String, dynamic> toJson() => _$LocationsToJson(this);

  final String areaName;
  final LatitudeLongitude areaLocation;
  final List<Area> areas;
}

Future<List<Locations>> getGoogleOffices() async {
  const googleLocationsURL = 'https://about.google/static/data/locations.json';

  // Retrieve the locations of Google offices
  // try {
  //   final response = await http.get(Uri.parse(googleLocationsURL));
  //   if (response.statusCode == 200) {
  //     return Locations.fromJson(json.decode(response.body));
  //   }
  // } catch (e) {
  //   print(e);
  // }

  // Fallback for when the above HTTP request fails.
  print("here");

  return ((await rootBundle.loadString('assets/locations.json')) as List).map((e) => Locations.fromJson(jsonDecode(e))).toList();
}