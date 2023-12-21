
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
      body:  GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(24.389624545028987, 91.41217916302753),
          zoom: 17,
          bearing: 5,
          tilt: 5
        ),
        onTap: (position){
          print("on tap $position");
        },
        onLongPress: (latlng){
          print("on long press $latlng");
        },
        onCameraMove: (cameraPosition){
          print("camera position $cameraPosition");
        },
        zoomControlsEnabled: true,
        zoomGesturesEnabled: true,
        compassEnabled: true,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
      ),
    );
  }
}
