import 'package:finance_app_firebase/feature/data/model/transaction_model.dart';

abstract class TransactionRepo {
  Future<bool> addTransaction({TransactionModel? transactionModel});
  Future<List<TransactionModel>> getTransactions({String? uid});
}
