import 'package:front_mans_firebase/core/utils/firebase_result.dart';
import 'package:front_mans_firebase/domain/entities/user_entity.dart';
import 'package:front_mans_firebase/domain/repositories/firebase_store_repository.dart';

class GetUserDataUserCase {
  final FirebaseStoreRepository _firebaseStoreRepository;

  GetUserDataUserCase(this._firebaseStoreRepository);

  Future<FirebaseResult<UserEntity?>> call() async {
    return await _firebaseStoreRepository.getUserData();
  }
}
