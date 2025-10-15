import 'package:firebase_auth/firebase_auth.dart';
import 'package:front_mans_firebase/core/utils/firebase_result.dart';

class FirebaseAuthDataSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<FirebaseResult<User?>> login(String email, String password) async {
    try {
      final authResult = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return FirebaseSuccess(authResult.user);
    } on FirebaseAuthException catch (e) {
      return FirebaseFailure(e.message ?? "Login failed");
    }
  }

  Future<FirebaseResult<User?>> register(String email, String password) async {
    try {
      final authResult = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return FirebaseSuccess(authResult.user);
    } on FirebaseAuthException catch (e) {
      return FirebaseFailure(e.message ?? "Registration failed");
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
  }

  User? getCurrentUser() {
    return _auth.currentUser;
  }
}
