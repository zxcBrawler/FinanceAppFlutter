import 'package:finance_app_firebase/feature/data/model/transaction_model.dart';

abstract class TransactionEvent {
  const TransactionEvent();
}

class AddTransaction extends TransactionEvent {
  final TransactionModel transactionModel;
  const AddTransaction({required this.transactionModel});
}

class GetTransactions extends TransactionEvent {
  final String uid;
  const GetTransactions({required this.uid});
}
