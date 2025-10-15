import 'package:firebase_auth/firebase_auth.dart';
import 'package:front_mans_firebase/domain/entities/user_entity.dart';

class UserMapper {
  UserMapper._();

  static final instance = UserMapper._();

  UserEntity? toUserEntity(User? user) {
    if (user == null) return null;
    return UserEntity(uid: user.uid, email: user.email ?? '',);
  }

  User? toUser(UserEntity? userEntity) {
    if (userEntity == null) return null;
    return FirebaseAuth.instance.currentUser;
  }
}
