import 'package:api/Provider/location_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

class GoogleMapsExample extends StatefulWidget {
  const GoogleMapsExample({super.key});

  @override
  State<GoogleMapsExample> createState() => _GoogleMapsExampleState();
}

class _GoogleMapsExampleState extends State<GoogleMapsExample> {
  late GoogleMapController mapController;
  LatLng defaultLocation = LatLng(34.015137, 71.524918);
  final Set<Circle> _circles = {};
  String? _mapStyle;
  // final Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _requestLocationPermissions();
    loadMapStyle();
  }

  Future<void> _requestLocationPermissions() async {
    final locationProvider =
        Provider.of<LocationProvider>(context, listen: false);
    await locationProvider.requestLocationPermission();

    // Fetch the current location after permission is granted
    if (locationProvider.permissionStatus == PermissionStatus.granted) {
      await locationProvider.fetchCurrentLocation();
      if (locationProvider.currentLocation != null) {
        addCircle(locationProvider.currentLocation!);
      }
    }
  }

  void addCircle(LatLng position) {
    setState(() {
      _circles.add(
        Circle(
          circleId: CircleId("CurrentLocation"),
          center: position,
          radius: 50,
          strokeColor: Colors.blueAccent,
          strokeWidth: 2,
          fillColor: Colors.blue.withOpacity(0.3),
        ),
      );
    });
  }

  /// Map Style
  Future<void> loadMapStyle() async {
    _mapStyle = await rootBundle.loadString('assets/Style/mapStyle.json');
  }

  ///  Custom Marker
  // Future<void> _addCustomMarker(LatLng position) async {
  //   // Load the custom marker image from assets
  //   final BitmapDescriptor customIcon = await BitmapDescriptor.fromAssetImage(
  //     const ImageConfiguration(
  //       size: Size(24, 24),
  //       platform: TargetPlatform.android,
  //     ),
  //     'assets/marker.png',
  //   );

  //   setState(() {
  //     _markers.add(
  //       Marker(
  //         markerId: MarkerId("customMarker1"),
  //         position: position,
  //         icon: customIcon, // Use custom icon
  //       ),
  //     );
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final locationProvider =
        Provider.of<LocationProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xff3F51B5),
        title: const Text(
          "Google Map",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: locationProvider.permissionStatus == PermissionStatus.granted
          ? GoogleMap(
              initialCameraPosition: CameraPosition(
                target: locationProvider.currentLocation ?? defaultLocation,
                zoom: 14.0,
              ),
              onMapCreated: (GoogleMapController controller) {
                mapController = controller;
                // If current location is available, update the map's camera
                if (locationProvider.currentLocation != null) {
                  _updateLocation(locationProvider.currentLocation!);
                }
                if (_mapStyle != null) {
                  // ignore: deprecated_member_use
                  mapController.setMapStyle(_mapStyle);
                }
              },
              markers: locationProvider.currentLocation != null
                  ? {
                      Marker(
                        markerId: MarkerId("CurrentLocation"),
                        position: locationProvider.currentLocation!,
                        infoWindow: InfoWindow(
                          title: "Abdul Nasir",
                          snippet: "Flutter Developer",
                        ),
                      ),
                    }
                  : {},
              circles: _circles,
            )
          : const Center(
              child: Text("Location permission is not granted."),
            ),
    );
  }

  void _updateLocation(LatLng currentLocation) {
    mapController.animateCamera(
      CameraUpdate.newLatLng(currentLocation),
    );
  }
}
