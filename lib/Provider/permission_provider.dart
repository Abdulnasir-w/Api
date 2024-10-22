import 'package:api/Services/location_services.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionProvider with ChangeNotifier {
  PermissionStatus _permissionStatus = PermissionStatus.denied;
  String _currentLocation = "Location Not Available";

  PermissionStatus get permissionStatus => _permissionStatus;
  String get currentLocation => _currentLocation;

  Future<void> checkLocationPermission() async {
    _permissionStatus = await Permission.location.status;
    notifyListeners();
  }

  Future<void> requestLocationPermission() async {
    _permissionStatus = await Permission.location.request();
    notifyListeners();
    if (_permissionStatus.isGranted) {
      await _getCurrentLocation();
      print("Location permission granted.");
    } else if (_permissionStatus.isDenied) {
      // Handle denied permission
      print("Location permission denied.");
    } else if (_permissionStatus.isPermanentlyDenied) {
      // Open settings if permanently denied
      await openAppSettings();
    }
  }

  Future<void> _getCurrentLocation() async {
    _currentLocation = await LocationServices.getCurrentLocation();
    notifyListeners();
  }
}
