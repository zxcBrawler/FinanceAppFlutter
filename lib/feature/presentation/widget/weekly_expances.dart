import 'package:finance_app_firebase/di/service.dart';
import 'package:finance_app_firebase/feature/data/model/transaction_model.dart';
import 'package:finance_app_firebase/feature/presentation/bloc/transaction/transaction_bloc.dart';
import 'package:finance_app_firebase/feature/presentation/bloc/transaction/transaction_event.dart';
import 'package:finance_app_firebase/feature/presentation/bloc/transaction/transaction_state.dart';
import 'package:finance_app_firebase/feature/presentation/widget/basic_linechart.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Widget representing the admin view of weekly orders, including a line chart
class WeeklyExpances extends StatefulWidget {
  const WeeklyExpances({Key? key}) : super(key: key);

  @override
  State<WeeklyExpances> createState() => _WeeklyExpancesState();
}

class _WeeklyExpancesState extends State<WeeklyExpances> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<TransactionBloc>(
      create: (context) => service()
        ..add(GetTransactions(uid: FirebaseAuth.instance.currentUser!.uid)),
      child: BlocBuilder<TransactionBloc, TransactionState>(
        builder: (_, state) {
          switch (state.runtimeType) {
            case TransactionLoading:
              return const Center(child: CircularProgressIndicator());
            case TransactionDone:
              List<FlSpot> flSpotIncome = generateFlSpotList(
                state.transactions!,
                transactionType: "income",
              );

              List<FlSpot> flSpotOutcome = generateFlSpotList(
                state.transactions!,
                transactionType: "outcome",
              );

              return BasicLineChart(
                spotsList: [flSpotIncome, flSpotOutcome],
                titles: const ["income", "outcome"],
              );

            case TransactionError:
              return const Text("error");
          }

          return const SizedBox();
        },
      ),
    );
  }

  List<FlSpot> generateFlSpotList(List<TransactionModel> deliveryInfoList,
      {required String? transactionType}) {
    DateTime currentDate = DateTime.now();

    List<DateTime> dateTimeList = deliveryInfoList
        .where((info) =>
            info.type! == transactionType &&
            DateTime.parse(info.date!).isAfter(
              currentDate.subtract(
                Duration(days: currentDate.weekday),
              ),
            ))
        .map((info) => DateTime.parse(info.date!))
        .toList();

    // Generate FlSpot objects for each day of the week
    return List.generate(7, (index) {
      // Calculate occurrences for the current day (1 to 7)
      int occurrences = dateTimeList
          .where((dateTime) => dateTime.weekday == (index + 1))
          .length;

      // Return FlSpot object with x-axis representing the day and
      // y-axis representing the occurrences
      return FlSpot(index.toDouble(), occurrences.toDouble());
    });
  }
}
