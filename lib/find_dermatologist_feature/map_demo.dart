import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:skin_scan/Models/location_model.dart';
import 'package:skin_scan/utilities/utility.dart';
import '../main.dart';

class MapDemo extends StatefulWidget {
  final LocationModel selectedLocation;
  const MapDemo({Key? key, required this.selectedLocation}) : super(key: key);

  @override
  _MapDemoState createState() => _MapDemoState();
}

class _MapDemoState extends State<MapDemo> with AutomaticKeepAliveClientMixin {

  final Map<String, Marker> _markers = {};
  Future<void> _onMapCreated(GoogleMapController controller) async {
    setState(() {
      _markers.clear();
      for (final office in widget.selectedLocation.areas) {
        //print(widget.selectedLocation.areaName);
        final marker = Marker(
          markerId: MarkerId(office.id),
          position: LatLng(office.coords.lat, office.coords.lng),
          infoWindow: InfoWindow(
            title: office.name,
            snippet: office.address,
          ),
        );
        _markers[office.name] = marker;
        //print(widget.selectedLocation.areaName);
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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ReemKufi_Green(textValue: "Dermatoligist nearby " + widget.selectedLocation.areaName, size: displayHeight(context)*0.03),
            SizedBox(height: displayHeight(context)*0.01),
            Expanded(
              child: GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: LatLng(widget.selectedLocation.areaLocation.lat, widget.selectedLocation.areaLocation.lng),
                  //target: LatLng( 24.81035940772831,67.05361192479758),
                  zoom: 13,
                ),
                markers: _markers.values.toSet(),
              ),
            ),
          ],
        )
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
