import 'package:front_mans_firebase/domain/entities/user_entity.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final UserEntity userEntity;

  AuthSuccess(this.userEntity);
}

class AuthFailure extends AuthState {
  final String message;

  AuthFailure(this.message);
}
class AuthLoggedOut extends AuthState {}
