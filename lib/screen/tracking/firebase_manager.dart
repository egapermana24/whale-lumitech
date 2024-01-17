import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseManager {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> endTrip({
    required String transportation,
    required double totalDistance,
    required double emission,
    required int cost,
  }) async {
    // Ambil userId dari pengguna yang sedang login
    String? userId = _auth.currentUser?.uid;
    
    if (userId != null) {
      // double emission = _calculateEmission(transportation, totalDistance);

      await _firestore.collection('emissions').add({
        'user_id': userId,
        'transportation': transportation,
        'distance': totalDistance,
        'emission': emission,
        'cost': cost,
        'timestamp': FieldValue.serverTimestamp(),
      });
    } else {
      // Handle ketika userId tidak ditemukan (pengguna belum login)
      print('User not logged in');
    }
  }

  double _calculateEmission(String transportation, double distance) {
    // Rumus emisi untuk masing-masing jenis transportasi
    double emission = 0.0;
    switch (transportation) {
      case 'Car':
        emission = distance / 6 * 0.21;
        break;
      case 'Bus':
        emission = distance / 6 * 0.02;
        break;
      case 'Motorcycle':
        emission = distance / 6 * 0.07;
        break;
      case 'Train':
        emission = distance / 58.7 * 0.1;
        break;
    }
    return emission;
  }
}
