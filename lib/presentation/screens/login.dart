import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front_mans_firebase/presentation/cubit/auth_state.dart';
import 'package:front_mans_firebase/presentation/cubit/login_cubit.dart';
import 'package:front_mans_firebase/presentation/screens/home.dart';
import 'package:front_mans_firebase/presentation/screens/register.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocConsumer<AuthCubit, AuthState>(
              buildWhen: (previous, current) =>
                  current is AuthInitial || current is AuthLoading,
              builder: (context, state) {
                if (state is AuthInitial) {
                  return ElevatedButton(
                    onPressed: () {
                      context.read<AuthCubit>().login(
                        'marwa@gmail.com',
                        '123456789',
                      );
                    },
                    child: Text('Sign In'),
                  );
                } else if (state is AuthLoading) {
                  return CircularProgressIndicator();
                } else {
                  return SizedBox.shrink();
                }
              },
              listenWhen: (previous, current) =>
                  current is AuthSuccess || current is AuthFailure,
              listener: (context, state) {
                if (state is AuthSuccess) {
                  // ScaffoldMessenger.of(context).showSnackBar(
                  // SnackBar(
                  //   content: Text(
                  //     'Login Successful! Welcome ${state.userEntity.email}',
                  //   ),
                  // ),);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => MyHomePage()),
                  );
                } else if (state is AuthFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Login Failed! ${state.message}')),
                  );
                }
              },
            ),
            SizedBox(height: 30),
            TextButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Register()),
              ),
              child: Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
