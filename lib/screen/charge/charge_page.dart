import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:location/location.dart';
import 'package:simplynews/screen/charge/consts.dart';

// const String GOOGLE_MAPS_API_KEY = 'YOUR_GOOGLE_MAPS_API_KEY';

class ChargingStation extends StatefulWidget {
  const ChargingStation({Key? key}) : super(key: key);

  @override
  State<ChargingStation> createState() => _ChargingStationState();
}

class _ChargingStationState extends State<ChargingStation> {
  Location _locationController = Location();

  final Completer<GoogleMapController> _mapController =
      Completer<GoogleMapController>();

  static const LatLng _pGooglePlex = LatLng(37.4223, -122.0848);
  static const LatLng _pApplePark = LatLng(37.3346, -122.0090);
  LatLng? _currentP;

  Map<PolylineId, Polyline> polylines = {};

  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getLocationUpdates().then(
      (_) {
        getPolylinePoints().then((coordinates) {
          generatePolyLineFromPoints(coordinates);
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: ((GoogleMapController controller) =>
                _mapController.complete(controller)),
            initialCameraPosition: CameraPosition(
              target: _pGooglePlex,
              zoom: 13,
            ),
            markers: {
              Marker(
                markerId: MarkerId("_currentLocation"),
                icon: BitmapDescriptor.defaultMarker,
                position: _currentP ?? _pGooglePlex,
              ),
              // Marker(
              //     markerId: MarkerId("_sourceLocation"),
              //     icon: BitmapDescriptor.defaultMarker,
              //     position: _pGooglePlex),
              // Marker(
              //     markerId: MarkerId("_destionationLocation"),
              //     icon: BitmapDescriptor.defaultMarker,
              //     position: _pApplePark)
            },
            polylines: Set<Polyline>.of(polylines.values),
          ),
          Positioned(
            top: 50,
            left: 20,
            right: 20,
            child: Container(
              // padding: EdgeInsets.all(8),
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search Charging Station',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    // buat agar container rounded
                    borderSide: BorderSide.none,
                    // buat agar border tidak muncul
                  ),
                ),
                onChanged: (value) {
                  // Handle search functionality here
                  // You can filter the charging stations based on the search input
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _cameraToPosition(LatLng pos) async {
    final GoogleMapController controller = await _mapController.future;
    CameraPosition _newCameraPosition = CameraPosition(
      target: pos,
      zoom: 13,
    );
    await controller.animateCamera(
      CameraUpdate.newCameraPosition(_newCameraPosition),
    );
  }

  Future<void> getLocationUpdates() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await _locationController.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await _locationController.requestService();
    }

    _permissionGranted = await _locationController.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _locationController.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationController.onLocationChanged
        .listen((LocationData currentLocation) {
      if (currentLocation.latitude != null &&
          currentLocation.longitude != null) {
        setState(() {
          _currentP =
              LatLng(currentLocation.latitude!, currentLocation.longitude!);
          _cameraToPosition(_currentP!);
        });
      }
    });
  }

  Future<List<LatLng>> getPolylinePoints() async {
    List<LatLng> polylineCoordinates = [];
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      GOOGLE_MAPS_API_KEY,
      PointLatLng(_pGooglePlex.latitude, _pGooglePlex.longitude),
      PointLatLng(_pApplePark.latitude, _pApplePark.longitude),
      travelMode: TravelMode.driving,
    );
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    } else {
      print(result.errorMessage);
    }
    return polylineCoordinates;
  }

  void generatePolyLineFromPoints(List<LatLng> polylineCoordinates) async {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
        polylineId: id,
        color: Colors.black,
        points: polylineCoordinates,
        width: 8);
    setState(() {
      polylines[id] = polyline;
    });
  }
}
