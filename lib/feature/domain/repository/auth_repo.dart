import 'package:finance_app_firebase/feature/data/model/login_dto.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepo {
  Future<UserCredential?> login({LoginDto? loginDto});
  Future<UserCredential?> register({LoginDto? loginDto});
}
