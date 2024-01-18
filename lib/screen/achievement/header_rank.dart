
import 'package:simplynews/aturan/constants/warna_apps.dart';
import '../../../aturan/pengaturan.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:percent_indicator/percent_indicator.dart';

class HeaderRank extends StatelessWidget {
  final User? user;

  HeaderRank({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String fullName = user?.displayName ?? '';
    String firstName = getFirstName(user?.displayName ?? '');
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Foto Profil
            CircleAvatar(
              backgroundImage: NetworkImage(user!.photoURL ?? ''),
              radius: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FittedBox(
                  fit: BoxFit.scaleDown, // Atur sesuai kebutuhan Anda
                  child: Text(
                    '$firstName',
                    textAlign: TextAlign.center,
                    style: SafeGoogleFont(
                      'Mulish',
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      height: 1.4,
                      color: Colors.black,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                FittedBox(
                  fit: BoxFit.scaleDown, // Atur sesuai kebutuhan Anda
                  child: Text(
                    'Silver Rank',
                    textAlign: TextAlign.center,
                    style: SafeGoogleFont(
                      'Mulish',
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      height: 1.3,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),

            Image.asset(
              'assets/icons/silver_rank.png',
              width: 40,
              height: 40,
            ),
          ],
        ),
        SizedBox(height: 14),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10.0), // Padding kanan
                  child: Text(
                    'Silver Rank',
                    textAlign: TextAlign.center,
                    style: SafeGoogleFont(
                      'Mulish',
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                      height: 1.3,
                      color: Colors.black,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 10.0), // Padding kiri
                  child: Text(
                    'Gold Rank',
                    textAlign: TextAlign.center,
                    style: SafeGoogleFont(
                      'Mulish',
                      fontSize: 12,
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
          width: MediaQuery.of(context).size.width - 50,
          lineHeight: 7.0,
          percent: 0.7,
          // center: Text("80.0%"),
          barRadius: Radius.circular(12),
          progressColor: AppColors.primaryColor,
        ),
      ],
    );
  }

  String getFirstName(String fullName) {
    List<String> nameParts = fullName.split(' ');
    return nameParts.isNotEmpty ? nameParts.first : '';
  }
}
