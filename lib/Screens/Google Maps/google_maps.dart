import 'package:api/Provider/permission_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

class GoogleMapsExample extends StatefulWidget {
  const GoogleMapsExample({super.key});

  @override
  State<GoogleMapsExample> createState() => _GoogleMapsExampleState();
}

class _GoogleMapsExampleState extends State<GoogleMapsExample> {
  late GoogleMapController controller;

  @override
  void initState() {
    super.initState();
    if (mounted) {
      Future.delayed(Duration.zero, () {
        Provider.of<PermissionProvider>(context, listen: false)
            .requestLocationPermission();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    LatLng currentLocartion = LatLng(34.015137, 71.524918);
    final locationProvider =
        Provider.of<PermissionProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xff3F51B5),
        title: Text(
          "Google Map",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: locationProvider.permissionStatus == PermissionStatus.granted ?
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: currentLocartion,
            ),
          )
    );
  }
}
