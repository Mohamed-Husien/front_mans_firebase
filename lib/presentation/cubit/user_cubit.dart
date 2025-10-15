import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front_mans_firebase/core/utils/firebase_result.dart';
import 'package:front_mans_firebase/domain/entities/user_entity.dart';
import 'package:front_mans_firebase/domain/usecases/get_current_user_use_case.dart';
import 'package:front_mans_firebase/domain/usecases/get_user_data_use_case.dart';
import 'package:front_mans_firebase/domain/usecases/save_user_data_use_case.dart';
import 'package:front_mans_firebase/presentation/cubit/user_state.dart';

class UserCubit extends Cubit<UserState> {
  final SaveUserDataUseCase _saveUserDataUseCase;
  final GetUserDataUserCase _getUserDataUserCase;
  final GetCurrentUserUseCase _currentUserUseCase;

  UserCubit(
    this._saveUserDataUseCase,
    this._getUserDataUserCase,
    this._currentUserUseCase,
  ) : super(UserInitial());

  void saveUserData(String name, String phone, String address) async {
    try {
      UserEntity? userEntity = _currentUserUseCase();
      emit(UserLoading());
      UserEntity? entity = userEntity?.copyWith(
        name: name,
        phoneNumber: phone,
        address: address,
      );
      final result = await _saveUserDataUseCase(entity);
      if (result is FirebaseSuccess) {
        emit(UserAdded());
      }
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }

  void getUserData() async {
    emit(UserLoading());
    final result = await _getUserDataUserCase();
    if (result is FirebaseSuccess) {
      emit(UserLoaded((result as FirebaseSuccess).data));
    } else {
      emit(UserError((result as FirebaseFailure).message));
    }
  }
}
