import 'package:flutter/material.dart';
import 'package:simplynews/aturan/constants/warna_apps.dart';
import 'services/auth_services.dart';
import 'package:google_sign_in/google_sign_in.dart';

final GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: [
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // Widget Center untuk menempatkan widget di tengah-tengah
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 36.0),
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center, // Pusatkan widget di tengah-tengah
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Logo dengan jarak dari atas device
              Container(
                child: Image.asset(
                  'assets/images/text_logo.png',
                  width: 200,
                  height: 100,
                ),
              ),

              // tambahkan tombol login dengan google
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => AuthService.signInWithGoogle(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.white, // Ganti dengan warna yang diinginkan
                  onPrimary: Colors.black, // Warna teks
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    side: BorderSide(
                        color: AppColors.primaryColor), // Border biru
                  ),
                  elevation: 5, // Tinggi shadow
                  shadowColor: Colors.black.withOpacity(0.6), // Warna shadow
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/google_logo.png',
                      width: 24,
                      height: 24,
                    ),
                    SizedBox(width: 8),
                    Text('Login with Google'),
                  ],
                ),
              ),

              // Jarak antara tombol Login dan tulisan "With Login, You Agree Privacy Policy and Terms & Conditions."
              SizedBox(height: 16),

              // Tulisan "With Login, You Agree Privacy Policy and Terms & Conditions."
              // Text(
              //   'With Login, You Agree Privacy Policy and Terms & Conditions.',
              //   style: TextStyle(
              //     fontSize: 12,
              //     color: Colors.grey,
              //   ),
              //   textAlign: TextAlign.center, // Center the text
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
