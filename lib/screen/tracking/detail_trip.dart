
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:simplynews/aturan/constants/warna_apps.dart';
import 'package:simplynews/screen/navbar/navbar.dart';
import 'package:simplynews/widgets/spacer/kustom_spasi.dart';
import '../../aturan/pengaturan.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DetailTripPage extends StatelessWidget {
  final String vehicleType;
  const DetailTripPage({
    Key? key,
    required this.vehicleType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Scaffold(
          backgroundColor: AppColors.backGroundColor,
          body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              if (constraints.maxWidth <= 600) {
                return DetailTripPageState.initialize(
                  vehicleType: vehicleType,
                );
              } else if (constraints.maxWidth <= 1200) {
                return DetailTripPageState.initialize(
                  vehicleType: vehicleType,
                );
              } else {
                return DetailTripPageState.initialize(
                  vehicleType: vehicleType,
                );
              }
            },
          ),
        );
      },
    );
  }
}

class DetailTripPageState extends StatelessWidget {
  DetailTripPageState({
    Key? key,
    required this.vehicleType,
  }) : super(key: key);
  late User? user;
  final String vehicleType;
  // late String userName;
  // late String userFoto;

  DetailTripPageState.initialize({Key? key, required this.vehicleType}) {
    initializeUser();
  }

  void initializeUser() {
    user = FirebaseAuth.instance.currentUser;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.fromLTRB(24.0, 45, 24, 0),
        child: Column(
          children: [
            // text bertuliskan Done di pojok kanan
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    // Tambahkan logika ketika teks "Done" ditekan
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MainTabBar(
                          initialPageIndex: 0,
                        ),
                      ),
                    );
                  },
                  child: Text(
                    'Done',
                    style: SafeGoogleFont(
                      'Mulish',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      height: 1.2,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
            const CustomHeightSpacer(
              size: 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Beri jarak antara foto profil dan teks
                // Bagian Tengah (Sambutan dan Nama)
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Trip Summary',
                        style: SafeGoogleFont(
                          'Mulish',
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                          height: 1.4,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        'Yeay, You have arrived at destination.',
                        style: SafeGoogleFont(
                          'Mulish',
                          fontSize: 12,
                          fontWeight: FontWeight.w800,
                          height: 1.3,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const CustomHeightSpacer(
              size: 0.02,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // buatkan 2 text kanan kiri spacebeetween
                        Text(
                          'Trip Detail',
                          style: SafeGoogleFont(
                            'Mulish',
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            height: 1.2,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          '3.90 km - 10 minutes',
                          style: SafeGoogleFont(
                            'Mulish',
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            height: 1.2,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    const CustomHeightSpacer(
                      size: 0.02,
                    ),
                    // buat garis horizontal
                    Container(
                      height: 2,
                      width: double.infinity,
                      color: Colors.grey,
                    ),
                    const CustomHeightSpacer(
                      size: 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Image on the left
                        Image.asset(
                          _getVehicleImage(),
                          width: 40,
                          height: 40,
                        ),
                        const CustomWidthSpacer(size: 0.03),
                        // Column for text content on the right
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  'assets/icons/location_transparant.png',
                                  width: 40,
                                  height: 40,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Halte Bis Padjajaran',
                                      style: SafeGoogleFont(
                                        'Mulish',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w800,
                                        height: 1.2,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      '10.23 AM',
                                      style: SafeGoogleFont(
                                        'Mulish',
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        height: 1.2,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            // Spacer between text sections
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Image.asset(
                                  'assets/icons/location_solid.png',
                                  width: 40,
                                  height: 40,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Stasiun Kota Bogor',
                                      style: SafeGoogleFont(
                                        'Mulish',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w800,
                                        height: 1.2,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      '10.33 AM',
                                      style: SafeGoogleFont(
                                        'Mulish',
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        height: 1.2,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    const CustomHeightSpacer(
                      size: 0.02,
                    ),
                    Container(
                      height: 2,
                      width: double.infinity,
                      color: Colors.grey,
                    ),
                    const CustomHeightSpacer(
                      size: 0.04,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // buatkan 2 text kanan kiri spacebeetween
                        Text(
                          'Trip Detail',
                          style: SafeGoogleFont(
                            'Mulish',
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            height: 1.2,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    const CustomHeightSpacer(
                      size: 0.01,
                    ),
                    Text(
                      'Lorem Ipsum Dolor Sit Amet. Lorem Ipsum Dolor Sit Amet. Lorem Ipsum Dolor Sit Amet. Lorem Ipsum Dolor Sit Amet. Lorem Ipsum Dolor Sit Amet. Lorem Ipsum Dolor Sit Amet.',
                      style: SafeGoogleFont(
                        'Mulish',
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                    const CustomHeightSpacer(
                      size: 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // buatkan 2 text kanan kiri spacebeetween
                        Text(
                          'Current Transport',
                          style: SafeGoogleFont(
                            'Mulish',
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                            height: 1.2,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'Using Car',
                          style: SafeGoogleFont(
                            'Mulish',
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                            height: 1.2,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    const CustomHeightSpacer(
                      size: 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // buatkan kotak kiri
                        Expanded(
                          child: Container(
                            height: 70,
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                              image: DecorationImage(
                                image:
                                    AssetImage('assets/images/car_medium.png'),
                                // fit: BoxFit.cover,
                                alignment: Alignment
                                    .bottomRight, // Gambar akan berada di pojok kanan bawah
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      // tambahkan gambar
                                      Image.asset(
                                        'assets/images/car_mini.png',
                                        width: 10,
                                        height: 10,
                                      ),
                                      Text(
                                        'Total Carbon Emiission',
                                        textAlign: TextAlign.center,
                                        style: SafeGoogleFont(
                                          'Mulish',
                                          fontSize: 10,
                                          fontWeight: FontWeight.w700,
                                          height: 1.2,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        '10.30',
                                        textAlign: TextAlign.center,
                                        style: SafeGoogleFont(
                                          'Mulish',
                                          fontSize: 24,
                                          fontWeight: FontWeight.w800,
                                          height: 1.2,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(width: 3),
                                      Text(
                                        'km/CO2',
                                        textAlign: TextAlign.center,
                                        style: SafeGoogleFont(
                                          'Mulish',
                                          fontSize: 9,
                                          fontWeight: FontWeight.w700,
                                          height: 1.2,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        const CustomWidthSpacer(
                          size: 0.02,
                        ),
                        // buatkan kotak kanan
                        Expanded(
                          child: Container(
                            height: 70,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                              image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/car_medium_primary.png'),
                                // fit: BoxFit.cover,
                                alignment: Alignment
                                    .bottomRight, // Gambar akan berada di pojok kanan bawah
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      // tambahkan gambar
                                      Image.asset(
                                        'assets/images/car_mini_primary.png',
                                        width: 10,
                                        height: 10,
                                      ),
                                      SizedBox(
                                        width: 2,
                                      ),
                                      Text(
                                        'Total Carbon Emission',
                                        textAlign: TextAlign.center,
                                        style: SafeGoogleFont(
                                          'Mulish',
                                          fontSize: 10,
                                          fontWeight: FontWeight.w700,
                                          height: 1.2,
                                          color: AppColors.primaryColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        '19.45',
                                        textAlign: TextAlign.center,
                                        style: SafeGoogleFont(
                                          'Mulish',
                                          fontSize: 24,
                                          fontWeight: FontWeight.w800,
                                          height: 1.2,
                                          color: AppColors.primaryColor,
                                        ),
                                      ),
                                      Text(
                                        'km/CO2',
                                        textAlign: TextAlign.center,
                                        style: SafeGoogleFont(
                                          'Mulish',
                                          fontSize: 9,
                                          fontWeight: FontWeight.w700,
                                          height: 1.2,
                                          color: AppColors.primaryColor,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const CustomHeightSpacer(
                      size: 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // buatkan kotak kiri
                        Expanded(
                          child: Container(
                            height: 70,
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                              image: DecorationImage(
                                image:
                                    AssetImage('assets/images/cost_medium.png'),
                                // fit: BoxFit.cover,
                                alignment: Alignment
                                    .bottomRight, // Gambar akan berada di pojok kanan bawah
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      // tambahkan gambar
                                      Image.asset(
                                        'assets/images/cost_mini.png',
                                        width: 10,
                                        height: 10,
                                      ),
                                      Text(
                                        'Spent Estimated Cost',
                                        textAlign: TextAlign.center,
                                        style: SafeGoogleFont(
                                          'Mulish',
                                          fontSize: 10,
                                          fontWeight: FontWeight.w700,
                                          height: 1.2,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        '2K',
                                        textAlign: TextAlign.center,
                                        style: SafeGoogleFont(
                                          'Mulish',
                                          fontSize: 24,
                                          fontWeight: FontWeight.w800,
                                          height: 1.2,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(width: 3),
                                      Text(
                                        'IDR',
                                        textAlign: TextAlign.center,
                                        style: SafeGoogleFont(
                                          'Mulish',
                                          fontSize: 9,
                                          fontWeight: FontWeight.w700,
                                          height: 1.2,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        const CustomWidthSpacer(
                          size: 0.02,
                        ),
                        // buatkan kotak kanan
                        Expanded(
                          child: Container(
                            height: 70,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                              image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/cost_medium_primary.png'),
                                // fit: BoxFit.cover,
                                alignment: Alignment
                                    .bottomRight, // Gambar akan berada di pojok kanan bawah
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      // tambahkan gambar
                                      Image.asset(
                                        'assets/images/cost_mini_primary.png',
                                        width: 10,
                                        height: 10,
                                      ),
                                      SizedBox(
                                        width: 2,
                                      ),
                                      Text(
                                        'Spent Estimated Cost',
                                        textAlign: TextAlign.center,
                                        style: SafeGoogleFont(
                                          'Mulish',
                                          fontSize: 10,
                                          fontWeight: FontWeight.w700,
                                          height: 1.2,
                                          color: AppColors.primaryColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        '12K',
                                        textAlign: TextAlign.center,
                                        style: SafeGoogleFont(
                                          'Mulish',
                                          fontSize: 24,
                                          fontWeight: FontWeight.w800,
                                          height: 1.2,
                                          color: AppColors.primaryColor,
                                        ),
                                      ),
                                      const SizedBox(width: 3),
                                      Text(
                                        'IDR',
                                        textAlign: TextAlign.center,
                                        style: SafeGoogleFont(
                                          'Mulish',
                                          fontSize: 9,
                                          fontWeight: FontWeight.w700,
                                          height: 1.2,
                                          color: AppColors.primaryColor,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const CustomHeightSpacer(
                      size: 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                // Tambahkan logika ketika tombol "See History" ditekan
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MainTabBar(
                                      initialPageIndex: 1,
                                    ),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                primary: AppColors.primaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                minimumSize: Size(
                                  MediaQuery.of(context).size.width - 110,
                                  30,
                                ),
                                shadowColor: Colors.grey,
                                elevation:
                                    3, // Sesuaikan tinggi bayangan sesuai kebutuhan Anda
                              ),
                              child: Text(
                                'See History',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                // Tambahkan logika ketika tombol "Back To Homepage" ditekan
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
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                minimumSize: Size(
                                  MediaQuery.of(context).size.width - 110,
                                  30,
                                ),
                                shadowColor: Colors.grey,
                                elevation:
                                    3, // Sesuaikan tinggi bayangan sesuai kebutuhan Anda
                              ),
                              child: Text(
                                'Back To Homepage',
                                style: TextStyle(
                                  color: AppColors.primaryColor,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const CustomHeightSpacer(
              size: 0.02,
            ),
          ],
        ),
      ),
    );
  }

  String _getVehicleImage() {
    // Logic untuk menentukan path gambar kendaraan berdasarkan variabel
    // (Anda dapat menggunakan switch, if, atau metode lainnya sesuai kebutuhan)
    switch (vehicleType) {
      case "Car":
        return 'assets/images/car.png';
      case "Bus":
        return 'assets/images/bus.png';
      case "Motorcycle":
        return 'assets/images/motor.png';
      case "Train":
        return 'assets/images/train.png';
      default:
        return 'assets/images/default.png';
    }
  }
}
