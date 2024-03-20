import 'package:finance_app_firebase/core/utils/usecase.dart';
import 'package:finance_app_firebase/feature/data/model/transaction_model.dart';
import 'package:finance_app_firebase/feature/domain/repository/transaction_repo.dart';

class GetTransactionsUsecase
    implements UseCase<List<TransactionModel>, String> {
  final TransactionRepo transactionRepo;

  GetTransactionsUsecase(this.transactionRepo);

  @override
  Future<List<TransactionModel>> call({String? params}) async {
    return await transactionRepo.getTransactions(uid: params);
  }
}
