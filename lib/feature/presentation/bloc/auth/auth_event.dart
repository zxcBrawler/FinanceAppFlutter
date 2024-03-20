import 'package:finance_app_firebase/feature/data/model/login_dto.dart';

abstract class AuthEvent {
  final dynamic param;
  const AuthEvent({this.param});
}

class Login extends AuthEvent {
  final LoginDto? loginDto;
  const Login({this.loginDto});
}

class Register extends AuthEvent {
  final LoginDto? loginDto;
  const Register({this.loginDto});
}
