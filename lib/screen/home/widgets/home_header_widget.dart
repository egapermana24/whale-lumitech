// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:get/get.dart';

import '../../../resource/resource.gen.dart';
import '../../../aturan/constants/warna_apps.dart';
import '../../../aturan/pengaturan.dart';
// import '../../page/page.dart';
import 'round_icon_button_widget.dart';
// profile pag
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeHeaderWidget extends StatelessWidget {
  final String sambutan = 'Halo';
  final User? user;

  HomeHeaderWidget({Key? key, this.user});

  // static String _initSambutan() {
  //   final currentTime = DateTime.now();
  //   if (currentTime.hour < 10) {
  //     return 'Selamat Pagi!';
  //   } else if (currentTime.hour < 14) {
  //     return 'Selamat Siang!';
  //   } else if (currentTime.hour < 18) {
  //     return 'Selamat Sore!';
  //   } else {
  //     return 'Selamat Malam!';
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Bagian Kiri (Foto Profil, Sambutan, Nama)
        Row(
          children: [
            // Foto Profil
            CircleAvatar(
              backgroundImage: NetworkImage(user?.photoURL ?? ''),
              radius: 20,
            ),
            SizedBox(width: 8), // Beri jarak antara foto profil dan teks
            // Sambutan dan Nama
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  sambutan,
                  style: SafeGoogleFont(
                    'Mulish',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    height: 1.4,
                    color: Color(0xff94a5aa),
                  ),
                ),
                Text(
                  '${user?.displayName}',
                  textAlign: TextAlign.center,
                  style: SafeGoogleFont(
                    'Mulish',
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    height: 1.3,
                    color: Color(0xff1a434e),
                  ),
                ),
              ],
            ),
          ],
        ),
        // Bagian Kanan (Icon Notifikasi)
        RoundIconButtonWidget(
          iconName: Assets.icons.icNotification.path,
          iconColor: AppColors.primaryColor,
          iconWidth: 20,
          iconHeight: 20,
          borderColor: AppColors.borderColor,
          onTap: () {
            // Aksi yang dijalankan ketika tombol notifikasi diklik
          },
        ),
      ],
    );
  }
}
