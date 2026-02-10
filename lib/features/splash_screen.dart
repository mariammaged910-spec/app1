import 'package:app1/features/auth/presentation/view/pages/admin_home_screen.dart';
import 'package:app1/features/auth/presentation/view/pages/role_selection_screen.dart';
import 'package:app1/features/auth/presentation/view/pages/user_home_screen.dart';
import 'package:app1/features/auth/presentation/view_model/auth.cubit.dart';
import 'package:app1/features/auth/presentation/view_model/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        final cubit = context.read<AuthCubit>();
        
        if (state is LoadingAuthState) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
        
        if (state is SuccessAuthState && cubit.currentUser != null) {
          if (cubit.currentUser!.role.toString().contains('user')) {
            return const UserHomeScreen();
          } else {
            return const AdminHomeScreen();
          }
        }
        
        return const RoleSelectionScreen();
      },
    );
  }
}