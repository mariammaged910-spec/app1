import 'package:firbase_project/core/models/user_model.dart';
import 'package:firbase_project/features/auth/presentation/view/pages/admin_login_screen.dart';
import 'package:firbase_project/features/auth/presentation/view/pages/user_login_screen.dart';
import 'package:firbase_project/features/auth/presentation/view_model/auth.cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RoleCard extends StatelessWidget{
  final IconData icon;
  final String title;
  final String subtitle;
  final Color iconColor;
  final UserRole role;

  const RoleCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.iconColor,
    required this.role,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      child: 
      InkWell(
        onTap: () {
          context.read<AuthCubit>().setSelectedRole(role);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => role == UserRole.user
                  ? UserLoginScreen()
                  : const AdminLoginScreen(),
            ),
          );
        },
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.white,
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                child: Icon(icon, size: 40, color: iconColor),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 20,
                color: Colors.grey[400],
              ),
            ],
          ),
        ),
      ),
    );
  }
  }
