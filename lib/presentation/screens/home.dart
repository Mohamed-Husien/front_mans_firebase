import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front_mans_firebase/core/di/module.dart';
import 'package:front_mans_firebase/domain/entities/user_entity.dart';
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
                          child: const Text('Save User Data'),
                        ),
                        ElevatedButton(
                          onPressed: () =>
                              context.read<UserCubit>().getUserData(),
                          child: const Text('Get User Data'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            final updatedUser = UserEntity(
                              name: 'Marwa Updated',
                              phoneNumber: '01012345678',
                              address: 'Cairo',
                              email: "engmarwa@gmial.com",
                              uid: 'user_uid',
                            );
                            context.read<UserCubit>().updateUserData(
                              updatedUser,
                            );
                          },
                          child: const Text('Update User Data'),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                          ),
                          onPressed: () {
                            context.read<UserCubit>().deleteUserData();
                          },
                          child: const Text('Delete User Data'),
                        ),
                      ],
                    );
                  } else if (state is UserLoading) {
                    return const CircularProgressIndicator();
                  } else {
                    return const SizedBox.shrink();
                  }
                },
                listenWhen: (previous, current) =>
                    current is UserAdded ||
                    current is UserUpdated ||
                    current is UserDeleted ||
                    current is UserLoaded ||
                    current is UserError,
                listener: (context, state) {
                  if (state is UserAdded) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('User Added Successfully')),
                    );
                  } else if (state is UserUpdated) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('User Updated Successfully'),
                      ),
                    );
                  } else if (state is UserDeleted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('User Deleted Successfully'),
                      ),
                    );
                  } else if (state is UserLoaded) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Loaded: ${state.userEntity.name}, ${state.userEntity.phoneNumber}',
                        ),
                      ),
                    );
                  } else if (state is UserError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Error: ${state.message}')),
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
