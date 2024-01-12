import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:simplynews/screen/tracking/emission_calculator.dart';

class TrackingPage extends StatefulWidget {
  @override
  _TrackingPageState createState() => _TrackingPageState();
}

class _TrackingPageState extends State<TrackingPage> {
  late GoogleMapController mapController;
  Position? currentPosition;

  @override
  void initState() {
    super.initState();
    _getCurrentPosition();
  }

  Future<void> _getCurrentPosition() async {
    try {
      final position = await Geolocator.getCurrentPosition();
      setState(() {
        currentPosition = position;
      });
    } catch (error) {
      // Handle any errors that might occur during location retrieval
      debugPrint(error.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: (GoogleMapController controller) {
              mapController = controller;
            },
            initialCameraPosition: currentPosition != null
                ? CameraPosition(
                    target: LatLng(currentPosition!.latitude, currentPosition!.longitude),
                    zoom: 15,
                  )
                : const CameraPosition(target: LatLng(0, 0), zoom: 1),
          ),
          Positioned(
            top: 100, // Adjust as needed
            bottom: 50, // Adjust as needed
            left: 20, // Adjust as needed
            right: 20, // Adjust as needed
            child: Container(
              padding: const EdgeInsets.all(20), // Add padding around the content
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    spreadRadius: 5,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Text(
                    "Choose Transportation",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "You are able to switch the transportation later. Please choose what you are going to use right now.",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: ListTile(
                            leading: Image.asset("assets/images/train.png"), 
                            title: Text("Train"),
                          ),
                        ),
                        Expanded(
                          child: ListTile(
                            leading: Image.asset("assets/images/motor.png"),
                            title: Text("Motorcycle"),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: ListTile(
                            leading: Image.asset("assets/images/car.png"),
                            title: Text("Car"),
                          ),
                        ),
                        Expanded(
                          child: ListTile(
                            leading: Image.asset("assets/images/bus.png"),
                            title: Text("Bus"),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: (
                            ) {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Cancel",
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                          Get.to(EmissionCalculator());
                          },
                          child: Text(
                            "Confirm",
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
