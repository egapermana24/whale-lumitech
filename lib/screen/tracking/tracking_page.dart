import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';
import 'package:simplynews/aturan/constants/warna_apps.dart';
import 'package:simplynews/screen/navbar/navbar.dart';
import 'package:simplynews/screen/tracking/emission_calculator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:get/get.dart';

class TrackingPage extends StatefulWidget {
  @override
  _TrackingPageState createState() => _TrackingPageState();
}

class _TrackingPageState extends State<TrackingPage> {
  late GoogleMapController mapController;
  Position? currentPosition;
  int selectedImageIndex = -1;
  late StreamSubscription<Position> positionStreamSubscription;

  @override
  void initState() {
    super.initState();
    _checkLocationPermission();
    _getCurrentPosition();

    positionStreamSubscription =
        Geolocator.getPositionStream().listen((Position position) {
      if (mapController != null) {
        mapController.animateCamera(
          CameraUpdate.newLatLng(LatLng(position.latitude, position.longitude)),
        );
      }
    });
  }

  @override
  void dispose() {
    // Mematikan langganan pada saat widget di dispose
    positionStreamSubscription.cancel();
    super.dispose();
  }

  Future<void> _checkLocationPermission() async {
    var status = await Permission.location.status;
    if (status.isDenied || status.isRestricted) {
      await Permission.location.request();
    } else if (status.isDenied || status.isPermanentlyDenied) {
      // Jika izin ditolak atau ditolak secara permanen, tampilkan dialog untuk membuka pengaturan aplikasi
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text('Location Permission Required'),
          content: Text(
              'Please enable location permission in the app settings to use this feature.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  Future<void> _getCurrentPosition() async {
    Location location = Location();
    LocationData? currentLocation;
    try {
      final position = await Geolocator.getCurrentPosition();
      currentLocation = await location.getLocation();
      setState(() {
        currentPosition = position;
      });
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  // Fungsi untuk menangani pemilihan gambar
  void _onImageSelected(int index) {
    setState(() {
      // Jika gambar sudah dipilih, batalkan pemilihan
      if (selectedImageIndex == index) {
        selectedImageIndex = -1;
      } else {
        // Jika gambar belum dipilih, pilih gambar dengan mengubah nilai selectedImageIndex
        selectedImageIndex = index;
      }
    });
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
          Positioned(
            bottom: 50,
            left: 20,
            right: 20,
            child: Container(
              padding: const EdgeInsets.all(20),
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
                    style: TextStyle(
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.grey[200],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  _buildSelectableImage(
                                    index: 0,
                                    imagePath: "assets/images/train.png",
                                    title: "Train",
                                  ),
                                  SizedBox(width: 10),
                                  _buildSelectableImage(
                                    index: 1,
                                    imagePath: "assets/images/motor.png",
                                    title: "Motorcycle",
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  _buildSelectableImage(
                                    index: 2,
                                    imagePath: "assets/images/car.png",
                                    title: "Car",
                                  ),
                                  SizedBox(width: 10),
                                  _buildSelectableImage(
                                    index: 3,
                                    imagePath: "assets/images/bus.png",
                                    title: "Bus",
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            positionStreamSubscription.cancel();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MainTabBar(
                                  initialPageIndex: 0,
                                ),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  20.0), // Sesuaikan sesuai kebutuhan
                            ),
                          ),
                          child: Text(
                            "Cancel",
                            style: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // Mengirim parameter ke halaman EmissionCalculator
                            if (selectedImageIndex != -1) {
                              Get.to(
                                EmissionCalculator(
                                  selectedTransportation:
                                      _getSelectedTransportation(),
                                ),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            primary: AppColors.primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  20.0), // Sesuaikan sesuai kebutuhan
                            ),
                          ),
                          child: Text(
                            "Confirm",
                            style: TextStyle(
                              color: Colors.white,
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

  // Fungsi untuk membuat widget gambar yang dapat dipilih
  Widget _buildSelectableImage({
    required int index,
    required String imagePath,
    required String title,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: () => _onImageSelected(index),
        child: Container(
          decoration: BoxDecoration(
            color: selectedImageIndex == index
                ? Colors.white // Warna yang berbeda untuk gambar yang dipilih
                : AppColors.primaryColor,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                imagePath, width: 40, // Atur lebar gambar
                height: 40,
              ),
              SizedBox(height: 5),
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: selectedImageIndex == index
                      ? AppColors
                          .primaryColor // Warna yang berbeda untuk gambar yang dipilih
                      : Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Fungsi untuk mendapatkan informasi transportasi yang dipilih
  String _getSelectedTransportation() {
    switch (selectedImageIndex) {
      case 0:
        return "Train";
      case 1:
        return "Motorcycle";
      case 2:
        return "Car";
      case 3:
        return "Bus";
      default:
        return "";
    }
  }
}
