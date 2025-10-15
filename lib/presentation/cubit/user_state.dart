import 'package:front_mans_firebase/domain/entities/user_entity.dart';

abstract class UserState {}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserLoaded extends UserState {
  final UserEntity userEntity;

  UserLoaded(this.userEntity);
}

class UserAdded extends UserState {}

class UserUpdated extends UserState {}

class UserDeleted extends UserState {}

class UserError extends UserState {
  final String message;

  UserError(this.message);
}
