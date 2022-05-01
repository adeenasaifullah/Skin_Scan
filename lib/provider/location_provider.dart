import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:skin_scan/entities/location_entities.dart';
import '../Models/location_model.dart';

class LocationProvider extends ChangeNotifier{
  List<LocationModel> locationList = [];

  Future getLocation() async {
    locationList.clear();
    await FirebaseFirestore.instance
        .collection("locations")
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        LocationModel locations =
        LocationModel.fromJson(doc.data() as Map<String, dynamic>);
        locationList.add(locations);
        // LatitudeLongitude latlong = LatitudeLongitude(
        //     lat: locations.areaLocation.lat,
        //     lng: locations.areaLocation.lng
        // );
        // Area area = Area(
        //     coords: locations.areas.,
        //     address: address,
        //     id: id,
        //     name: name,
        //     phone: phone
        // );
        // Location location = Location(
        //     areaName: locations.areaName,
        //     areaLocation: latlong,
        //     areas: areas
        // );
        //print("Location retrieved");
      });
    });
    notifyListeners();
  }
}