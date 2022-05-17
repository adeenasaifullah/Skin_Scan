import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:skin_scan/entities/location_entities.dart';
import '../models/location_model.dart';

class LocationProvider extends ChangeNotifier {
  List<Location> locationList = [];

  Future getLocation() async {
    locationList.clear();
    await FirebaseFirestore.instance
        .collection("locations")
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        LocationModel locations =
            LocationModel.fromJson(doc.data() as Map<String, dynamic>);
        LatitudeLongitude latlong = LatitudeLongitude(
            lat: locations.areaLocation.lat, lng: locations.areaLocation.lng);
        List<Area> area = locations.areas.map((e) => Area(
            coords: LatitudeLongitude(lat: e.coords.lat, lng: e.coords.lng),
            address: e.address,
            id: e.id,
            name: e.name,
            phone: e.phone)).toList();
        Location location = Location(
            areaName: locations.areaName,
            areaLocation: latlong,
            areas: area
        );
        locationList.add(location);
      });
    });
    SortList();
    notifyListeners();
  }

  void SortList(){
    locationList.sort((a,b) => a.areaName.substring(0,1).compareTo(b.areaName.substring(0,1)));
  }
}

