import 'package:front_mans_firebase/domain/repositories/firebase_auth_repository.dart';

class LogoutUseCase {
  final FirebaseAuthRepository _authRepository;

  LogoutUseCase(this._authRepository);

  Future<void> call() async {
    return _authRepository.logout();
  }
}
