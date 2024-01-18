
import 'package:flutter/material.dart';
import 'package:simplynews/aturan/constants/warna_apps.dart';
import 'package:simplynews/screen/achievement/your_progress.dart';
import 'package:simplynews/screen/navbar/navbar.dart';
import 'package:simplynews/screen/tracking/detail_trip.dart';
import 'package:simplynews/screen/tracking/tracking_page.dart';
import 'package:simplynews/widgets/spacer/kustom_spasi.dart';
import '../../aturan/pengaturan.dart';
import 'widgets/home_header_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key}) {
    // googleSignInAccount = GoogleSignIn().currentUser;
    // userName = googleSignInAccount?.displayName ?? 'Guest';
    // final User? user;
    // ambil nama dan foto dari akun google
    // final User? user = FirebaseAuth.instance.currentUser;
    // userName = user?.displayName ?? 'Guest';
    // userFoto = user?.photoURL ?? '';
  }

  // GoogleSignInAccount? googleSignInAccount;
  // String? userName;
  // String? userFoto;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Scaffold(
          backgroundColor: AppColors.backGroundColor,
          body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              if (constraints.maxWidth <= 600) {
                return HomePageState.initialize();
              } else if (constraints.maxWidth <= 1200) {
                return HomePageState.initialize();
              } else {
                return HomePageState.initialize();
              }
            },
          ),
        );
      },
    );
  }
}

class HomePageState extends StatelessWidget {
  HomePageState({super.key});
  late User? user;
  // late String userName;
  // late String userFoto;

  HomePageState.initialize({super.key}) {
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
            HomeHeaderWidget(
              user: user,
            ),
            const CustomHeightSpacer(
              size: 0.04,
            ),
            // letakkan tulisan ini "Yeay, You have reduce carbon emissions up to 12 kg CO2/km that is equal to planting 12 Trees." di tengah
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: SafeGoogleFont(
                  'Mulish',
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  height: 1.2,
                  color: const Color(0xff1a434e),
                ),
                children: [
                  TextSpan(
                    text: 'Yeay, You have reduced carbon emissions up to ',
                  ),
                  TextSpan(
                    text: '12 kg CO2/km',
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  TextSpan(
                    text: ' equal to planting ',
                  ),
                  TextSpan(
                    text: '12 Trees',
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  TextSpan(
                    text: '.',
                  ),
                ],
              ),
            ),
            const CustomHeightSpacer(
              size: 0.02,
            ),
            // buatkan 2 kotak kanan kiri yang berisi 2 tulisan dan memiliki ujung rounded
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // buatkan kotak kiri
                Expanded(
                  child: Container(
                    height:
                        75, // Ganti 0.3 sesuai dengan persentase yang diinginkan
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 2,
                          offset: Offset(0, 3),
                        ),
                      ],
                      image: DecorationImage(
                        image: AssetImage('assets/images/tree_medium.png'),
                        // fit: BoxFit.cover,
                        alignment: Alignment
                            .bottomRight, // Gambar akan berada di pojok kanan bawah
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(
                          5.0), // Sesuaikan padding yang diinginkan
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/tree_mini.png',
                                width: 15,
                                height: 15,
                              ),
                              Text(
                                'Total Carbon Emission',
                                textAlign: TextAlign.center,
                                style: SafeGoogleFont(
                                  'Mulish',
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  height: 1.2,
                                  color: const Color(0xffffffff),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                '90',
                                textAlign: TextAlign.center,
                                style: SafeGoogleFont(
                                  'Mulish',
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                  height: 1.2,
                                  color: const Color(0xffffffff),
                                ),
                              ),
                              const SizedBox(width: 3),
                              Text(
                                'kg CO2/ km',
                                textAlign: TextAlign.center,
                                style: SafeGoogleFont(
                                  'Mulish',
                                  fontSize: 9,
                                  fontWeight: FontWeight.w700,
                                  height: 1.2,
                                  color: const Color(0xffffffff),
                                ),
                              ),
                            ],
                          ),
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
                    height: 75,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5), // Warna bayangan
                          spreadRadius: 2, // Seberapa banyak bayangan tersebar
                          blurRadius: 2, // Seberapa buram bayangan
                          offset: Offset(0, 3), // Posisi bayangan (x, y)
                        ),
                      ],
                      image: DecorationImage(
                        image: AssetImage('assets/images/car_medium.png'),
                        // fit: BoxFit.cover,
                        alignment: Alignment
                            .bottomRight, // Gambar akan berada di pojok kanan bawah
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              // tambahkan gambar
                              Image.asset(
                                'assets/images/car_mini.png',
                                width: 15,
                                height: 15,
                              ),
                              Text(
                                'Most Use Transportation',
                                textAlign: TextAlign.center,
                                style: SafeGoogleFont(
                                  'Mulish',
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  height: 1.2,
                                  color: const Color(0xffffffff),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'Car',
                                textAlign: TextAlign.center,
                                style: SafeGoogleFont(
                                  'Mulish',
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                  height: 1.2,
                                  color: const Color(0xffffffff),
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
              size: 0.03,
            ),
            // buatkan tombol bertuliskan "Start Tracking" dengan dekorasi yaitu tombol berwarna putih dengan tulisan berwarna primaryColor lalu tombol memiliki border berwarna primary color dan tombol rounded
            Container(
              height: 40,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: AppColors.primaryColor,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2), // Warna bayangan
                    spreadRadius: 7, // Seberapa banyak bayangan tersebar
                    blurRadius: 8, // Seberapa buram bayangan
                    offset: Offset(0, 0), // Posisi bayangan (x, y)
                  ),
                ],
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TrackingPage(),
                    ),
                  );
                },
                child: Text(
                  'Start Tracking',
                  textAlign: TextAlign.center,
                  style: SafeGoogleFont(
                    'Mulish',
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    height: 1.2,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ),
            const CustomHeightSpacer(
              size: 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start, // Align text to the left
                  children: [
                    Text(
                      'Achievement',
                      style: SafeGoogleFont(
                        'Mulish',
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        height: 1.2,
                        color: const Color(0xff1a434e),
                      ),
                    ),
                    Text(
                      'Check Your Ranking Achievement',
                      style: SafeGoogleFont(
                        'Mulish',
                        fontSize: 10,
                        color:
                            const Color(0xff1a434e), // Adjust color as needed
                      ),
                    ),
                  ],
                ),
                // buatkan tulisan See All yang bisa di klik
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => YourProgress(),
                      ),
                    );
                  },
                  child: Text(
                    'View All',
                    textAlign: TextAlign.center,
                    style: SafeGoogleFont(
                      'Mulish',
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
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
            // Achievement
            Stack(
              children: [
                // Container untuk background dengan bayangan
                Container(
                  height: 125,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 2,
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Image on the left
                            Image.asset(
                              'assets/images/icAchievement.png',
                              width: 50,
                              height: 50,
                            ),
                            const CustomWidthSpacer(size: 0.04),
                            // Column for text content on the right
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Top text section
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Keep it up!',
                                      style: SafeGoogleFont(
                                        'Mulish',
                                        fontSize: 18,
                                        fontWeight: FontWeight.w800,
                                        height: 1.2,
                                        color: const Color(0xffffffff),
                                      ),
                                    ),
                                    Text(
                                      'Reach your Achievement',
                                      style: SafeGoogleFont(
                                        'Mulish',
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        height: 1.2,
                                        color: const Color(0xffffffff),
                                      ),
                                    ),
                                  ],
                                ),
                                // Spacer between text sections
                                const SizedBox(height: 10),
                                // Bottom text section (now below Reach Your Achievement)
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Total Task',
                                          style: SafeGoogleFont(
                                            'Mulish',
                                            fontSize: 10,
                                            fontWeight: FontWeight.w400,
                                            height: 1.2,
                                            color: const Color(0xffffffff),
                                          ),
                                        ),
                                        Text(
                                          '72',
                                          textAlign: TextAlign.center,
                                          style: SafeGoogleFont(
                                            'Mulish',
                                            fontSize: 28,
                                            fontWeight: FontWeight.w800,
                                            height: 1.2,
                                            color: const Color(0xffffffff),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(width: 25),
                                    // buat garis vertical diantara 2 column
                                    Container(
                                      width: 1,
                                      height: 30,
                                      color: Colors.white,
                                    ),
                                    const SizedBox(width: 25),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Task Completed',
                                          style: SafeGoogleFont(
                                            'Mulish',
                                            fontSize: 10,
                                            fontWeight: FontWeight.w400,
                                            height: 1.2,
                                            color: const Color(0xffffffff),
                                          ),
                                        ),
                                        Text(
                                          '24',
                                          textAlign: TextAlign.center,
                                          style: SafeGoogleFont(
                                            'Mulish',
                                            fontSize: 28,
                                            fontWeight: FontWeight.w800,
                                            height: 1.2,
                                            color: const Color(0xffffffff),
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
                      ],
                    ),
                  ),
                ),
                // Positioned untuk menempatkan ikon di pojok kanan atas
                Positioned(
                  top: 10,
                  right: 10,
                  child: Image.asset(
                    'assets/images/white_logo.png',
                    width: 25,
                    height: 25,
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
                Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start, // Align text to the left
                  children: [
                    Text(
                      'Latest Trip',
                      style: SafeGoogleFont(
                        'Mulish',
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        height: 1.2,
                        color: const Color(0xff1a434e),
                      ),
                    ),
                    Text(
                      'Check Your Recent Trips',
                      style: SafeGoogleFont(
                        'Mulish',
                        fontSize: 10,
                        color:
                            const Color(0xff1a434e), // Adjust color as needed
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MainTabBar(
                          initialPageIndex: 1,
                        ),
                      ),
                    );
                  },
                  child: Text(
                    'View All',
                    textAlign: TextAlign.center,
                    style: SafeGoogleFont(
                      'Mulish',
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
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
            InkWell(
              onTap: () {
                // Navigasi ke halaman DetailTripPage
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DetailTripPage(
                     vehicleType: 'Car',
                  )),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(7),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Image
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.all(5),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/images/car.png',
                          width: 25,
                          height: 25,
                        ),
                      ),
                    ),
                    // Date, time, and address
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Yesterday, 1 Jan 24 10:00',
                          style: SafeGoogleFont(
                            'Mulish',
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            height: 1.2,
                            color: const Color(0xff1a434e),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Jl. Bumi Foresta to KFC  Marg...',
                          style: SafeGoogleFont(
                            'Mulish',
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            height: 1.2,
                            color: const Color(0xff1a434e),
                          ),
                        ),
                      ],
                    ),
                    // Arrow icon
                    Spacer(),
                    Image.asset(
                      'assets/images/arrow_right.png',
                      width: 15,
                      height: 15,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            InkWell(
              onTap: () {
                // Navigasi ke halaman DetailTripPage
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DetailTripPage(
                    vehicleType: 'Train',
                  )),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(7),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Image
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.all(5),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/images/train.png',
                          width: 25,
                          height: 25,
                        ),
                      ),
                    ),
                    // Date, time, and address
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Yesterday, 1 Jan 23, 08.00',
                          style: SafeGoogleFont(
                            'Mulish',
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            height: 1.2,
                            color: const Color(0xff1a434e),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Senayan to Statiun MRT Fatm...',
                          style: SafeGoogleFont(
                            'Mulish',
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            height: 1.2,
                            color: const Color(0xff1a434e),
                          ),
                        ),
                      ],
                    ),
                    // Arrow icon
                    Spacer(),
                    Image.asset(
                      'assets/images/arrow_right.png',
                      width: 15,
                      height: 15,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            InkWell(
              onTap: () {
                // Navigasi ke halaman DetailTripPage
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DetailTripPage(
                    vehicleType: 'Motorcycle',
                  )),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(7),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Image
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.all(5),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/images/motor.png',
                          width: 25,
                          height: 25,
                        ),
                      ),
                    ),
                    // Date, time, and address
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '28 Dec 2023, 07.30',
                          style: SafeGoogleFont(
                            'Mulish',
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            height: 1.2,
                            color: const Color(0xff1a434e),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Upn Veteran Jakarta to Pantai...',
                          style: SafeGoogleFont(
                            'Mulish',
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            height: 1.2,
                            color: const Color(0xff1a434e),
                          ),
                        ),
                      ],
                    ),
                    // Arrow icon
                    Spacer(),
                    Image.asset(
                      'assets/images/arrow_right.png',
                      width: 15,
                      height: 15,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
