import 'package:front_mans_firebase/core/utils/firebase_result.dart';
import 'package:front_mans_firebase/domain/entities/user_entity.dart';
import 'package:front_mans_firebase/domain/repositories/firebase_auth_repository.dart';

class RegisterUseCase {
  final FirebaseAuthRepository _authRepository;

  RegisterUseCase(this._authRepository);

  Future<FirebaseResult<UserEntity?>> call(String email, String password) async {
    return _authRepository.register(email, password);
  }
}