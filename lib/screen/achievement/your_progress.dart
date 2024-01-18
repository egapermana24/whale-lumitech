import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:simplynews/aturan/constants/warna_apps.dart';
import 'package:simplynews/screen/achievement/challenges.dart';
import 'package:simplynews/screen/achievement/header_achieve.dart';
import 'package:simplynews/widgets/spacer/kustom_spasi.dart';

import '../../aturan/pengaturan.dart';
import 'header_rank.dart';
import 'package:firebase_auth/firebase_auth.dart';

class YourProgress extends StatelessWidget {
  YourProgress({super.key}) {}

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Scaffold(
          backgroundColor: AppColors.backGroundColor,
          body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              if (constraints.maxWidth <= 600) {
                return YourProgressState.initialize();
              } else if (constraints.maxWidth <= 1200) {
                return YourProgressState.initialize();
              } else {
                return YourProgressState.initialize();
              }
            },
          ),
        );
      },
    );
  }
}

class YourProgressState extends StatelessWidget {
  YourProgressState({super.key});
  late User? user;


  YourProgressState.initialize({super.key}) {
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
            HeaderAchieve(
              user: user,
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Tombol Your Progress (sebelah kiri)
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => YourProgress()),
                      // );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: AppColors.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Your Progress',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                // Spacer untuk memberikan jarak di antara kedua tombol
                SizedBox(width: 16),

                // Tombol Challenges (sebelah kanan)
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Challenges()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFF2F2F2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Challenges',
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
            HeaderRank(
              user: user,
            ),
            const CustomHeightSpacer(
              size: 0.02,
            ),
            // letakkan tulisan ini "Yeay, You have reduce carbon emissions up to 12 kg CO2/km that is equal to planting 12 Trees." di tengah
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: SafeGoogleFont(
                  'Mulish',
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  height: 1.2,
                  color: const Color(0xff1a434e),
                ),
                children: const [
                  TextSpan(
                    text: 'To Level up and become ',
                  ),
                  TextSpan(
                    text: 'Gold Rank,',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  TextSpan(
                    text: ' You have to complete a few ',
                  ),
                  TextSpan(
                    text: 'Tasks',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  TextSpan(
                    text: ' and ',
                  ),
                  TextSpan(
                    text: 'Challenges',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Image on the left
                            Image.asset(
                              'assets/images/icAchievement_primary.png',
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
                                        color: AppColors.primaryColor,
                                      ),
                                    ),
                                    Text(
                                      'Reach your Achievement',
                                      style: SafeGoogleFont(
                                        'Mulish',
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        height: 1.2,
                                        color: AppColors.primaryColor,
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
                                            color: AppColors.primaryColor,
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
                                            color: AppColors.primaryColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(width: 25),
                                    // buat garis vertical diantara 2 column
                                    Container(
                                      width: 1,
                                      height: 30,
                                      color: AppColors.primaryColor,
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
                                            color: AppColors.primaryColor,
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
                                            color: AppColors.primaryColor,
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
                    'assets/images/splash_logo.png',
                    width: 30,
                    height: 30,
                  ),
                ),
              ],
            ),

            const CustomHeightSpacer(
              size: 0.02,
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
                      Text(
                        'Your Badges',
                        style: SafeGoogleFont(
                          'Mulish',
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                          height: 1.2,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              color: Colors.black
                                  .withOpacity(0.3), // Warna bayangan
                              offset: Offset(
                                  2, 2), // Geser bayangan pada sumbu X dan Y
                              blurRadius: 4, // Radius blur bayangan
                            ),
                          ],
                        ),
                      ),
                      const CustomHeightSpacer(
                        size: 0.02,
                      ),
                      // BRONZE MEDAL
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          // backgound image
                          image: DecorationImage(
                            image: AssetImage('assets/images/color1.png'),
                            alignment: Alignment.centerRight,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                            bottom: 10,
                            right: 10,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // Column for text content on the right
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Bronze Medal',
                                              style: SafeGoogleFont(
                                                'Mulish',
                                                fontSize: 16,
                                                fontWeight: FontWeight.w800,
                                                height: 1.2,
                                                color: Colors.black,
                                              ),
                                            ),
                                            const SizedBox(height: 7),
                                            Container(
                                              width:
                                                  150, // Set your preferred width
                                              child: Text(
                                                'Unlock medals by reaching bronze rank, complete challenges to level up.',
                                                style: SafeGoogleFont(
                                                  'Mulish',
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w500,
                                                  height: 1.2,
                                                  color: Colors.black,
                                                ),
                                                overflow: TextOverflow
                                                    .ellipsis, // Handle overflow with ellipsis
                                                maxLines:
                                                    3, // Set the maximum number of lines
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      // Spacer between text sections
                                      const SizedBox(height: 10),
                                      // Bottom text section (now below Reach Your Achievement)
                                      Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left:
                                                        10.0), // Padding kanan
                                                child: Text(
                                                  'Bronze Medal Rank',
                                                  textAlign: TextAlign.center,
                                                  style: SafeGoogleFont(
                                                    'Mulish',
                                                    fontSize: 9,
                                                    fontWeight: FontWeight.w800,
                                                    height: 1.3,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: 45.0), // Padding kiri
                                                child: Text(
                                                  '1/1',
                                                  textAlign: TextAlign.center,
                                                  style: SafeGoogleFont(
                                                    'Mulish',
                                                    fontSize: 9,
                                                    fontWeight: FontWeight.w800,
                                                    height: 1.3,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 5),
                                      LinearPercentIndicator(
                                        width: 150.0,
                                        lineHeight: 5.0,
                                        percent: 1.0,
                                        // center: Text("80.0%"),
                                        barRadius: Radius.circular(12),
                                        progressColor: AppColors.primaryColor,
                                      ),
                                    ],
                                  ),

                                  Column(
                                    children: [
                                      Image.asset(
                                        'assets/icons/bronze_rank.png',
                                        width: 40,
                                        height: 40,
                                      ),
                                      Text(
                                        'Bronze',
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        'Medal',
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
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
                      // CAR FREE DAY
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          // backgound image
                          image: DecorationImage(
                            image: AssetImage('assets/images/color_car.png'),
                            alignment: Alignment.centerRight,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                            bottom: 10,
                            right: 10,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // Column for text content on the right
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Car Free Day',
                                              style: SafeGoogleFont(
                                                'Mulish',
                                                fontSize: 16,
                                                fontWeight: FontWeight.w800,
                                                height: 1.2,
                                                color: Colors.black,
                                              ),
                                            ),
                                            const SizedBox(height: 7),
                                            Container(
                                              width:
                                                  150, // Set your preferred width
                                              child: Text(
                                                'Unlock by completing the 1 day without a vehicle challenge.',
                                                style: SafeGoogleFont(
                                                  'Mulish',
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w500,
                                                  height: 1.2,
                                                  color: Colors.black,
                                                ),
                                                overflow: TextOverflow
                                                    .ellipsis, // Handle overflow with ellipsis
                                                maxLines:
                                                    3, // Set the maximum number of lines
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      // Spacer between text sections
                                      const SizedBox(height: 10),
                                      // Bottom text section (now below Reach Your Achievement)
                                      Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left:
                                                        10.0), // Padding kanan
                                                child: Text(
                                                  '1 Day Without A Vehicle',
                                                  textAlign: TextAlign.center,
                                                  style: SafeGoogleFont(
                                                    'Mulish',
                                                    fontSize: 9,
                                                    fontWeight: FontWeight.w800,
                                                    height: 1.3,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: 26.0), // Padding kiri
                                                child: Text(
                                                  '1/1',
                                                  textAlign: TextAlign.center,
                                                  style: SafeGoogleFont(
                                                    'Mulish',
                                                    fontSize: 9,
                                                    fontWeight: FontWeight.w800,
                                                    height: 1.3,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 5),
                                      LinearPercentIndicator(
                                        width: 150.0,
                                        lineHeight: 5.0,
                                        percent: 1.0,
                                        // center: Text("80.0%"),
                                        barRadius: Radius.circular(12),
                                        progressColor: AppColors.primaryColor,
                                      ),
                                    ],
                                  ),

                                  Column(
                                    children: [
                                      Image.asset(
                                        'assets/icons/car_rank.png',
                                        width: 40,
                                        height: 40,
                                      ),
                                      Text(
                                        'Car',
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        'Free Day',
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
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
                      // buatkan tombol bertuliskan Get More Medal dengan background putih dan warna text AppColors.primaryColor tombolnya rounded
                      const CustomHeightSpacer(
                        size: 0.02,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Challenges()),
                          );
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
                              'Get More Medal',
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
          ],
        ),
      ),
    );
  }
}
