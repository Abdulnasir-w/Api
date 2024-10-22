// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationProvider with ChangeNotifier {
  LatLng? _currentLocation;
  PermissionStatus _permissionStatus = PermissionStatus.denied;

  LatLng? get currentLocation => _currentLocation;
  PermissionStatus get permissionStatus => _permissionStatus;

  Future<void> checkLocationPermission() async {
    _permissionStatus = await Permission.location.status;
    notifyListeners();
  }

  Future<void> requestLocationPermission() async {
    _permissionStatus = await Permission.location.request();
    notifyListeners();

    if (_permissionStatus.isGranted) {
      await fetchCurrentLocation();
    } else if (_permissionStatus.isPermanentlyDenied) {
      await openAppSettings();
    }
  }

  Future<void> fetchCurrentLocation() async {
    bool locationEnabled = await Geolocator.isLocationServiceEnabled();
    if (!locationEnabled) {
      return;
    }

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    _currentLocation = LatLng(position.latitude, position.longitude);
    notifyListeners();
  }
}
