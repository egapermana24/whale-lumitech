import '../../../aturan/pengaturan.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeHeaderWidget extends StatelessWidget {
  final String sambutan = 'Hello';
  final User? user;

  HomeHeaderWidget({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String firstName = getFirstName(user?.displayName ?? '');
    // fullName
    String fullName = user?.displayName ?? '';
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Bagian Kiri (Foto Profil, Sambutan, Nama)
        Row(
          children: [
            // Foto Profil
            CircleAvatar(
              backgroundImage: NetworkImage(user!.photoURL ?? ''),
              radius: 15,
            ),
            SizedBox(width: 8), // Beri jarak antara foto profil dan teks
            // Sambutan dan Nama
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$sambutan, $firstName',
                  style: SafeGoogleFont(
                    'Mulish',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    height: 1.4,
                    color: Color(0xff94a5aa),
                  ),
                  overflow: TextOverflow
                      .ellipsis, // Menambahkan elipsis (...) jika teks melebihi panjang
                  maxLines: 1, // Membatasi teks hanya pada satu baris
                ),
                Text(
                  'Silver Rank',
                  textAlign: TextAlign.center,
                  style: SafeGoogleFont(
                    'Mulish',
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    height: 1.3,
                    color: Color(0xff1a434e),
                  ),
                ),
              ],
            ),
            // tambahkan gambar piala kecil di samping nama dan Silver Rank
            SizedBox(width: 8),
            Image.asset(
              'assets/icons/silver_rank.png',
              width: 20,
              height: 20,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                // Aksi yang dijalankan ketika di klik
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
                  image: AssetImage(
                      'assets/icons/bell.png'), // Ganti dengan path gambar yang sesuai
                  width: 10,
                  color: Colors.grey,
                ),
              ),
            ),
            SizedBox(width: 8),
            InkWell(
              onTap: () {
                // Aksi yang dijalankan ketika di klik
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
                  image: AssetImage(
                      'assets/icons/widget.png'), // Ganti dengan path gambar yang sesuai
                  width: 10,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  String getFirstName(String fullName) {
    List<String> nameParts = fullName.split(' ');
    return nameParts.isNotEmpty ? nameParts.first : '';
  }
}
