import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../main.dart';
import 'locations.dart' as locations;

class MapDemo extends StatefulWidget {
  //final locations.Locations selectedLocation;
  const MapDemo({Key? key}) : super(key: key);

  @override
  _MapDemoState createState() => _MapDemoState();
}

class _MapDemoState extends State<MapDemo> with AutomaticKeepAliveClientMixin {
  int i= 0;
  var areaList = ["gulshan"];
  late locations.Locations selectedLocation;
  final Map<String, Marker> _markers = {};
  Future<void> _onMapCreated(GoogleMapController controller) async {
    final googleOffices = await locations.getGoogleOffices();
    for(var area in googleOffices) {
      print(area.areaName);
      selectedLocation = area;
    }
    setState(() {
      _markers.clear();
      for (final office in selectedLocation.areas) {
        final marker = Marker(
          markerId: MarkerId(office.id),
          position: LatLng(office.coords.lat, office.coords.lng),
          infoWindow: InfoWindow(
            title: office.name,
            snippet: office.address,
          ),
        );
        _markers[office.name] = marker;
      }

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarDetails(
          screenName: 'Find Dermatologist',
        ),
        backgroundColor: Color(0xFFFFFDF4),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: const CameraPosition(
            //target: LatLng(0, 0),
            target: LatLng( 24.81035940772831,67.05361192479758),
            zoom: 13,
          ),
          markers: _markers.values.toSet(),
        )
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
