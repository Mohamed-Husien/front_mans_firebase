import 'package:front_mans_firebase/core/utils/firebase_result.dart';
import 'package:front_mans_firebase/domain/entities/user_entity.dart';

abstract class FirebaseAuthRepository {
  Future<FirebaseResult<UserEntity?>> login(String email, String password);

  Future<FirebaseResult<UserEntity?>> register(String email, String password);

  Future<void> logout();
  UserEntity? getCurrentUser();
}
