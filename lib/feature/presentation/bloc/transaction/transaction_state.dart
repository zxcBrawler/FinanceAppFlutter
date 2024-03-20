import 'package:finance_app_firebase/feature/data/model/transaction_model.dart';

abstract class TransactionState {
  final List<TransactionModel>? transactions;
  final String? message;
  const TransactionState({this.transactions, this.message});
}

class TransactionLoading extends TransactionState {
  const TransactionLoading();
}

class TransactionDone extends TransactionState {
  const TransactionDone(List<TransactionModel> transactions)
      : super(transactions: transactions);
}

class AddTransactionDone extends TransactionState {
  final bool isAdded;
  const AddTransactionDone({required this.isAdded});
}

class TransactionError extends TransactionState {
  const TransactionError(String message) : super(message: message);
}
