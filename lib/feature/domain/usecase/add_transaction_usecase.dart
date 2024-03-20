import 'package:finance_app_firebase/core/utils/usecase.dart';
import 'package:finance_app_firebase/feature/data/model/transaction_model.dart';
import 'package:finance_app_firebase/feature/domain/repository/transaction_repo.dart';

class AddTransactionUsecase implements UseCase<void, TransactionModel> {
  final TransactionRepo transactionRepo;
  AddTransactionUsecase(this.transactionRepo);

  @override
  Future<bool> call({TransactionModel? params}) async {
    return await transactionRepo.addTransaction(transactionModel: params);
  }
}
