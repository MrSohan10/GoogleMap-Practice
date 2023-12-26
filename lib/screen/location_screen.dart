import 'dart:async';

import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {

  final Location _location = Location();
  LocationData? _currentLocation;
  LocationData? _myLocation;
 late StreamSubscription _locationSubscription;

 void realTimeLocation(){
   _locationSubscription = _location.onLocationChanged.listen((locationData) {
     _myLocation = locationData;
     setState(() {});
   });
 }

@override
  void initState() {
    // realTimeLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Location Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder(
              stream: _location.onLocationChanged,
              builder: (context, locationData) {
                return Text('${locationData.data?.latitude ?? ''}  ${locationData.data?.longitude ?? ''}');
              }
            ),
            const Text('Current location'),
            Text("${_currentLocation?.latitude ?? ''}  ${_currentLocation?.longitude ??''}"),
            ElevatedButton(
              onPressed: () async {
                _currentLocation = await _location.getLocation();
                setState(() {});
              },
              child: const Text('Get current location'),
            ),
            ElevatedButton(
              onPressed: () async {
                PermissionStatus _status = await _location.hasPermission();
                if(_status == PermissionStatus.deniedForever || _status == PermissionStatus.denied){
                  await _location.requestPermission();
                  _currentLocation = await _location.getLocation();
                  setState(() {});
                }
              },
              child: const Text('Get permission'),
            )
          ],
        ),
      ),
    );
  }
  @override
  void dispose() {
    _locationSubscription.cancel();
    super.dispose();
  }
}
