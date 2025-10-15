import 'package:front_mans_firebase/core/utils/firebase_result.dart';
import 'package:front_mans_firebase/domain/entities/user_entity.dart';
import 'package:front_mans_firebase/domain/repositories/firebase_store_repository.dart';

class UpdateUserDataUseCase {
  final FirebaseStoreRepository _firebaseStoreRepository;

  UpdateUserDataUseCase(this._firebaseStoreRepository);

  Future<FirebaseResult<void>> call(UserEntity user) async {
    return await _firebaseStoreRepository.updateUserData(user);
  }
}
