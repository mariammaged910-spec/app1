import 'package:app1/core/models/user_model.dart';
import 'package:app1/core/utils/app_colors.dart';
import 'package:app1/features/auth/presentation/view/widgets/role_card_widget.dart';
import 'package:flutter/material.dart';

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
              AppColors.babyPeach,
              AppColors.babyPeach,
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
                Container(
                  width: 130,
                  height: 130,
                  decoration: BoxDecoration(
                    color: AppColors.secondaryGradient,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Icon(
                    // Icons.connecting_airports_sharp,
                    Icons.airplanemode_active_outlined,
                    size: 80,
                    color: AppColors.babyMint,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'TravelX',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                    fontFamily: 'Montserrat',
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Your journey begins here',
                  style: TextStyle(
                    fontSize: 18,
                    color: AppColors.textPrimary,
                    fontFamily: 'Roboto',
                  ),
                ),
                const SizedBox(height: 60),
                
                RoleCard(
                  // context,
                  icon: Icons.person_outline,
                  title: 'Continue as User',
                  subtitle: 'Book trips, manage bookings',
                  role: UserRole.user,
                  // color: AppColors.pastelBlue,
                  // iconColor: const Color(0xFF34A853),
                ),
                
                const SizedBox(height: 20),
                
                RoleCard(
                  // context,
                  icon: Icons.admin_panel_settings_outlined,
                  title: 'Continue as Admin',
                  subtitle: 'Manage trips, users, and bookings',
                  role: UserRole.admin,
                  // color: AppColors.pastelPink,
                  // iconColor: const Color(0xFF4285F4),
                ),
                
                const SizedBox(height: 40),
                
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'By continuing, you agree to our Terms of Service and Privacy Policy',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                    color: AppColors.textPrimary,
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