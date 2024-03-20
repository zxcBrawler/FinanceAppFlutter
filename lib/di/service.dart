import 'package:finance_app_firebase/feature/data/repository/auth_repo_impl.dart';
import 'package:finance_app_firebase/feature/data/repository/transaction_repo_impl.dart';
import 'package:finance_app_firebase/feature/domain/repository/auth_repo.dart';
import 'package:finance_app_firebase/feature/domain/repository/transaction_repo.dart';
import 'package:finance_app_firebase/feature/domain/usecase/add_transaction_usecase.dart';
import 'package:finance_app_firebase/feature/domain/usecase/get_transactions_usecase.dart';
import 'package:finance_app_firebase/feature/domain/usecase/login_usecase.dart';
import 'package:finance_app_firebase/feature/domain/usecase/register_usecase.dart';
import 'package:finance_app_firebase/feature/presentation/bloc/auth/auth_bloc.dart';
import 'package:finance_app_firebase/feature/presentation/bloc/transaction/transaction_bloc.dart';
import 'package:finance_app_firebase/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';

final service = GetIt.instance;

Future<void> init() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  service.registerFactory<AuthBloc>(() => AuthBloc(service(), service()));
  service.registerFactory<TransactionBloc>(
      () => TransactionBloc(service(), service()));

  service.registerSingleton<AuthRepo>(AuthRepoImpl());
  service.registerSingleton<TransactionRepo>(TransactionRepoImpl());

  service.registerSingleton<LoginUsecase>(LoginUsecase(service()));
  service.registerSingleton<RegisterUsecase>(RegisterUsecase(service()));
  service.registerSingleton<GetTransactionsUsecase>(
      GetTransactionsUsecase(service()));
  service.registerSingleton<AddTransactionUsecase>(
      AddTransactionUsecase(service()));
}
