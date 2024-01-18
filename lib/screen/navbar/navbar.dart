import 'package:flutter/material.dart';
import 'package:simplynews/screen/charge/charge_page.dart';
import 'package:simplynews/screen/history/history_page.dart';
import 'package:simplynews/screen/home/home_page.dart';
import 'package:simplynews/screen/tracking/tracking_page.dart';
import 'package:simplynews/screen/profile/profile_user.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../resource/resource.gen.dart';
import '../../aturan/constants/warna_apps.dart';
import 'widgets/bottom_icon_widget.dart';

class MainTabBar extends StatefulWidget {
  final int initialPageIndex;
  const MainTabBar({Key? key, required this.initialPageIndex})
      : super(key: key);

  @override
  _MainTabBarState createState() => _MainTabBarState();
}

class _MainTabBarState extends State<MainTabBar> {
  late int pageIndex;
  late int initialPageIndex;
  late User? user; // Tambahkan late

  late List<Widget> pages;

  @override
  void initState() {
    super.initState();
    initialPageIndex = widget.initialPageIndex;
    pageIndex = initialPageIndex;
    user = FirebaseAuth.instance.currentUser;
    getUser();
    // Inisialisasi pages di dalam initState
    pages = [
      HomePage(),
      HistoryPage(),
      TrackingPage(),
      ProfilePage(),
      const ChargingStation(),
    ];
  }

  // Metode untuk mendapatkan user
  void getUser() async {
    // Misalnya, menggunakan FirebaseAuth untuk mendapatkan user saat ini
    User? currentUser = FirebaseAuth.instance.currentUser;

    setState(() {
      user = currentUser;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        // bool isDesktop = constraints.maxWidth > 600;
        // bool isMobile = constraints.maxWidth <= 600;
        bool isTrackingPage = pageIndex == 2;

        return Scaffold(
          body: Center(
            child: pages[pageIndex],
          ),
          bottomNavigationBar: !isTrackingPage
              ? Stack(children: [
                  Container(
                    height: 75,
                    // BUAT AGAR POJOK KANAN ATAS DAN POJOK KIRI ATAS MENJADI RONDED
                    decoration: BoxDecoration(
                      color: Theme.of(context).bottomAppBarColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 2,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            BottomIconWidget(
                              title: 'Home',
                              titleColor: pageIndex == 0
                                  ? Theme.of(context).primaryColor
                                  : AppColors.gray,
                              iconName: pageIndex == 0
                                  ? Assets.icons.icSelectedHome.path
                                  : Assets.icons.icUnselectedHome.path,
                              iconColor: pageIndex == 0
                                  ? Theme.of(context).primaryColor
                                  : AppColors.gray,
                              pageIndex: 0,
                              tap: () {
                                setState(() {
                                  pageIndex = 0;
                                });
                              },
                            ),
                            BottomIconWidget(
                              title: 'Charge',
                              titleColor: pageIndex == 4
                                  ? Theme.of(context).primaryColor
                                  : AppColors.gray,
                              iconName: pageIndex == 4
                                  ? Assets.icons.icSelectedCharging.path
                                  : Assets.icons.icUnselectedCharging.path,
                              iconColor: pageIndex == 4
                                  ? Theme.of(context).primaryColor
                                  : AppColors.gray,
                              pageIndex: 4,
                              tap: () {
                                setState(() {
                                  pageIndex = 4;
                                });
                              },
                            ),
                            BottomIconWidget(
                              title: '',
                              titleColor: pageIndex == 2
                                  ? Theme.of(context).primaryColor
                                  : AppColors.gray,
                              iconName: pageIndex == 2
                                  ? Assets.icons.transparant.path
                                  : Assets.icons.transparant.path,
                              iconColor: pageIndex == 2
                                  ? Theme.of(context).primaryColor
                                  : AppColors.gray,
                              pageIndex: 0,
                              tap: () {
                                setState(() {
                                  pageIndex = 2;
                                });
                              },
                            ),
                            BottomIconWidget(
                              title: 'History',
                              titleColor: pageIndex == 1
                                  ? Theme.of(context).primaryColor
                                  : AppColors.gray,
                              iconName: pageIndex == 1
                                  ? Assets.icons.icSelectedHistory.path
                                  : Assets.icons.icUnselectedHistory.path,
                              iconColor: pageIndex == 1
                                  ? Theme.of(context).primaryColor
                                  : AppColors.gray,
                              pageIndex: 1,
                              tap: () {
                                setState(() {
                                  pageIndex = 1;
                                });
                              },
                            ),
                            BottomIconWidget(
                              title: 'Profile',
                              titleColor: pageIndex == 3
                                  ? Theme.of(context).primaryColor
                                  : AppColors.gray,
                              iconName: pageIndex == 3
                                  ? Assets.icons.icSelectedUser.path
                                  : Assets.icons.icUnselectedUser.path,
                              iconColor: pageIndex == 3
                                  ? Theme.of(context).primaryColor
                                  : AppColors.gray,
                              pageIndex: 3,
                              tap: () {
                                setState(() {
                                  pageIndex = 3;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // buat agar buttonnya seperti melayang
                  Positioned(
                    bottom: 10, // Sesuaikan dengan kebutuhan Anda
                    left: 0,
                    right: 0,
                    child: Container(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: FractionalTranslation(
                          translation: Offset(0, -0.5),
                          child: BottomIconWidget(
                            title: 'Achivement',
                            titleColor: pageIndex == 2
                                ? Theme.of(context).primaryColor
                                : AppColors.gray,
                            iconName: pageIndex == 2
                                ? Assets.icons.icSelectedAchive.path
                                : Assets.icons.icUnselectedAchive.path,
                            iconColor: pageIndex == 2
                                ? Theme.of(context).primaryColor
                                : AppColors.gray,
                            pageIndex: 2,
                            tap: () {
                              setState(() {
                                pageIndex = 2;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ])
              : null,
        );
      },
    );
  }
}
