import 'package:firbase_project/core/models/user_model.dart';
import 'package:firbase_project/features/auth/data/repo/firebase_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository;
  UserModel? currentUser;
  UserRole? selectedRole;

  AuthCubit(this._authRepository) : super(InitAuthState()) {
    checkAuthStatus();
  }

  void setSelectedRole(UserRole role) {
    selectedRole = role;
  }

  Future<void> signUp({
    required String email,
    required String password,
    required String name,
    required UserRole role,
    String? phoneNumber,
  }) async {
    emit(LoadingAuthState());
    
    final result = await _authRepository.signUp(
      email: email,
      password: password,
      name: name,
      role: role,
      phoneNumber: phoneNumber,
    );
    
    if (result['success'] == true) {
      currentUser = result['user'];
      emit(SuccessAuthState(user: currentUser, message: 'Sign up successful!'));
    } else {
      emit(FailAuthState(result['error']));
    }
  }

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    emit(LoadingAuthState());
    
    final result = await _authRepository.signIn(
      email: email,
      password: password,
    );
    
    if (result['success'] == true) {
      currentUser = result['user'];
      emit(SuccessAuthState(user: currentUser, message: 'Login successful!'));
    } else {
      emit(FailAuthState(result['error']));
    }
  }

  Future<void> signOut() async {
    emit(LoadingAuthState());
    await _authRepository.signOut();
    currentUser = null;
    selectedRole = null;
    emit(SuccessAuthState(message: 'Logged out successfully!'));
  }

  Future<void> checkAuthStatus() async {
    final user = await _authRepository.getCurrentUser();
    if (user != null) {
      currentUser = user;
      emit(SuccessAuthState(user: currentUser));
    } else {
      emit(InitAuthState());
    }
  }
}