// buatkan halaman profile user yang diambil dari data google
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
// file login
// import 'package:simplynews/screen/login/services/auth_services.dart';
import 'package:simplynews/screen/login/login.dart';
// google sign in
import 'package:google_sign_in/google_sign_in.dart';

class ProfilePage extends StatelessWidget {
  final User? user;

  ProfilePage({Key? key, required this.user}) : super(key: key);

  void _signOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (user != null)
              Column(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(user!.photoURL ?? ''),
                    radius: 50,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Name: ${user!.displayName}',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Email: ${user!.email}',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => _signOut(context),
                    child: Text('Logout'),
                  ),
                ],
              ),
            if (user == null)
              Text(
                'User not signed in',
                style: TextStyle(fontSize: 18),
              ),
          ],
        ),
      ),
    );
  }
}
