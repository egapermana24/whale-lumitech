import 'package:flutter/material.dart';
import '../../../aturan/constants/warna_apps.dart';
import 'splash_next3.dart';

class SplashNext2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/images/splash2.png'), // Ganti dengan path ke gambar latar belakang Anda
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(
                      0.5), // Sesuaikan tingkat opacity sesuai keinginan
                  BlendMode.darken,
                ),
              ),
            ),
          ),
          // Content di atas background image
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Bagian atas untuk logo
              Container(
                padding: EdgeInsets.all(16.0),
                child: Center(
                  child: Image.asset(
                    'assets/images/full_logo.png',
                    width: 100,
                    height: 100,
                  ), // Ganti dengan path ke logo Anda
                ),
              ),
              // Bagian bawah untuk teks dan tombol
              Container(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Track Your Emmission',
                      style: TextStyle(
                          fontSize: 44,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Start your trip and well count the estimated cost and carbon emmission',
                      style: TextStyle(fontSize: 24, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    Image.asset(
                      'assets/images/right_arrow.png',
                      width: 30,
                      height: 30,
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        // arahkan ke halaman login
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SplashNext3(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: AppColors.primaryColor,
                        onPrimary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 94.0),
                      ),
                      child: Text('Next'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
