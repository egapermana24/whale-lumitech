
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:simplynews/aturan/constants/warna_apps.dart';
import 'package:simplynews/screen/achievement/header_achieve.dart';
import 'package:simplynews/screen/achievement/your_progress.dart';
import 'package:simplynews/widgets/spacer/kustom_spasi.dart';

import '../../aturan/pengaturan.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Challenges extends StatelessWidget {
  Challenges({super.key}) {
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
                return ChallengesState.initialize();
              } else if (constraints.maxWidth <= 1200) {
                return ChallengesState.initialize();
              } else {
                return ChallengesState.initialize();
              }
            },
          ),
        );
      },
    );
  }
}

// ignore: must_be_immutable
class ChallengesState extends StatelessWidget {
  ChallengesState({super.key});
  late User? user;

  ChallengesState.initialize({super.key}) {
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
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => YourProgress()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFF2F2F2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Your Progress',
                      style: TextStyle(
                        color: Color(0xFFB3B3B3),
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
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => Challenges()),
                      // );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: AppColors.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Challenges',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
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
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  height: 1.2,
                  color: const Color(0xff1a434e),
                ),
                children: const [
                  TextSpan(
                    text: 'Complete Missions to Get ',
                  ),
                  TextSpan(
                    text: 'Badges',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  TextSpan(
                    text: ' and Increase Your ',
                  ),
                  TextSpan(
                    text: 'Ranking',
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
                      const CustomHeightSpacer(
                        size: 0.01,
                      ),
                      // BRONZE MEDAL
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          // backgound image
                          image: DecorationImage(
                            image: AssetImage('assets/images/color_gold.png'),
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
                                              'Gold Medal',
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
                                                'Unlock medals by reaching gold rank, complete challenges to level up.',
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
                                                  'Gold Rank',
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
                                                    left: 78.0), // Padding kiri
                                                child: Text(
                                                  '0/1',
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
                                        percent: 0.0,
                                        // center: Text("80.0%"),
                                        barRadius: Radius.circular(12),
                                        progressColor: AppColors.primaryColor,
                                      ),
                                    ],
                                  ),

                                  Column(
                                    children: [
                                      Image.asset(
                                        'assets/icons/gold_rank.png',
                                        width: 40,
                                        height: 40,
                                      ),
                                      Text(
                                        'Gold',
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
                            image:
                                AssetImage('assets/images/color_platinum.png'),
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
                                              'Platinum Medal',
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
                                                'Unlock medals by reaching platinum rank, complete challenges to level up.',
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
                                                  'Platinum Rank',
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
                                                    left: 62.0), // Padding kiri
                                                child: Text(
                                                  '0/1',
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
                                        percent: 0.0,
                                        // center: Text("80.0%"),
                                        barRadius: Radius.circular(12),
                                        progressColor: AppColors.primaryColor,
                                      ),
                                    ],
                                  ),

                                  Column(
                                    children: [
                                      Image.asset(
                                        'assets/icons/platinum_rank.png',
                                        width: 40,
                                        height: 40,
                                      ),
                                      Text(
                                        'Platinum',
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
                                              'Car Free Week',
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
                                                'Unlock by completing the 1 week without a vehicle challenge.',
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
                                                  '1 Week Without A Vehicle',
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
                                                    left: 20.0), // Padding kiri
                                                child: Text(
                                                  '4/7',
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
                                        percent: 0.55,
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
                                        'Car Free',
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        'Week',
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
                            image: AssetImage('assets/images/color_tree.png'),
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
                                              'Junior Tree Savior',
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
                                                'Unlock by completing the save 10 trees challenge.',
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
                                                  '8 Trees saved',
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
                                                    left: 62.0), // Padding kiri
                                                child: Text(
                                                  '8/10',
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
                                        percent: 0.8,
                                        // center: Text("80.0%"),
                                        barRadius: Radius.circular(12),
                                        progressColor: AppColors.primaryColor,
                                      ),
                                    ],
                                  ),

                                  Column(
                                    children: [
                                      Image.asset(
                                        'assets/icons/tree_rank.png',
                                        width: 40,
                                        height: 40,
                                      ),
                                      Text(
                                        'Junior Tree',
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        'Savior',
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
                            image: AssetImage('assets/images/color_tree.png'),
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
                                              'Senior Tree Savior',
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
                                                'Unlock by completing the save 100 trees challenge.',
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
                                                  '10 Trees saved',
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
                                                    left: 48.0), // Padding kiri
                                                child: Text(
                                                  '10/100',
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
                                        percent: 0.1,
                                        // center: Text("80.0%"),
                                        barRadius: Radius.circular(12),
                                        progressColor: AppColors.primaryColor,
                                      ),
                                    ],
                                  ),

                                  Column(
                                    children: [
                                      Image.asset(
                                        'assets/icons/tree_rank.png',
                                        width: 40,
                                        height: 40,
                                      ),
                                      Text(
                                        'Senior Tree',
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        'Savior',
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
                        size: 0.01,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
