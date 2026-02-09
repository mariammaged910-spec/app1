import 'package:firbase_project/core/models/user_model.dart';
// import 'package:firbase_project/features/auth/presentation/view/pages/admin_login_screen.dart';
// import 'package:firbase_project/features/auth/presentation/view/pages/user_login_screen.dart';
import 'package:firbase_project/features/auth/presentation/view/widgets/role_card_widget.dart';
// import 'package:firbase_project/features/auth/presentation/view_model/auth.cubit.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
         decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF667eea),
              Color(0xFF764ba2),
            ],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                const Icon(
                  Icons.travel_explore,
                  size: 80,
                  color: Colors.white,
                ),
                const SizedBox(height: 20),
                const Text(
                  'TravelEase',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'Montserrat',
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Your journey begins here',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white70,
                    fontFamily: 'Roboto',
                  ),
                ),
                const SizedBox(height: 60),
                
                RoleCard(
                  // context,
                  icon: Icons.person,
                  title: 'Continue as User',
                  subtitle: 'Book trips, manage bookings',
                  role: UserRole.user,
                  iconColor: const Color(0xFF34A853),
                ),
                
                const SizedBox(height: 20),
                
                RoleCard(
                  // context,
                  icon: Icons.admin_panel_settings,
                  title: 'Continue as Admin',
                  subtitle: 'Manage trips, users, and bookings',
                  role: UserRole.admin,
                  iconColor: const Color(0xFF4285F4),
                ),
                
                const SizedBox(height: 40),
                
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'By continuing, you agree to our Terms of Service and Privacy Policy',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  
}