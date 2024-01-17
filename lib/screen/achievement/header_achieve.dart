import 'package:flutter/material.dart';
import 'package:simplynews/aturan/pengaturan.dart';
import 'package:firebase_auth/firebase_auth.dart';
// MainTabBar
import 'package:simplynews/screen/navbar/navbar.dart';

class HeaderAchieve extends StatelessWidget {
  final String sambutan = 'Hello';
  final User? user;

  HeaderAchieve({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Bagian Kiri (Foto Profil)
            InkWell(
              onTap: () {
                // ke MainTabBar
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainTabBar(
                      initialPageIndex: 0,
                    ),
                  ),
                );
              },
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Color(0xFFD4D4D4),
                  ),
                ),
                child: Image(
                  image: AssetImage('assets/images/left_arrow.png'),
                  width: 10,
                  color: Colors.grey,
                ),
              ),
            ),
            SizedBox(width: 8), // Beri jarak antara foto profil dan teks

            // Bagian Tengah (Sambutan dan Nama)
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Your',
                    style: SafeGoogleFont(
                      'Mulish',
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      height: 1.4,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Achievement',
                    style: SafeGoogleFont(
                      'Mulish',
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      height: 1.3,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        // Bagian Bawah (Tombol Your Progress dan Challenges)
        // SizedBox(height: 16),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     // Tombol Your Progress (sebelah kiri)
        //     Expanded(
        //       child: ElevatedButton(
        //         onPressed: () {
        //           Navigator.push(
        //             context,
        //             MaterialPageRoute(builder: (context) => YourProgress()),
        //           );
        //         },
        //         style: ElevatedButton.styleFrom(
        //           primary: AppColors.primaryColor,
        //           shape: RoundedRectangleBorder(
        //             borderRadius: BorderRadius.circular(10),
        //           ),
        //         ),
        //         child: Text(
        //           'Your Progress',
        //           style: TextStyle(color: Colors.white),
        //         ),
        //       ),
        //     ),

        //     // Spacer untuk memberikan jarak di antara kedua tombol
        //     SizedBox(width: 16),

        //     // Tombol Challenges (sebelah kanan)
        //     Expanded(
        //       child: ElevatedButton(
        //         onPressed: () {
        //           Navigator.push(
        //             context,
        //             MaterialPageRoute(builder: (context) => Challenges()),
        //           );
        //         },
        //         style: ElevatedButton.styleFrom(
        //           primary: Color(0xFFF2F2F2),
        //           shape: RoundedRectangleBorder(
        //             borderRadius: BorderRadius.circular(10),
        //           ),
        //         ),
        //         child: Text(
        //           'Challenges',
        //           style: TextStyle(
        //             color: Color(0xFFB3B3B3),
        //           ),
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
      ],
    );
  }
}
