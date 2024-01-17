import 'package:flutter/material.dart';
import 'package:simplynews/screen/achievement/your_progress.dart';
import 'package:simplynews/screen/bookmarks/bookmarks_page.dart';
import 'package:simplynews/screen/charge/charge_page.dart';
import 'package:simplynews/screen/history/history_page.dart';
import 'package:simplynews/screen/home/home_page.dart';
import 'package:simplynews/screen/trending/search_page.dart';
import 'package:simplynews/screen/profile/profile_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../resource/resource.gen.dart';
import '../../aturan/constants/warna_apps.dart';
import 'widgets/bottom_icon_widget.dart';
import 'widgets/top_icon_widget.dart';

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
      YourProgress(),
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
        bool isDesktop = constraints.maxWidth > 600;
        bool isMobile = constraints.maxWidth <= 600;

        return Scaffold(
          appBar: isDesktop
              ? PreferredSize(
                  preferredSize: const Size.fromHeight(
                      70.0), // Sesuaikan dengan tinggi yang diinginkan
                  child: AppBar(
                    shadowColor: Colors.transparent,
                    backgroundColor: Theme.of(context).bottomAppBarColor,
                    title: const Text('Your App Title'),
                    centerTitle: true,
                    actions: [
                      const Spacer(),
                      TopIconWidget(
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
                        tap: () {
                          setState(() {
                            pageIndex = 0;
                          });
                        },
                      ),
                      const SizedBox(width: 12),
                      TopIconWidget(
                        title: 'Search',
                        titleColor: pageIndex == 1
                            ? Theme.of(context).primaryColor
                            : AppColors.gray,
                        iconName: pageIndex == 1
                            ? Assets.icons.icSelectedSearchNormal.path
                            : Assets.icons.icUnselectedSearchNormal.path,
                        iconColor: pageIndex == 1
                            ? Theme.of(context).primaryColor
                            : AppColors.gray,
                        tap: () {
                          setState(() {
                            pageIndex = 1;
                          });
                        },
                      ),
                      const SizedBox(width: 12),
                      TopIconWidget(
                        title: 'Bookmarks',
                        titleColor: pageIndex == 2
                            ? Theme.of(context).primaryColor
                            : AppColors.gray,
                        iconName: pageIndex == 2
                            ? Assets.icons.icSelectedArchive.path
                            : Assets.icons.icUnselectedArchive.path,
                        iconColor: pageIndex == 2
                            ? Theme.of(context).primaryColor
                            : AppColors.gray,
                        tap: () {
                          setState(() {
                            pageIndex = 2;
                          });
                        },
                      ),
                      const Spacer(),
                    ],
                  ),
                )
              : null,
          body: Center(
            child: pages[pageIndex],
          ),
          bottomNavigationBar: isMobile
              ? Container(
                  height: 60,
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
                  child: Row(
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
                )
              : null,
        );
      },
    );
  }
}
