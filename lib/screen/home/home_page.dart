import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simplynews/screen/details/details_page.dart';
import 'package:simplynews/aturan/constants/warna_apps.dart';
import 'package:simplynews/screen/home/widgets/card_view_widget.dart';
import 'package:simplynews/screen/tracking/tracking_page.dart';
import 'package:simplynews/widgets/spacer/kustom_spasi.dart';
// google sign in
import 'package:google_sign_in/google_sign_in.dart';

import '../../aturan/pengaturan.dart';
import '../../model/news_model.dart';
import '../../resource/resource.gen.dart';
import 'widgets/grid_view_widget.dart'; // Ganti import CardViewWidget menjadi GridViewWidget
import 'widgets/home_header_widget.dart';
import 'widgets/horizontal_category_list.dart';
import 'widgets/round_icon_button_widget.dart';
import 'widgets/top_slider_widget.dart';
// resource
import '../../resource/resource.gen.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key}) {
    googleSignInAccount = GoogleSignIn().currentUser;
    userName = googleSignInAccount?.displayName ?? 'Guest';
  }

  GoogleSignInAccount? googleSignInAccount;
  String userName = 'Guest';
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Scaffold(
          backgroundColor: AppColors.backGroundColor,
          body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              if (constraints.maxWidth <= 600) {
                return const ContentNewsList();
              } else if (constraints.maxWidth <= 1200) {
                return const ContentNewsGrid(gridCount: 4, fontSize: 11);
              } else {
                return const ContentNewsGrid(gridCount: 5, fontSize: 14);
              }
            },
          ),
        );
      },
    );
  }
}

class ContentNewsList extends StatelessWidget {
  const ContentNewsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.fromLTRB(24.0, 45, 24, 0),
        child: Column(
          children: [
            HomeHeaderWidget(),
            const CustomHeightSpacer(
              size: 0.04,
            ),
            // letakkan tulisan ini "Yeay, You have reduce carbon emissions up to 12 kg CO2/km that is equal to planting 12 Trees." di tengah
            Text(
              'Yeay, You have reduced carbon emissions up to 12 kg CO2/km, equal to planting 12 Trees.',
              textAlign: TextAlign.center,
              style: SafeGoogleFont(
                'Mulish',
                fontSize: 16,
                fontWeight: FontWeight.w700,
                height: 1.2,
                color: const Color(0xff1a434e),
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
                    height: 100,
                    decoration: BoxDecoration(
                      color: const Color(0xff1a434e),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hello,',
                            textAlign: TextAlign.center,
                            style: SafeGoogleFont(
                              'Mulish',
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              height: 1.2,
                              color: const Color(0xffffffff),
                            ),
                          ),
                          Text(
                            'Guest',
                            textAlign: TextAlign.center,
                            style: SafeGoogleFont(
                              'Mulish',
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              height: 1.2,
                              color: const Color(0xffffffff),
                            ),
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
                    height: 100,
                    decoration: BoxDecoration(
                      color: const Color(0xff1a434e),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total News',
                            textAlign: TextAlign.center,
                            style: SafeGoogleFont(
                              'Mulish',
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              height: 1.2,
                              color: const Color(0xffffffff),
                            ),
                          ),
                          Text(
                            '100',
                            textAlign: TextAlign.center,
                            style: SafeGoogleFont(
                              'Mulish',
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              height: 1.2,
                              color: const Color(0xffffffff),
                            ),
                          ),
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
            // buatkan tombol bertuliskan "Start Tracking" dengan dekorasi yaitu tombol berwarna putih dengan tulisan berwarna primaryColor lalu tombol memiliki border berwarna primary color dan tombol rounded
            Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: AppColors.primaryColor,
                ),
              ),
              child: TextButton(
                onPressed: () {
                  Get.to(TrackingPage());
                },
                child: Text(
                  'Start Tracking',
                  textAlign: TextAlign.center,
                  style: SafeGoogleFont(
                    'Mulish',
                    fontSize: 16,
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
                Text(
                  'Achievement',
                  textAlign: TextAlign.center,
                  style: SafeGoogleFont(
                    'Mulish',
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    height: 1.2,
                    color: const Color(0xff1a434e),
                  ),
                ),
                // buatkan tulisan See All yang bisa di klik
                Text(
                  'View All',
                  textAlign: TextAlign.center,
                  style: SafeGoogleFont(
                    'Mulish',
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    height: 1.2,
                    color: const Color(0xff1a434e),
                  ),
                ),
              ],
            ),
            const CustomHeightSpacer(
              size: 0.02,
            ),
            // Achievement
            Container(
              height: 150,
              decoration: BoxDecoration(
                color: const Color(0xff1a434e),
                borderRadius: BorderRadius.circular(10),
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
                        // Image on the left
                        Image.asset(
                          'assets/images/icAchievement.png',
                          width: 100,
                          height: 100,
                        ),
                        // const CustomWidthSpacer(size: 0.02),
                        // Column for text content on the right
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Top text section
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Keep it UP!',
                                  style: SafeGoogleFont(
                                    'Mulish',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    height: 1.2,
                                    color: const Color(0xffffffff),
                                  ),
                                ),
                                Text(
                                  'Reach your Achievement',
                                  style: SafeGoogleFont(
                                    'Mulish',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    height: 1.2,
                                    color: const Color(0xffffffff),
                                  ),
                                ),
                              ],
                            ),
                            // Spacer between text sections
                            const SizedBox(
                                height: 10), // Adjust spacing as needed
                            // Bottom text section (now below Reach Your Achievement)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Total Task',
                                      style: SafeGoogleFont(
                                        'Mulish',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        height: 1.2,
                                        color: const Color(0xffffffff),
                                      ),
                                    ),
                                    const CustomHeightSpacer(size: 0.02),
                                    Text(
                                      '72',
                                      textAlign: TextAlign.center,
                                      style: SafeGoogleFont(
                                        'Mulish',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        height: 1.2,
                                        color: const Color(0xffffffff),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                    width: 25), // Adjust spacing as needed
                                // buat garis vertical diantara 2 column
                                Container(
                                  width: 1,
                                  height: 50,
                                  color: Colors.white,
                                ),
                                const SizedBox(width: 25),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Task Completed',
                                      style: SafeGoogleFont(
                                        'Mulish',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        height: 1.2,
                                        color: const Color(0xffffffff),
                                      ),
                                    ),
                                    const CustomHeightSpacer(size: 0.02),
                                    Text(
                                      '24',
                                      textAlign: TextAlign.center,
                                      style: SafeGoogleFont(
                                        'Mulish',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
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
                    // buatkan row yang bawahnya berisi 2 kolom, kolom sebelah kiri bertuliskan "Total Task" dibawahnya 72 dan kolom sebelah kanannya bertuliskan "Task Completed" dibawahnya 24
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
                Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start, // Align text to the left
                  children: [
                    Text(
                      'Latest Trip',
                      style: SafeGoogleFont(
                        'Mulish',
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        height: 1.2,
                        color: const Color(0xff1a434e),
                      ),
                    ),
                    Text(
                      'Cek Perjalanan Terakhirmu',
                      style: SafeGoogleFont(
                        'Mulish',
                        fontSize: 14,
                        color:
                            const Color(0xff1a434e), // Adjust color as needed
                      ),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    // Handle the "View All" button click here
                  },
                  child: Text(
                    'View All',
                    style: SafeGoogleFont(
                      'Mulish',
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      height: 1.2,
                      color: const Color(0xff1a434e),
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
                color: Colors.white, // Adjust the background color if needed
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset:
                        Offset(0, 3), // Adjust the shadow position as needed
                  ),
                ],
              ),
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Image
                  Container(
                    // Apply the background color here
                    decoration: BoxDecoration(
                      color: Colors.grey[200], // Adjust the color as needed
                      borderRadius:
                          BorderRadius.circular(10), // Match the image's radius
                    ),
                    padding: const EdgeInsets.all(10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/images/bus.png',
                        width: 50,
                        height: 50,
                      ),
                    ),
                  ),
                  // Date, time, and address
                  SizedBox(width: 10), // Adjust spacing as needed
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '20 Juli 2023 10:00 - 12:00 WIB', // Date and time combined
                        style: SafeGoogleFont(
                          'Mulish',
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          height: 1.2,
                          color: const Color(0xff1a434e),
                        ),
                      ),
                      Text(
                        'Jl. Sudirman No. 100, Jakarta', // Address below date and time
                        style: SafeGoogleFont(
                          'Mulish',
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          height: 1.2,
                          color: const Color(0xff1a434e),
                        ),
                      ),
                    ],
                  ),
                  // Arrow icon
                  Spacer(),
                  const Icon(
                    Icons.arrow_forward,
                    color: const Color(0xff1a434e),
                    size: 20,
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: Colors.white, // Adjust the background color if needed
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset:
                        Offset(0, 3), // Adjust the shadow position as needed
                  ),
                ],
              ),
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Image
                  Container(
                    // Apply the background color here
                    decoration: BoxDecoration(
                      color: Colors.grey[200], // Adjust the color as needed
                      borderRadius:
                          BorderRadius.circular(10), // Match the image's radius
                    ),
                    padding: const EdgeInsets.all(10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/images/bus.png',
                        width: 50,
                        height: 50,
                      ),
                    ),
                  ),
                  // Date, time, and address
                  SizedBox(width: 10), // Adjust spacing as needed
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '20 Juli 2023 10:00 - 12:00 WIB', // Date and time combined
                        style: SafeGoogleFont(
                          'Mulish',
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          height: 1.2,
                          color: const Color(0xff1a434e),
                        ),
                      ),
                      Text(
                        'Jl. Sudirman No. 100, Jakarta', // Address below date and time
                        style: SafeGoogleFont(
                          'Mulish',
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          height: 1.2,
                          color: const Color(0xff1a434e),
                        ),
                      ),
                    ],
                  ),
                  // Arrow icon
                  Spacer(),
                  const Icon(
                    Icons.arrow_forward,
                    color: const Color(0xff1a434e),
                    size: 20,
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: Colors.white, // Adjust the background color if needed
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset:
                        Offset(0, 3), // Adjust the shadow position as needed
                  ),
                ],
              ),
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Image
                  Container(
                    // Apply the background color here
                    decoration: BoxDecoration(
                      color: Colors.grey[200], // Adjust the color as needed
                      borderRadius:
                          BorderRadius.circular(10), // Match the image's radius
                    ),
                    padding: const EdgeInsets.all(10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/images/bus.png',
                        width: 50,
                        height: 50,
                      ),
                    ),
                  ),
                  // Date, time, and address
                  SizedBox(width: 10), // Adjust spacing as needed
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '20 Juli 2023 10:00 - 12:00 WIB', // Date and time combined
                        style: SafeGoogleFont(
                          'Mulish',
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          height: 1.2,
                          color: const Color(0xff1a434e),
                        ),
                      ),
                      Text(
                        'Jl. Sudirman No. 100, Jakarta', // Address below date and time
                        style: SafeGoogleFont(
                          'Mulish',
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          height: 1.2,
                          color: const Color(0xff1a434e),
                        ),
                      ),
                    ],
                  ),
                  // Arrow icon
                  Spacer(),
                  const Icon(
                    Icons.arrow_forward,
                    color: const Color(0xff1a434e),
                    size: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ContentNewsGrid extends StatelessWidget {
  final int gridCount;
  final double fontSize;

  const ContentNewsGrid(
      {Key? key, required this.gridCount, required this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24.0, 45, 24, 0),
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Achievement',
                    textAlign: TextAlign.center,
                    style: SafeGoogleFont(
                      'Mulish',
                      fontSize: 34,
                      fontWeight: FontWeight.w700,
                      height: 1.2,
                      color: const Color(0xff1a434e),
                    ),
                  ),
                  // buatkan tulisan See All yang bisa di klik
                  Text(
                    'See All',
                    textAlign: TextAlign.center,
                    style: SafeGoogleFont(
                      'Mulish',
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      height: 1.2,
                      color: const Color(0xff1a434e),
                    ),
                  ),
                ],
              ),
              const CustomHeightSpacer(
                size: 0.04,
              ),
              HomeHeaderWidget(),
              const CustomHeightSpacer(
                size: 0.02,
              ),
              HorizontalCategoryList(
                items: [
                  contentNewsList[0].category,
                  contentNewsList[1].category,
                  contentNewsList[2].category,
                  contentNewsList[3].category,
                  contentNewsList[4].category
                ],
              ),
              const CustomHeightSpacer(
                size: 0.04,
              ),
              Expanded(
                child: GridViewWidget(
                  gridCount: gridCount,
                  fontSize: fontSize,
                  onTap: (int index) {
                    Get.to(DetailsPage(
                      title: contentNewsList[index].title,
                      author: contentNewsList[index].author,
                      description: contentNewsList[index].description,
                      datePublish: contentNewsList[index].datePublish,
                      category: contentNewsList[index].category,
                      imageAsset: contentNewsList[index].imageAsset,
                    ));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
