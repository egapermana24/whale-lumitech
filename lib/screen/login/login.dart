import 'package:flutter/material.dart';
import 'package:simplynews/aturan/constants/warna_apps.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 36.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Logo dengan jarak dari atas device
              Container(
                margin: EdgeInsets.only(top: 100),
                child: Image.asset(
                  'assets/images/text_logo.png',
                  width: 100,
                  height: 100,
                ),
              ),

              // Jarak antara logo dan tulisan "Login"
              SizedBox(height: 25),

              // Tulisan "Login"
              Text(
                'Login',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              // Jarak antara tulisan "Login" dan tulisan "Don't have an account yet, Register Here"
              SizedBox(height: 8),

              // Tulisan "Don't have an account yet, Register Here"
              Text(
                "Don't have an account yet, Register Here",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),

              // Jarak antara tulisan "Don't have an account yet" dan form input
              SizedBox(height: 16),

              // Form Email
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'example@email.com',
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.primaryColor),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),

              // Jarak antara form input email dan form input password
              SizedBox(height: 16),

              // Form Password
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: '***',
                    suffixIcon: IconButton(
                      icon: Icon(Icons.visibility),
                      onPressed: () {
                        // Implementasi untuk menampilkan atau menyembunyikan password
                      },
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.primaryColor),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  obscureText: true,
                ),
              ),

              // Jarak antara form input password dan tulisan "Forgot password?"
              SizedBox(height: 8),

              // Tulisan "Forgot password?"
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Forgot password?',
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
              ),

              // Jarak antara tulisan "Forgot password?" dan tombol Login
              SizedBox(height: 16),

              // Tombol Login
              ElevatedButton(
                onPressed: () {
                  // Implementasi aksi saat tombol login ditekan
                },
                style: ElevatedButton.styleFrom(
                  primary: AppColors.primaryColor, // Warna background tombol
                  onPrimary: Colors.white, // Warna teks tombol
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        10.0), // Sudut tombol yang dibulatkan
                  ),
                  padding: EdgeInsets.symmetric(
                      vertical: 16.0), // Tambahkan padding atas dan bawah
                ),
                child: Text('Login'),
              ),

              // tambahkan tombol login dengan google
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => AuthService.signInWithGoogle(context),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: AppColors.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
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
