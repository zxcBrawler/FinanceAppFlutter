import 'package:finance_app_firebase/feature/data/data_source/database.dart';
import 'package:finance_app_firebase/feature/data/model/login_dto.dart';
import 'package:finance_app_firebase/feature/data/model/user_model.dart';
import 'package:finance_app_firebase/feature/domain/repository/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepoImpl implements AuthRepo {
  @override
  Future<UserCredential?> login({LoginDto? loginDto}) async {
    try {
      final userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: loginDto!.email!, password: loginDto.password!);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code, message: e.message);
    }
  }

  @override
  Future<UserCredential?> register({LoginDto? loginDto}) async {
    try {
      final userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: loginDto!.email!, password: loginDto.password!);
      final userId = userCredential.user?.uid ?? "";
      if (userId != "") {
        await Database.users
            .doc(userId)
            .set(UserModel(
              fullName: loginDto.fullName,
              email: loginDto.email,
              password: loginDto.password,
              remainingAmount: 0,
            ).toJson())
            .then((value) => print("User Added"));
      }
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code, message: e.message);
    }
  }
}
