// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'locations.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LatitudeLongitude _$LatitudeLongitudeFromJson(Map<String, dynamic> json) =>
    LatitudeLongitude(
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
    );

Map<String, dynamic> _$LatitudeLongitudeToJson(LatitudeLongitude instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };

Area _$AreaFromJson(Map<String, dynamic> json) => Area(
      coords:
          LatitudeLongitude.fromJson(json['coords'] as Map<String, dynamic>),
      address: json['address'] as String,
      id: json['id'] as String,
      name: json['name'] as String,
      phone: json['phone'] as String,
    );

Map<String, dynamic> _$AreaToJson(Area instance) => <String, dynamic>{
      'address': instance.address,
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'coords': instance.coords,
    };

Locations _$LocationsFromJson(Map<String, dynamic> json) => Locations(
      areaName: json['areaName'] as String,
      areaLocation: LatitudeLongitude.fromJson(
          json['areaLocation'] as Map<String, dynamic>),
      areas: (json['areas'] as List<dynamic>)
          .map((e) => Area.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LocationsToJson(Locations instance) => <String, dynamic>{
      'areaName': instance.areaName,
      'areaLocation': instance.areaLocation,
      'areas': instance.areas,
    };
