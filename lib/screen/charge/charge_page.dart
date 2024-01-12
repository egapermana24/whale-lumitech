// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:simplynews/aturan/constants/warna_apps.dart';

// class ChargingStation extends StatefulWidget {
//   @override
//   _ChargingStationState createState() => _ChargingStationState();
// }

// class _ChargingStationState extends State<ChargingStation> {
//   late GoogleMapController mapController;
//   Position? currentPosition;
//   List<Position>? positionHistory = [];

//   bool isLoading = true;
//   Timer? locationRefreshTimer;

//   @override
//   void initState() {
//     super.initState();
//     _getCurrentPosition();
//   }

//   Future<void> _getCurrentPosition() async {
//     try {
//       final position = await Geolocator.getCurrentPosition();
//       setState(() {
//         currentPosition = position;
//         positionHistory!.add(position);
//         isLoading = false;
//       });

//       if (mapController != null) {
//         mapController.animateCamera(
//           CameraUpdate.newCameraPosition(
//             CameraPosition(
//               target: LatLng(position.latitude, position.longitude),
//               zoom: 15,
//             ),
//           ),
//         );
//       }

//       _startLocationRefresh();
//     } catch (error) {
//       // Handle any errors that might occur during location retrieval
//       debugPrint(error.toString());
//     }
//   }

//   void _startLocationRefresh() {
//     locationRefreshTimer = Timer.periodic(
//       const Duration(seconds: 10), // Refresh every 10 seconds
//       (timer) async {
//         if (!isLoading) {
//           await _getCurrentPosition();
//         }
//       },
//     );
//   }

//   @override
//   void dispose() {
//     locationRefreshTimer?.cancel();
//     mapController?.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           GoogleMap(
//             onMapCreated: (GoogleMapController controller) {
//               mapController = controller;
//             },
//             initialCameraPosition: currentPosition != null
//                 ? CameraPosition(
//                     target: LatLng(
//                         currentPosition!.latitude, currentPosition!.longitude),
//                     zoom: 15,
//                   )
//                 : const CameraPosition(target: LatLng(0, 0), zoom: 1),
//             markers: {
//               if (currentPosition != null)
//                 Marker(
//                   markerId: const MarkerId('current_position'),
//                   position: LatLng(
//                       currentPosition!.latitude, currentPosition!.longitude),
//                 ),
//             },
//           ),
//           if (isLoading)
//             Positioned(
//               top: 0,
//               left: 0,
//               right: 0,
//               bottom: 0,
//               child: Center(
//                 child: CircularProgressIndicator(
//                   color: AppColors.primaryColor,
//                 ),
//               ),
//             ),
//           Positioned(
//             top: 0,
//             left: 0,
//             right: 0,
//             height: 50,
//             child: TextField(
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 filled: true,
//                 fillColor: Colors.white,
//                 hintText: 'Search',
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:location/location.dart';
import 'package:simplynews/screen/charge/consts.dart';


class ChargingStation extends StatefulWidget {
  const ChargingStation({super.key});

  @override
  State<ChargingStation> createState() => _ChargingStationState();
}

class _ChargingStationState extends State<ChargingStation> {
  Location _locationController = new Location();

  final Completer<GoogleMapController> _mapController =
      Completer<GoogleMapController>();

  static const LatLng _pGooglePlex = LatLng(37.4223, -122.0848);
  static const LatLng _pApplePark = LatLng(37.3346, -122.0090);
  LatLng? _currentP = null;

  Map<PolylineId, Polyline> polylines = {};

  @override
  void initState() {
    super.initState();
    getLocationUpdates().then(
      (_) => {
        getPolylinePoints().then((coordinates) => {
              generatePolyLineFromPoints(coordinates),
            }),
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _currentP == null
          ? const Center(
              child: Text("Loading..."),
            )
          : GoogleMap(
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
                  position: _currentP!,
                ),
                Marker(
                    markerId: MarkerId("_sourceLocation"),
                    icon: BitmapDescriptor.defaultMarker,
                    position: _pGooglePlex),
                Marker(
                    markerId: MarkerId("_destionationLocation"),
                    icon: BitmapDescriptor.defaultMarker,
                    position: _pApplePark)
              },
              polylines: Set<Polyline>.of(polylines.values),
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
    if (_serviceEnabled) {
      _serviceEnabled = await _locationController.requestService();
    } else {
      return;
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

