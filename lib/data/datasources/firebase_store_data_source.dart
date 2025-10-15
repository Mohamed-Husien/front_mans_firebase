import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:front_mans_firebase/core/utils/firebase_result.dart';

class FirebaseStoreDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<FirebaseResult<void>> saveUserData(
    Map<String, dynamic>? userData,
  ) async {
    try {
      if (userData != null) {
        await _firestore
            .collection('users')
            .doc(_auth.currentUser?.uid)
            .set(userData);
        return FirebaseSuccess(null);
      } else {
        return FirebaseFailure("User data is null");
      }
    } on FirebaseException catch (e) {
      return FirebaseFailure(e.message ?? "Failed to save user data");
    }
  }

  Future<FirebaseResult<Map<String, dynamic>>> getUserData() async {
    try {
      final DocumentSnapshot snapshot = await _firestore
          .collection('users')
          .doc(_auth.currentUser?.uid)
          .get();
      if (snapshot.exists) {
        return FirebaseSuccess(snapshot.data() as Map<String, dynamic>);
      } else {
        return FirebaseFailure("User data not found");
      }
    } on FirebaseException catch (e) {
      return FirebaseFailure(e.message ?? "Failed to get user data");
    }
  }

  Future<FirebaseResult<void>> updateUserData(
    Map<String, dynamic> userData,
  ) async {
    try {
      await _firestore
          .collection('users')
          .doc(_auth.currentUser?.uid)
          .update(userData);
      return FirebaseSuccess(null);
    } on FirebaseException catch (e) {
      return FirebaseFailure(e.message ?? "Failed to update user data");
    }
  }

  Future<FirebaseResult<void>> deleteUserData() async {
    try {
      await _firestore.collection('users').doc(_auth.currentUser?.uid).delete();
      return FirebaseSuccess(null);
    } on FirebaseException catch (e) {
      return FirebaseFailure(e.message ?? "Failed to delete user data");
    }
  }
}
