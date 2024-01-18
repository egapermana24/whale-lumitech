import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:simplynews/aturan/constants/warna_apps.dart';
import 'package:simplynews/screen/tracking/detail_trip.dart';

class CostEstimation extends StatefulWidget {
  final String vehicleType;

  const CostEstimation({
    Key? key,
    required this.vehicleType,
  }) : super(key: key);

  @override
  _CostEstimationState createState() => _CostEstimationState();
}

class _CostEstimationState extends State<CostEstimation> {
  late GoogleMapController mapController;
  Position? currentPosition;
  int selectedImageIndex = -1;
  late StreamSubscription<Position> positionStreamSubscription;

  @override
  void initState() {
    super.initState();
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

  Future<void> _getCurrentPosition() async {
    try {
      final position = await Geolocator.getCurrentPosition();
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
              padding: const EdgeInsets.only(
                top: 20,
                bottom: 10,
              ),
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
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
                    "Transportation Cost (Optional)",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
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
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // center
                                  // buatkan tombol kecil bertuliskan IDR berwarna primaryColor dan textnya berwarna white
                                  ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      primary: AppColors.primaryColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            10.0), // Sesuaikan sesuai kebutuhan
                                      ),
                                    ),
                                    child: Text(
                                      "IDR",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  // buatkan inputan dengan border 1 dan warna border primaryColor dan rounded 15
                                  Container(
                                    width: 100,
                                    height: 40,
                                    child: TextField(
                                      textAlign: TextAlign
                                          .center, // Menengahkan teks input
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                            color: AppColors.primaryColor,
                                            width: 1,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                            color: AppColors.primaryColor,
                                            width: 1,
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                            color: AppColors.primaryColor,
                                            width: 1,
                                          ),
                                        ),
                                        hintText: "7.500",
                                        hintStyle: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  // _buildSelectableImage(
                                  //   index: 2,
                                  //   imagePath: "assets/images/car.png",
                                  //   title: "Car",
                                  // ),
                                  SizedBox(width: 10),
                                  // _buildSelectableImage(
                                  //   index: 3,
                                  //   imagePath: "assets/images/bus.png",
                                  //   title: "Bus",
                                  // ),
                                ],
                              ),
                              Text(
                                "This cost estimation feature was based on average transport fare in Jabodetabek",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black.withOpacity(0.6),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
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
                                        SizedBox(width: 50),
                                        ElevatedButton(
                                          onPressed: () {
                                            // ke detailpage
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    DetailTripPage(
                                                  vehicleType:
                                                      widget.vehicleType,
                                                    ),
                                              ),
                                            );
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
                              )
                            ],
                          ),
                        ),
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
