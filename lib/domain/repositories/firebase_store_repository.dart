import 'package:front_mans_firebase/core/utils/firebase_result.dart';
import 'package:front_mans_firebase/domain/entities/user_entity.dart';

abstract class FirebaseStoreRepository {
  Future<FirebaseResult<void>> saveUserData(UserEntity? user);

  Future<FirebaseResult<UserEntity?>> getUserData();

  Future<FirebaseResult<void>> updateUserData(UserEntity user);

  Future<FirebaseResult<void>> deleteCurrentUser();
}
