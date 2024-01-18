// import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:simplynews/aturan/constants/warna_apps.dart';
import 'package:simplynews/screen/history/header_history.dart';
import 'package:simplynews/screen/tracking/detail_trip.dart';
import 'package:simplynews/widgets/spacer/kustom_spasi.dart';
import '../../aturan/pengaturan.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HistoryPage extends StatelessWidget {
  HistoryPage({super.key}) {

  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Scaffold(
          backgroundColor: AppColors.backGroundColor,
          body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              if (constraints.maxWidth <= 600) {
                return HistoryPageState.initialize();
              } else if (constraints.maxWidth <= 1200) {
                return HistoryPageState.initialize();
              } else {
                return HistoryPageState.initialize();
              }
            },
          ),
        );
      },
    );
  }
}

class HistoryPageState extends StatelessWidget {
  HistoryPageState({super.key});
  late User? user;
  // late String userName;
  // late String userFoto;

  HistoryPageState.initialize({super.key}) {
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
            HeaderHistory(
              user: user,
            ),
            const CustomHeightSpacer(
              size: 0.02,
            ),
            // Achievement
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // buatkan 2 text kanan kiri spacebeetween
                        Image.asset(
                          'assets/icons/calender_left.png',
                          width: 10,
                          height: 10,
                        ),
                        Text(
                          'January 2024',
                          style: SafeGoogleFont(
                            'Mulish',
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            height: 1.2,
                            color: Colors.black,
                          ),
                        ),
                        Image.asset(
                          'assets/icons/calender_right.png',
                          width: 10,
                          height: 10,
                        ),
                      ],
                    ),
                    const CustomHeightSpacer(
                      size: 0.02,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(7, (index) {
                          DateTime currentDate =
                              DateTime.now().add(Duration(days: index));
                          String dayOfWeek =
                              DateFormat('E').format(currentDate);

                          bool isToday = DateTime.now().day == currentDate.day;

                          return Container(
                            margin: EdgeInsets.all(2),
                            width: 35,
                            height: 40,
                            decoration: BoxDecoration(
                              color: isToday
                                  ? AppColors.primaryColor
                                  : Colors.grey.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  dayOfWeek,
                                  style: SafeGoogleFont(
                                    'Mulish',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    height: 1.2,
                                    color:
                                        isToday ? Colors.white : Colors.black,
                                  ),
                                ),
                                Text(
                                  currentDate.day.toString(),
                                  style: SafeGoogleFont(
                                    'Mulish',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    height: 1.2,
                                    color:
                                        isToday ? Colors.white : Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const CustomHeightSpacer(
              size: 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Tombol Your Progress (sebelah kiri)
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Tambahkan logika ketika tombol ditekan
                    },
                    style: ElevatedButton.styleFrom(
                      primary: AppColors.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Short By',
                          style: TextStyle(color: Colors.white),
                        ), // Beri jarak antara text dan image
                        Image.asset(
                          'assets/icons/sort.png',
                          width: 15,
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                ),

                // Spacer untuk memberikan jarak di antara kedua tombol
                SizedBox(width: 16),

                // Tombol Challenges (sebelah kanan)
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Tambahkan logika ketika tombol ditekan
                    },
                    style: ElevatedButton.styleFrom(
                      primary: AppColors.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Filter',
                          style: TextStyle(color: Colors.white),
                        ), // Beri jarak antara text dan image
                        Image.asset(
                          'assets/icons/filter.png',
                          width: 15,
                          height: 15,
                        ),
                      ],
                    ),
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
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // buatkan 2 text kanan kiri spacebeetween
                        Text(
                          'Today, 17 Jan 2024',
                          style: SafeGoogleFont(
                            'Mulish',
                            fontSize: 12,
                            fontWeight: FontWeight.w800,
                            height: 1.2,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          '3.90 km - 10 minutes',
                          style: SafeGoogleFont(
                            'Mulish',
                            fontSize: 11,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Image on the left
                        Image.asset(
                          'assets/images/bus.png',
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
                    Row(
                      // buat agar posisinya ditengah
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailTripPage(
                                  vehicleType: 'Bus',
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
                              25, // Sesuaikan dengan kebutuhan Anda
                            ),
                          ),
                          child: Text(
                            'Detail Trip',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
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
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // buatkan 2 text kanan kiri spacebeetween
                        Text(
                          'Today, 17 Jan 2024',
                          style: SafeGoogleFont(
                            'Mulish',
                            fontSize: 12,
                            fontWeight: FontWeight.w800,
                            height: 1.2,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          '41.00 km - 75 minutes',
                          style: SafeGoogleFont(
                            'Mulish',
                            fontSize: 11,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Image on the left
                        Image.asset(
                          'assets/images/train.png',
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
                                      '10.35 AM',
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
                                      'Stasiun Bojong Gede',
                                      style: SafeGoogleFont(
                                        'Mulish',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w800,
                                        height: 1.2,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      '10.50 AM',
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
                    Row(
                      // buat agar posisinya ditengah
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailTripPage(
                                  vehicleType: 'Train',
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
                              25, // Sesuaikan dengan kebutuhan Anda
                            ),
                          ),
                          child: Text(
                            'Detail Trip',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
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
}
