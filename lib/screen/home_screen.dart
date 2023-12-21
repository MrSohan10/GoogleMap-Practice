import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Map'),
      ),
      body: GoogleMap(
        initialCameraPosition: const CameraPosition(
            target: LatLng(24.389624545028987, 91.41217916302753),
            zoom: 17,
            bearing: 5,
            tilt: 5),
        onTap: (position) {
          print("on tap $position");
        },
        onLongPress: (latlng) {
          print("on long press $latlng");
        },
        onCameraMove: (cameraPosition) {
          print("camera position $cameraPosition");
        },
        zoomControlsEnabled: true,
        zoomGesturesEnabled: true,
        compassEnabled: true,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        markers: {
          Marker(
              visible: true,
              markerId: const MarkerId("Marker i'd"),
              position: const LatLng(24.389624545028987, 91.41217916302753),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueAzure),
              infoWindow: const InfoWindow(
                  title: "This is title", snippet: "This is snippet"),
              draggable: true,
              onDragStart: (LatLng latlng) {
                print('on drag start $latlng');
              },
              onDrag: (LatLng latlng) {
                print("on drag $latlng");
              },
              onDragEnd: (latlng) {
                print("on drag end $latlng");
              },
              onTap: () {
                print("this is marker");
              }),
          Marker(
            visible: true,
            markerId: const MarkerId('this is marker 2'),
            position: const LatLng(24.38995310926484, 91.41409780830145),
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueGreen),
            infoWindow: const InfoWindow(
                title: "this is marker 2", snippet: "This is snippet"),
            draggable: true,
            onTap: () {
              print("this is marker 2");
            },
            onDragStart: (LatLng latlng) {
              print('on drag start $latlng');
            },
            onDrag: (LatLng latlng) {
              print("on drag $latlng");
            },
            onDragEnd: (latlng) {
              print("on drag end $latlng");
            },
          )
        },
        polylines: {
          Polyline(
              // geodesic: true,
              polylineId: const PolylineId('this is poly line'),
              visible: true,
              color: Colors.green,
              width: 5,
              startCap: Cap.roundCap,
              endCap: Cap.roundCap,
              jointType: JointType.round,
              patterns: [
                PatternItem.dot,
                PatternItem.dash(10),
                PatternItem.gap(10),
              ],
              points: const [
                LatLng(24.389624545028987, 91.41217916302753),
                LatLng(24.38995310926484, 91.41409780830145),
                LatLng(24.39065633934976, 91.41285091638565),
                LatLng(24.389624545028987, 91.41217916302753),
              ])
        },
        polygons: {
          Polygon(
            polygonId: PolygonId('this is polygon'),
            visible: true,
            fillColor: Colors.red,
            strokeColor: Colors.black,
            strokeWidth: 2,
            consumeTapEvents: true,
            onTap: (){
              print("this is polygon");
            },
            points: [
              LatLng(24.38858266961368, 91.41436904668808),
              LatLng(24.38881565761718, 91.41387216746807),
              LatLng(24.38829929699381, 91.41387518495321),
              LatLng(24.387874542232414, 91.4145628362894),
            ],
          )
        },
        circles: {
          Circle(
            circleId: CircleId('this is circle'),
            center: LatLng(24.387058618225677, 91.41291696578264),
            radius: 30,
            fillColor: Colors.green,
            strokeWidth: 2,
            consumeTapEvents: true,
            onTap: (){
              print("this is circle");
            }
          )
        },
      ),
    );
  }
}
