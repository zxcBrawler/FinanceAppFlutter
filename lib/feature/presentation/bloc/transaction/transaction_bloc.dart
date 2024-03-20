import 'package:finance_app_firebase/feature/domain/usecase/add_transaction_usecase.dart';
import 'package:finance_app_firebase/feature/domain/usecase/get_transactions_usecase.dart';
import 'package:finance_app_firebase/feature/presentation/bloc/transaction/transaction_event.dart';
import 'package:finance_app_firebase/feature/presentation/bloc/transaction/transaction_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  final GetTransactionsUsecase getTransactionsUsecase;
  final AddTransactionUsecase addTransactionUsecase;

  TransactionBloc(this.getTransactionsUsecase, this.addTransactionUsecase)
      : super(const TransactionLoading()) {
    on<GetTransactions>(onGetTransactions);
    on<AddTransaction>(onAddTransaction);
  }

  void onGetTransactions(
      GetTransactions event, Emitter<TransactionState> emit) async {
    final transactions = await getTransactionsUsecase(params: event.uid);
    if (transactions.isNotEmpty) {
      emit(TransactionDone(transactions));
    } else if (transactions.isEmpty) {
      emit(const TransactionDone([]));
    } else {
      emit(const TransactionError("No transactions found"));
    }
  }

  void onAddTransaction(
      AddTransaction event, Emitter<TransactionState> emit) async {
    final isAdded = await addTransactionUsecase(params: event.transactionModel);
    if (!isAdded) {
      emit(const TransactionError("Failed to add transaction"));
    } else {
      emit(AddTransactionDone(isAdded: isAdded));
    }
  }
}
