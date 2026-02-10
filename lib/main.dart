import 'package:app1/features/auth/data/repo/firebase_repo.dart';
import 'package:app1/features/auth/presentation/view/pages/admin_home_screen.dart';
import 'package:app1/features/auth/presentation/view/pages/admin_login_screen.dart';
import 'package:app1/features/auth/presentation/view/pages/admin_signup_screen.dart';
import 'package:app1/features/auth/presentation/view/pages/user_home_screen.dart';
import 'package:app1/features/auth/presentation/view/pages/user_login_screen.dart';
import 'package:app1/features/auth/presentation/view/pages/user_profile_screen.dart';
import 'package:app1/features/auth/presentation/view/pages/user_signup_screen.dart';
import 'package:app1/features/auth/presentation/view_model/auth.cubit.dart';
import 'package:app1/features/splash_screen.dart';
import 'package:app1/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AuthRepository(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthCubit(
              RepositoryProvider.of<AuthRepository>(context),
            ),
          ),
        ],
        child: MaterialApp(
          title: 'TravelX',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            useMaterial3: true,
            fontFamily: 'Roboto',
          ),
          onGenerateRoute: (settings) {
            switch (settings.name) {
              case '/':
                return MaterialPageRoute(
                  builder: (_) => const SplashScreen(),
                );
              case '/user_login':
                return MaterialPageRoute(
                  builder: (_) =>  UserLoginScreen(),
                );
              case '/user_signup':
                return MaterialPageRoute(
                  builder: (_) => const UserSignupScreen(),
                );
              case '/user_home':
                return MaterialPageRoute(
                  builder: (_) => const UserHomeScreen(),
                );
              case '/user_profile':
                return MaterialPageRoute(
                  builder: (_) => const UserProfileScreen(),
                );
              // case '/admin_profile':
              // return MaterialPageRoute(
              //   builder: (_) => const UserProfileScreen(),
              // );
              case '/admin_home':
                return MaterialPageRoute(
                  builder: (_) => const AdminHomeScreen(),
                );
              case '/admin_login':
                return MaterialPageRoute(
                  builder: (_) => const AdminLoginScreen(),
                );
              case '/admin_signup':
                return MaterialPageRoute(
                  builder: (_) => const AdminSignupScreen(),
                );
              // case '/add_trip':
              //   return MaterialPageRoute(
              //     builder: (_) => const AddTripScreen(),
              //   );
              default:
                return MaterialPageRoute(
                  builder: (_) => const SplashScreen(), //homeScreen(),
                );
            }
          },
        ),
      ),
    );
  }
}

