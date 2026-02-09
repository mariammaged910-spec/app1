import 'package:firbase_project/core/models/user_model.dart';

abstract class AuthState {}

class InitAuthState extends AuthState {}

class LoadingAuthState extends AuthState {}

class FailAuthState extends AuthState {
  final String failMsg;
  FailAuthState(this.failMsg);
}

class SuccessAuthState extends AuthState {
  final UserModel? user;
  final String? message;
  SuccessAuthState({this.user, this.message});
}