import 'package:front_mans_firebase/core/utils/firebase_result.dart';
import 'package:front_mans_firebase/domain/repositories/firebase_store_repository.dart';

class DeleteUserDataUseCase {
  final FirebaseStoreRepository _firebaseStoreRepository;

  DeleteUserDataUseCase(this._firebaseStoreRepository);

  Future<FirebaseResult<void>> call() async {
    return await _firebaseStoreRepository.deleteCurrentUser();
  }
}
