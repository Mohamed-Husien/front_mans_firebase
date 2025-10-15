import 'package:front_mans_firebase/core/utils/firebase_result.dart';
import 'package:front_mans_firebase/data/datasources/firebase_store_data_source.dart';
import 'package:front_mans_firebase/domain/entities/user_entity.dart';
import 'package:front_mans_firebase/domain/repositories/firebase_store_repository.dart';

class FirebaseStoreRepositoryImpl implements FirebaseStoreRepository {
  final FirebaseStoreDataSource _firebaseStoreDataSource;

  FirebaseStoreRepositoryImpl(this._firebaseStoreDataSource);

  @override
  Future<FirebaseResult<UserEntity?>> getUserData() async {
    FirebaseResult<Map<String, dynamic>> result = await _firebaseStoreDataSource
        .getUserData();
    if (result is FirebaseSuccess) {
      UserEntity? user = UserEntity.fromMap(
        (result as FirebaseSuccess<Map<String, dynamic>>).data,
      );
      return FirebaseSuccess(user);
    } else {
      return FirebaseFailure((result as FirebaseFailure).message);
    }
  }

  @override
  Future<FirebaseResult<void>> saveUserData(UserEntity? user) async {
    return await _firebaseStoreDataSource.saveUserData(user?.toMap());
  }

  @override
  Future<FirebaseResult<void>> deleteCurrentUser() async {
    return await _firebaseStoreDataSource.deleteUserData();
  }

  @override
  Future<FirebaseResult<void>> updateUserData(UserEntity user) async {
    return await _firebaseStoreDataSource.updateUserData(user.toMap());
  }
}
