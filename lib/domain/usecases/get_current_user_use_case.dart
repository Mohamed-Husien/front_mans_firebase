import 'package:front_mans_firebase/domain/entities/user_entity.dart';
import 'package:front_mans_firebase/domain/repositories/firebase_auth_repository.dart';

class GetCurrentUserUseCase {
  final FirebaseAuthRepository _authRepository;

  GetCurrentUserUseCase(this._authRepository);

  UserEntity? call() {
    return _authRepository.getCurrentUser();
  }
}
