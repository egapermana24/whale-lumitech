import 'dart:async';
// import 'package:simplynews/screen/navbar/navbar.dart';
import 'package:simplynews/screen/login/login.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Waktu tunda sebelum berpindah ke halaman utama (dalam milidetik)
    const splashDuration = 3000;

    // Fungsi untuk berpindah ke halaman utama setelah waktu tertentu
    Timer(
      Duration(milliseconds: splashDuration),
      () {
        // Navigasi ke halaman utama
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            // builder: (BuildContext context) => const MainTabBar( initialPageIndex: 0,),
            builder: (BuildContext context) => LoginPage(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background_image.png'),
              fit: BoxFit.contain,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/app_logo.png',
                  width: 200,
                  height: 200,
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
