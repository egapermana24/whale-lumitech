import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:simplynews/screen/splash/splash_screen.dart';
import 'package:simplynews/aturan/constants/warna_apps.dart';
import 'package:simplynews/screen/bookmarks/widgets/bookmark_binding.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
// navbar
import 'package:simplynews/screen/navbar/navbar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const Simplynews());
}

class Simplynews extends StatelessWidget {
  const Simplynews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.primaryColor,
      ),
      home: const CheckLoginStatus(),
      initialBinding: BookmarksControllerBinding(),
    );
  }
}

class CheckLoginStatus extends StatelessWidget {
  const CheckLoginStatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Periksa status login menggunakan FirebaseAuth
      future: FirebaseAuth.instance.authStateChanges().first,
      builder: (context, AsyncSnapshot<User?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Jika masih dalam proses pengecekan, tampilkan loading atau widget lainnya
          return CircularProgressIndicator();
        } else {
          // Jika sudah ada hasil pengecekan, tentukan apakah pengguna sudah login atau belum
          final bool userLoggedIn = snapshot.hasData;
          return userLoggedIn
              ? const MainTabBar(initialPageIndex: 0)
              : SplashScreen();
        }
      },
    );
  }
}
