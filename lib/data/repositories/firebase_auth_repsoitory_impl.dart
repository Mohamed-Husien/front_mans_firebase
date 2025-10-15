import 'package:firebase_auth/firebase_auth.dart';
import 'package:front_mans_firebase/core/mapper/user_mapper.dart';
import 'package:front_mans_firebase/core/utils/firebase_result.dart';
import 'package:front_mans_firebase/data/datasources/firebase_auth_data_source.dart';
import 'package:front_mans_firebase/domain/entities/user_entity.dart';
import 'package:front_mans_firebase/domain/repositories/firebase_auth_repository.dart';

class FirebaseAuthRepositoryImpl implements FirebaseAuthRepository {
  final FirebaseAuthDataSource _authDataSource;

  FirebaseAuthRepositoryImpl(this._authDataSource);

  @override
  Future<FirebaseResult<UserEntity?>> login(
    String email,
    String password,
  ) async {
    FirebaseResult<User?> result = await _authDataSource.login(email, password);
    if (result is FirebaseSuccess<User?>) {
      UserEntity? userEntity = UserMapper.instance.toUserEntity(result.data);
      return FirebaseSuccess(userEntity);
    } else if (result is FirebaseFailure) {
      return FirebaseFailure((result as FirebaseFailure<User?>).message);
    } else {
      return FirebaseFailure("Unknown error");
    }
  }

  @override
  Future<void> logout() {
    return _authDataSource.logout();
  }

  @override
  Future<FirebaseResult<UserEntity?>> register(String email, String password) async {
   FirebaseResult<User?> result = await _authDataSource.register(email, password);
    if (result is FirebaseSuccess<User?>) {
      UserEntity? userEntity = UserMapper.instance.toUserEntity(result.data);
      return FirebaseSuccess(userEntity);
    } else if (result is FirebaseFailure) {
      return FirebaseFailure((result as FirebaseFailure<User?>).message);
    } else {
      return FirebaseFailure("Unknown error");
    }
  }

  @override
  UserEntity? getCurrentUser() {
   User? user = _authDataSource.getCurrentUser();
   return UserMapper.instance.toUserEntity(user);

  }
}
