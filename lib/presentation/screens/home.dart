import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front_mans_firebase/core/di/module.dart';
import 'package:front_mans_firebase/presentation/cubit/user_cubit.dart';
import 'package:front_mans_firebase/presentation/cubit/user_state.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserCubit>(
      create: (context) => sl(),
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocConsumer<UserCubit, UserState>(
                buildWhen: (previous, current) =>
                    current is UserInitial || current is UserLoading,
                builder: (context, state) {
                  if (state is UserInitial) {
                    return Column(
                      children: [
                        ElevatedButton(
                          onPressed: () => context
                              .read<UserCubit>()
                              .saveUserData('Marwa', '1235966959', 'Mansoura'),
                          child: Text('Save User Data'),
                        ),
                        ElevatedButton(
                          onPressed: () =>
                              context.read<UserCubit>().getUserData(),
                          child: Text('Get User Data'),
                        ),
                      ],
                    );
                  } else if (state is UserLoading) {
                    return CircularProgressIndicator();
                  } else {
                    return SizedBox.shrink();
                  }
                },
                listenWhen: (previous, current) =>
                    current is UserAdded || current is UserError || current is UserLoaded,
                listener: (context, state) {
                  if (state is UserAdded) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('User Added Successfully')),
                    );
                  } else if(state is UserLoaded){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.userEntity.toString())));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Failed to add user')),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
