import 'package:finance_app_firebase/feature/data/data_source/database.dart';
import 'package:finance_app_firebase/feature/data/model/transaction_model.dart';
import 'package:finance_app_firebase/feature/domain/repository/transaction_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TransactionRepoImpl implements TransactionRepo {
  @override
  Future<bool> addTransaction({TransactionModel? transactionModel}) async {
    try {
      await Database.users
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection("transactions")
          .add(transactionModel!.toJson());

      final userDoc = await Database.users
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();

      int remainingAmount = userDoc["remainingAmount"];

      if (transactionModel.type == "income") {
        remainingAmount += transactionModel.amount!;
      }
      if (transactionModel.type == "outcome") {
        remainingAmount -= transactionModel.amount!;
      }
      await Database.users
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({"remainingAmount": remainingAmount});

      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<List<TransactionModel>> getTransactions({String? uid}) async {
    try {
      final snapshot =
          await Database.users.doc(uid).collection("transactions").get();
      return snapshot.docs
          .map((doc) => TransactionModel.fromJson(doc.data()))
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
