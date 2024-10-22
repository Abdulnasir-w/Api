import 'package:geolocator/geolocator.dart';

class LocationServices {
  static Future<String> getCurrentLocation() async {
    bool locationEnabled = await Geolocator.isLocationServiceEnabled();
    if (!locationEnabled) {
      return "Location Services are disabled";
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return "Location Permission are Denied.";
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return "Locations are Permanently Denied";
    }

    // fetch Location
    Position position = await Geolocator.getCurrentPosition(
        // ignore: deprecated_member_use
        desiredAccuracy: LocationAccuracy.high);
    return "Lat: ${position.latitude} , Long: ${position.longitude}";
  }
}
