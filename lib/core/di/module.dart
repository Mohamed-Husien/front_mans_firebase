import 'package:front_mans_firebase/data/datasources/firebase_auth_data_source.dart';
import 'package:front_mans_firebase/data/datasources/firebase_store_data_source.dart';
import 'package:front_mans_firebase/data/repositories/firebase_auth_repsoitory_impl.dart';
import 'package:front_mans_firebase/data/repositories/firebase_store_repository_impl.dart';
import 'package:front_mans_firebase/domain/repositories/firebase_auth_repository.dart';
import 'package:front_mans_firebase/domain/repositories/firebase_store_repository.dart';
import 'package:front_mans_firebase/domain/usecases/get_current_user_use_case.dart';
import 'package:front_mans_firebase/domain/usecases/get_user_data_use_case.dart';
import 'package:front_mans_firebase/domain/usecases/login_use_case.dart';
import 'package:front_mans_firebase/domain/usecases/logout_use_case.dart';
import 'package:front_mans_firebase/domain/usecases/register_use_case.dart';
import 'package:front_mans_firebase/domain/usecases/save_user_data_use_case.dart';
import 'package:front_mans_firebase/presentation/cubit/login_cubit.dart';
import 'package:front_mans_firebase/presentation/cubit/user_cubit.dart';
import 'package:get_it/get_it.dart';

GetIt sl = GetIt.instance;

void setupModule() {
  sl.registerLazySingleton<FirebaseAuthDataSource>(
    () => FirebaseAuthDataSource(),
  );
  sl.registerLazySingleton<FirebaseAuthRepository>(
    () => FirebaseAuthRepositoryImpl(sl()),
  );
  sl.registerFactory<LoginUseCase>(() => LoginUseCase(sl()));
  sl.registerFactory<RegisterUseCase>(() => RegisterUseCase(sl()));
  sl.registerFactory<LogoutUseCase>(() => LogoutUseCase(sl()));
  sl.registerFactory<AuthCubit>(() => AuthCubit(sl(), sl(), sl()));

  sl.registerLazySingleton<FirebaseStoreDataSource>(
    () => FirebaseStoreDataSource(),
  );
  sl.registerLazySingleton<FirebaseStoreRepository>(
    () => FirebaseStoreRepositoryImpl(sl()),
  );
  sl.registerFactory<SaveUserDataUseCase>(() => SaveUserDataUseCase(sl()));
  sl.registerFactory<GetUserDataUserCase>(() =>GetUserDataUserCase(sl()));
  sl.registerFactory<GetCurrentUserUseCase>(() => GetCurrentUserUseCase(sl()));
  sl.registerFactory<UserCubit>(() => UserCubit(sl(), sl(), sl()));
}
