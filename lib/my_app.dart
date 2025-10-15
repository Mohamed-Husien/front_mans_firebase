import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front_mans_firebase/core/di/module.dart';
import 'package:front_mans_firebase/presentation/cubit/login_cubit.dart';
import 'package:front_mans_firebase/presentation/screens/login.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthCubit>(
      create: (context) => sl(),
      child: MaterialApp(home: LoginScreen()),
    );
  }
}
