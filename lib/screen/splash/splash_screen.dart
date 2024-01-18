import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'splash_next1.dart';
import 'package:simplynews/screen/navbar/navbar.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Waktu tunda sebelum berpindah ke halaman utama (dalam milidetik)
    const splashDuration = 2000;

    // Fungsi untuk berpindah ke halaman utama setelah waktu tertentu
    Timer(
      Duration(milliseconds: splashDuration),
      () async {
        // Periksa apakah pengguna sudah login
        User? user = FirebaseAuth.instance.currentUser;

        if (user != null) {
          // Jika sudah login, arahkan ke halaman utama (MainTabBar)
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (BuildContext context) => MainTabBar(initialPageIndex: 0),
            ),
          );
        } else {
          // Jika belum login, arahkan ke halaman SplashNext1
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (BuildContext context) => SplashNext1(),
            ),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/splash_logo.png',
                  width: 400,
                  height: 400,
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
