import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:simplynews/screen/login/login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:simplynews/aturan/constants/warna_apps.dart';
import 'package:simplynews/screen/achievement/challenges.dart';
import 'package:simplynews/widgets/spacer/kustom_spasi.dart';
import '../../aturan/pengaturan.dart';
import 'header_rank.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key}) {}

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Scaffold(
          backgroundColor: AppColors.backGroundColor,
          body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              if (constraints.maxWidth <= 600) {
                return ProfilePageState.initialize();
              } else if (constraints.maxWidth <= 1200) {
                return ProfilePageState.initialize();
              } else {
                return ProfilePageState.initialize();
              }
            },
          ),
        );
      },
    );
  }
}

class ProfilePageState extends StatelessWidget {
  ProfilePageState({super.key});
  late User? user;
  // late String userName;
  // late String userFoto;

  ProfilePageState.initialize({super.key}) {
    initializeUser();
  }

  void initializeUser() {
    user = FirebaseAuth.instance.currentUser;
  }

  void _signOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.fromLTRB(24.0, 45, 24, 0),
        child: Column(
          children: [
            HeaderRank(
              user: user,
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
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => ProfilePage()),
                      // );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: AppColors.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Profile',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),

                // Spacer untuk memberikan jarak di antara kedua tombol
                SizedBox(width: 16),

                // Tombol Challenges (sebelah kanan)
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => Challenges()),
                      // );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFF2F2F2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Settings',
                      style: TextStyle(
                        color: Color(0xFFB3B3B3),
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Total Task',
                      style: SafeGoogleFont(
                        'Mulish',
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        height: 1.2,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      '72',
                      textAlign: TextAlign.center,
                      style: SafeGoogleFont(
                        'Mulish',
                        fontSize: 32,
                        fontWeight: FontWeight.w800,
                        height: 1.2,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 25),
                // buat garis vertical diantara 2 column
                Container(
                  width: 1,
                  height: 40,
                  color: Colors.black,
                ),
                const SizedBox(width: 25),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Task Completed',
                      style: SafeGoogleFont(
                        'Mulish',
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        height: 1.2,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      '24',
                      textAlign: TextAlign.center,
                      style: SafeGoogleFont(
                        'Mulish',
                        fontSize: 32,
                        fontWeight: FontWeight.w800,
                        height: 1.2,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            // beri text Completed Other Task... berwarna primaryColor
            const CustomHeightSpacer(
              size: 0.01,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Challenges()),
                );
              },
              child: Text(
                'Completed Other Task',
                style: SafeGoogleFont(
                  'Mulish',
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  height: 1.2,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
            const CustomHeightSpacer(
              size: 0.03,
            ),
            Container(
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage('assets/images/BG.png'),
                  repeat: ImageRepeat.repeat, // Mengatur agar gambar berulang
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: IntrinsicHeight(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // BRONZE MEDAL
                      Container(
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          // backgound image
                          image: DecorationImage(
                            image: AssetImage('assets/images/bg_trees.png'),
                            fit: BoxFit.contain,
                            alignment: Alignment.bottomCenter,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // tambahkan gambar
                                  Image.asset(
                                    'assets/images/tree_mini_primary.png',
                                    width: 10,
                                    height: 10,
                                  ),
                                  Text(
                                    'Total Carbon Emission Emitted',
                                    textAlign: TextAlign.center,
                                    style: SafeGoogleFont(
                                      'Mulish',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      height: 1.2,
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                ],
                              ),
                              // const CustomHeightSpacer(
                              //   size: 0.01,
                              // ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '90',
                                    textAlign: TextAlign.center,
                                    style: SafeGoogleFont(
                                      'Mulish',
                                      fontSize: 32,
                                      fontWeight: FontWeight.w900,
                                      height: 1.2,
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'kg CO2/ km',
                                    textAlign: TextAlign.center,
                                    style: SafeGoogleFont(
                                      'Mulish',
                                      fontSize: 12,
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
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/location_medium_primary.png'),
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
                                          'assets/images/location_mini_primary.png',
                                          width: 10,
                                          height: 10,
                                        ),
                                        Text(
                                          'Distanse As Far As',
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
                                          '45.5',
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
                                          'km',
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
                                          'Most Use',
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
                                          'Train',
                                          textAlign: TextAlign.center,
                                          style: SafeGoogleFont(
                                            'Mulish',
                                            fontSize: 24,
                                            fontWeight: FontWeight.w800,
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
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/morelocation_medium_primary.png'),
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
                                          'assets/images/morelocation_mini_primary.png',
                                          width: 10,
                                          height: 10,
                                        ),
                                        Text(
                                          'Track Trip Up',
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
                                          '05',
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
                                          'Times',
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
                                          '112K',
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
                      // buatkan tombol bertuliskan Get More Medal dengan background putih dan warna text AppColors.primaryColor tombolnya rounded
                      const CustomHeightSpacer(
                        size: 0.02,
                      ),
                      GestureDetector(
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => Challenges()),
                          // );
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width - 110,
                          height: 25,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              'Share',
                              style: SafeGoogleFont(
                                'Mulish',
                                fontSize: 14,
                                fontWeight: FontWeight.w800,
                                height: 1.2,
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const CustomHeightSpacer(
              size: 0.02,
            ),
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 5,
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Badges',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              BadgeItem(
                                imageName: 'bronze_rank.png',
                                label: 'Bronze Rank',
                              ),
                              BadgeItem(
                                imageName: 'silver_rank.png',
                                label: 'Silver Rank',
                              ),
                              BadgeItem(
                                imageName: 'car_rank.png',
                                label: 'Car Free Day',
                              ),
                              BadgeItem(
                                imageName: 'gold_rank.png',
                                label: 'Gold Rank',
                              ),
                              BadgeItem(
                                imageName: 'platinum_rank.png',
                                label: 'Platinum Rank',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Challenges()),
                        );
                      },
                      child: Text(
                        'Get More Badges...',
                        style: SafeGoogleFont(
                          'Mulish',
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          height: 1.2,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const CustomHeightSpacer(
              size: 0.02,
            ),
            ElevatedButton(
              onPressed: () => _signOut(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                minimumSize: const Size(
                    double.infinity, 50), // Lebar tombol mengikuti lebar layar
              ),
              child: const Text(
                'Logout',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const CustomHeightSpacer(
              size: 0.03,
            ),
          ],
        ),
      ),
    );
  }
}

class BadgeItem extends StatelessWidget {
  final String imageName;
  final String label;

  const BadgeItem({required this.imageName, required this.label});

  @override
  Widget build(BuildContext context) {
    List<String> labelParts = label.split(' ');

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          // letakkan ditengah
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icons/$imageName',
              width: 40,
              height: 40,
            ),
            SizedBox(height: 5),
            Text(
              labelParts[0], // Kata pertama (misal: "Bronze")
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            Text(
              labelParts
                  .sublist(1)
                  .join(' '), // Gabungkan kata kedua dan ketiga
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
