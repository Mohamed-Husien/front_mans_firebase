sealed class FirebaseResult<T>{
  const FirebaseResult();
}
class FirebaseSuccess<T> extends FirebaseResult<T>{
  final T data;
  const FirebaseSuccess(this.data);
}
class FirebaseFailure<T> extends FirebaseResult<T>{
  final String message;
  const FirebaseFailure(this.message);
}