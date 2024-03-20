import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthState {
  const AuthState();
}

class AuthLoading extends AuthState {
  const AuthLoading();
}

class AuthDone extends AuthState {
  final UserCredential? userCredential;
  const AuthDone({this.userCredential});
}

class AuthError extends AuthState {
  final String message;
  const AuthError({required this.message});
}
