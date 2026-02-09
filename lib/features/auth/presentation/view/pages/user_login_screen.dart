import 'package:app1/core/models/user_model.dart';
import 'package:app1/core/utils/app_colors.dart';
import 'package:app1/features/auth/presentation/view/widgets/login_form.dart';
import 'package:app1/features/auth/presentation/view_model/auth.cubit.dart';
import 'package:app1/features/auth/presentation/view_model/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserLoginScreen extends StatelessWidget {
  const UserLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is FailAuthState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.failMsg)),
          );
        }
        if (state is SuccessAuthState && state.user != null) {
          if (state.user!.role == UserRole.user) {
            Navigator.pushReplacementNamed(context, '/user_home');
          } else {
            Navigator.pushReplacementNamed(context, '/admin_home');
          }
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Welcome Back!', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
            backgroundColor: AppColors.pastelBlue,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              color: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: LoginForm(),
        );
      },
    );
  }
}

