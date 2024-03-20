import 'package:finance_app_firebase/feature/domain/usecase/login_usecase.dart';
import 'package:finance_app_firebase/feature/domain/usecase/register_usecase.dart';
import 'package:finance_app_firebase/feature/presentation/bloc/auth/auth_event.dart';
import 'package:finance_app_firebase/feature/presentation/bloc/auth/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUsecase loginUsecase;
  final RegisterUsecase registerUsecase;
  AuthBloc(this.loginUsecase, this.registerUsecase)
      : super(const AuthLoading()) {
    on<Login>(onLogin);
    on<Register>(onRegister);
  }

  void onLogin(Login event, Emitter<AuthState> emit) async {
    final userCredential = await loginUsecase(params: event.loginDto);
    if (userCredential == null) {
      emit(const AuthError(message: "Login failed"));
    } else {
      emit(AuthDone(userCredential: userCredential));
    }
  }

  void onRegister(Register event, Emitter<AuthState> emit) async {
    final userCredential = await registerUsecase(params: event.loginDto);
    if (userCredential == null) {
      emit(const AuthError(message: "Register failed"));
    } else {
      emit(AuthDone(userCredential: userCredential));
    }
  }
}
