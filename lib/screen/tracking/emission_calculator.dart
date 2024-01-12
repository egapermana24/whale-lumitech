import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class EmissionCalculator extends StatefulWidget {
  @override
  _EmissionCalculatorState createState() => _EmissionCalculatorState();
}

class _EmissionCalculatorState extends State<EmissionCalculator> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: (GoogleMapController controller) {
            },
            initialCameraPosition: CameraPosition(
              target: LatLng(-6.891405, 107.616827),
              zoom: 14,
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 150,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: Column(
                children: [
                  Text(
                    "Choose Transportation",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "This calculation based on your kilometers.",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/motor.png"),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total Distance: 42 Km",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        "9 Kg CO2",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        "IDR 200.000",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "You can set transport cost after End Trip or Switch Transportation for better accuracy",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Switch transportation
                        },
                        child: Text("Switch Transportation"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // End trip
                        },
                        child: Text("End Trip"),
                      ),
                    ],
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
