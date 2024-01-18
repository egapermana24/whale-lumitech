import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:simplynews/aturan/constants/warna_apps.dart';
import 'package:simplynews/screen/tracking/cost_estimation.dart';
import 'package:simplynews/screen/tracking/tracking_page.dart';
import 'firebase_manager.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:location/location.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';

class EmissionCalculator extends StatefulWidget {
  final FirebaseManager _firebaseManager = FirebaseManager();
  final String selectedTransportation;

  // Tambahkan constructor untuk menerima parameter
  EmissionCalculator({required this.selectedTransportation});

  @override
  _EmissionCalculatorState createState() => _EmissionCalculatorState();
}

class _EmissionCalculatorState extends State<EmissionCalculator> {
  final FirebaseManager _firebaseManager = FirebaseManager();
  final StreamController<List<DocumentSnapshot>> _streamController =
      StreamController<List<DocumentSnapshot>>();
  late GoogleMapController mapController;
  Position? currentPosition;
  double totalDistance = 0.0;
  double totalEmission = 0.0;
  bool _isLoading = true;
  double totalJarak = 0.0;
  double jarak = 0.01;
  double emissionPerKm = 0.0;
  int totalCost = 0;
  Timer? distanceUpdateTimer;
  int cost = 0;

  @override
  void initState() {
    super.initState();
    _getUserLocation();
    distanceUpdateTimer = Timer.periodic(Duration(seconds: 5), (timer) {
      updateDistance();
      setState(() {
        totalJarak += jarak;
        // Cek apakah totalJarak kelipatan 1
        // if (totalJarak % 1 == 0) {
        if (totalJarak >= 1) {
          totalEmission += emissionPerKm;
          totalCost += cost;
        }
      });
    });

    // switch (widget.selectedTransportation) {
    //   case "Car":
    //     jarak = 0.005;
    //     break;
    //   case "Bus":
    //     jarak = 0.005;
    //     break;
    //   case "Motorcycle":
    //     jarak = 0.01;
    //     break;
    //   case "Train":
    //     jarak = 0.10;
    //     break;
    //   default:
    //     jarak = 0.00;
    // }
    // Mulai timer ketika widget diinisialisasi
  }

  // Fungsi untuk mengupdate jarak
  void updateDistance() {
    switch (widget.selectedTransportation) {
      case "Car":
        jarak = 0.10;
        emissionPerKm = 0.035;
        cost = 500;
        break;
      case "Bus":
        jarak = 0.10;
        emissionPerKm = 0.004;
        cost = 300;
        break;
      case "Motorcycle":
        jarak = 0.10;
        emissionPerKm = 0.011;
        cost = 500;
        break;
      case "Train":
        jarak = 0.10;
        emissionPerKm = 0.0018;
        cost = 200 ;
        break;
      default:
        jarak = 0.0;
        emissionPerKm = 0.0;
        cost = 0;
    }

    Geolocator.getPositionStream().listen((Position position) {
      if (mapController != null) {
        mapController.animateCamera(
          CameraUpdate.newLatLng(LatLng(position.latitude, position.longitude)),
        );

        // Hitung total jarak
        if (currentPosition != null) {
          totalDistance += Geolocator.distanceBetween(
            currentPosition!.latitude!,
            currentPosition!.longitude!,
            position.latitude,
            position.longitude,
          );
        }

        setState(() {
          currentPosition = position;
          _isLoading =
              false; // Setelah mendapatkan lokasi, set isLoading ke false
        });
      }
    });

    // Mendengarkan perubahan pada koleksi 'emissions'
    FirebaseFirestore.instance.collection('emissions').snapshots().listen(
      (data) {
        _streamController.add(data.docs);
      },
    );
  }

  // Fungsi untuk mendapatkan lokasi pengguna
  Future<void> _getUserLocation() async {
    Location location = Location();
    LocationData? currentLocation;
    try {
      currentLocation = await location.getLocation();
    } catch (e) {
      print('Error getting location: $e');
    }

    if (currentLocation != null && mapController != null) {
      mapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(
              currentLocation.latitude!,
              currentLocation.longitude!,
            ),
            zoom: 13,
          ),
        ),
      );
    }
  }

  @override
  void dispose() {
    distanceUpdateTimer?.cancel();
    super.dispose();
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
                    target: LatLng(
                        currentPosition!.latitude, currentPosition!.longitude),
                    zoom: 13,
                  )
                : const CameraPosition(target: LatLng(0, 0), zoom: 13),
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
          ),
          if (_isLoading) // Tampilkan indikator loading jika _isLoading adalah true
            Center(
              child: CircularProgressIndicator(),
            ),
          Positioned(
            bottom: 50,
            left: 20,
            right: 20,
            child: SingleChildScrollView(
              // Tambahkan SingleChildScrollView
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      spreadRadius: 5,
                      offset: Offset(0, -5),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Current Transportation",
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
                    SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 90,
                            width: 90,
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image:
                                          AssetImage(_getTransportationImage()),
                                    ),
                                  ),
                                ),
                                Text(
                                  widget.selectedTransportation,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 10),
                          StreamBuilder(
                            stream: _streamController.stream,
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return CircularProgressIndicator();
                              }

                            //   if (!snapshot.hasData || snapshot.data!.isEmpty) {
                            //     return Text('No data available.');
                            //   }

                            //   // Ambil data terbaru dari stream
                            //   var latestEmission = snapshot.data!.last.data()
                            //       as Map<String, dynamic>;


                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Total Distance ",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "${totalJarak.toStringAsFixed(2)} Km",
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    "Total Emission ",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "${totalEmission.toStringAsFixed(4)} Kg CO2",
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    "Total Cost ",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "Rp. ${totalCost}",
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "You can set transport cost after End Trip or Switch Transportation for better accuracy",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TrackingPage(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            primary: AppColors.primaryColor,
                            onPrimary: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            minimumSize:
                                Size(80, 30), // Sesuaikan dengan kebutuhan Anda
                          ),
                          child: Text("Switch Transport"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CostEstimation(
                                  vehicleType: widget.selectedTransportation,
                                ),
                              ),
                            );
                            // kirimkan datanya ke Firebase
                            _firebaseManager.endTrip(
                              transportation: widget.selectedTransportation,
                              totalDistance: totalJarak,
                              emission: totalEmission,
                              cost: totalCost,
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            onPrimary: AppColors.primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            minimumSize:
                                Size(25, 30), // Sesuaikan dengan kebutuhan Anda
                          ),
                          child: Text("End Trip"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Fungsi untuk mendapatkan path gambar berdasarkan transportasi yang dipilih
  String _getTransportationImage() {
    switch (widget.selectedTransportation) {
      case "Train":
        return "assets/images/train.png";
      case "Motorcycle":
        return "assets/images/motor.png";
      case "Car":
        return "assets/images/car.png";
      case "Bus":
        return "assets/images/bus.png";
      default:
        return "assets/images/default.png";
    }
  }
}