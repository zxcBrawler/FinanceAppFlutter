import 'package:finance_app_firebase/core/utils/usecase.dart';
import 'package:finance_app_firebase/feature/data/model/login_dto.dart';
import 'package:finance_app_firebase/feature/domain/repository/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginUsecase implements UseCase<void, LoginDto> {
  final AuthRepo authRepo;

  LoginUsecase(this.authRepo);
  @override
  Future<UserCredential?> call({LoginDto? params}) async {
    return await authRepo.login(loginDto: params);
  }
}
