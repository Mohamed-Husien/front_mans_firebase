import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front_mans_firebase/core/utils/firebase_result.dart';
import 'package:front_mans_firebase/domain/usecases/login_use_case.dart';
import 'package:front_mans_firebase/domain/usecases/logout_use_case.dart';
import 'package:front_mans_firebase/domain/usecases/register_use_case.dart';
import 'package:front_mans_firebase/presentation/cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final LoginUseCase _loginUseCase;
  final RegisterUseCase _registerUseCase;
  final LogoutUseCase _logoutUseCase;

  AuthCubit(this._loginUseCase, this._registerUseCase, this._logoutUseCase)
    : super(AuthInitial());

  void login(String email, String password) async {
    emit(AuthLoading());
    final result = await _loginUseCase(email, password);
    if (result is FirebaseSuccess) {
      emit(AuthSuccess((result as FirebaseSuccess).data));
    } else {
      emit(AuthFailure((result as FirebaseFailure).message));
    }
  }

  void register(String email, String password) async {
    emit(AuthLoading());
    final result = await _registerUseCase(email, password);
    if (result is FirebaseSuccess) {
      emit(AuthSuccess((result as FirebaseSuccess).data));
    } else {
      emit(AuthFailure((result as FirebaseFailure).message));
    }
  }

  void logout() async {
    await _logoutUseCase();
    emit(AuthLoggedOut());
  }
}
