import 'package:finance_app_firebase/config/app_colors.dart';
import 'package:finance_app_firebase/core/router/app_router.dart';
import 'package:finance_app_firebase/core/router/router_utils.dart';
import 'package:finance_app_firebase/di/service.dart';
import 'package:finance_app_firebase/feature/data/model/transaction_model.dart';
import 'package:finance_app_firebase/feature/presentation/bloc/transaction/transaction_bloc.dart';
import 'package:finance_app_firebase/feature/presentation/bloc/transaction/transaction_event.dart';
import 'package:finance_app_firebase/feature/presentation/bloc/transaction/transaction_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

class Transactions extends StatefulWidget {
  const Transactions({super.key});

  @override
  State<Transactions> createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  final transactionBloc = service<TransactionBloc>();

  final TextEditingController _titleController =
      TextEditingController(text: '');
  final MaskedTextController _amountController =
      MaskedTextController(mask: "000000000");

  TransactionModel transactionModel = TransactionModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        // Wrap the content inside a SingleChildScrollView to enable scrolling
        child: SingleChildScrollView(
            child: Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        // Column widget to organize the content vertically
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Transactions",
                style: TextStyle(fontSize: 30),
              ),
              IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          insetPadding: EdgeInsets.zero,
                          backgroundColor: Colors.transparent,
                          child: AlertDialog(
                            backgroundColor: AppColors.backgroundColor,
                            title: const Text("Add Transaction"),
                            content: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextField(
                                      controller: _titleController,
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: "Title",
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextField(
                                      controller: _amountController,
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: "Amount",
                                      ),
                                    ),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: DropdownMenu(
                                          onSelected: (value) {
                                            transactionModel.type = value;
                                          },
                                          label: const Text("Type"),
                                          dropdownMenuEntries: const [
                                            DropdownMenuEntry(
                                              label: "income",
                                              value: "income",
                                            ),
                                            DropdownMenuEntry(
                                              label: "outcome",
                                              value: "outcome",
                                            ),
                                          ])),
                                  ElevatedButton(
                                    onPressed: () async {
                                      await _addTransaction();
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColors.tealPrimary),
                                    child: const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        "Add transaction",
                                        style: TextStyle(
                                            color: AppColors.backgroundColor,
                                            fontSize: 15),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                  icon: const Icon(
                    Icons.add,
                    size: 25,
                    color: AppColors.white,
                  )),
            ],
          ),
          BlocProvider(
              create: (context) => transactionBloc
                ..add(GetTransactions(
                    uid: FirebaseAuth.instance.currentUser!.uid)),
              child: BlocBuilder<TransactionBloc, TransactionState>(
                  builder: (context, state) {
                switch (state.runtimeType) {
                  case TransactionLoading:
                    return const CircularProgressIndicator();
                  case TransactionDone:
                    if (state.transactions!.isEmpty) {
                      return const Text("No transactions yet");
                    } else {
                      List<TransactionModel> transactions = state.transactions!;
                      transactions
                          .sort((a, b) => b.timestamp!.compareTo(a.timestamp!));
                      return ListView.builder(
                          shrinkWrap: true,
                          itemCount: transactions.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(
                                transactions[index].title!,
                                style: const TextStyle(
                                    fontSize: 30, color: AppColors.white),
                              ),
                              subtitle: Text(transactions[index].timestamp!),
                              trailing: transactions[index].type == "income"
                                  ? Text(
                                      "+ ${transactions[index].amount!}",
                                      style: const TextStyle(
                                          color: Colors.green, fontSize: 30),
                                    )
                                  : Text(
                                      "- ${transactions[index].amount!}",
                                      style: const TextStyle(
                                          color: Colors.red, fontSize: 30),
                                    ),
                              leading: transactions[index].type == "income"
                                  ? const Icon(
                                      Icons.arrow_upward,
                                      color: Colors.green,
                                      size: 30,
                                    )
                                  : const Icon(
                                      Icons.arrow_downward,
                                      color: Colors.red,
                                      size: 30,
                                    ),
                            );
                          });
                    }

                  case TransactionError:
                    return Text(state.message!);
                  default:
                    return const SizedBox();
                }
              }))
        ],
      ),
    )));
  }

  Future<void> _addTransaction() async {
    transactionModel.title = _titleController.text;
    transactionModel.amount = int.parse(_amountController.text);

    transactionModel.timestamp = DateTime.now().toString();
    transactionModel.date = DateTime.now().toString().substring(0, 10);

    transactionBloc.add(AddTransaction(transactionModel: transactionModel));

    transactionBloc.stream.listen((event) {
      if (event is TransactionError) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(event.message!)));
      }

      if (event is AddTransactionDone) {
        router.pop();
        router.push(Pages.transactions.screenPath);
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Transaction added successfully")));
      }
    });
  }
}
