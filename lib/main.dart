import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:simplynews/screen/splash/splash_screen.dart';
import 'package:simplynews/aturan/constants/warna_apps.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  debugPaintSizeEnabled = false;
  await Future.delayed(const Duration(seconds: 10));
  FlutterNativeSplash.remove();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const Whale());
}

class Whale extends StatelessWidget {
  const Whale({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.primaryColor,
      ),
      home: SplashScreen(),
    );
  }
}
