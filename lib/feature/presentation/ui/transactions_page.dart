import 'package:flutter/material.dart';

class Transactions extends StatefulWidget {
  const Transactions({super.key});

  @override
  State<Transactions> createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
            child: Column(
      children: [
        const Row(
          children: [
            SizedBox(
              height: 60,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                child: Text(
                  "Transactions",
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                height: 200,
                color: Colors.amber,
              ),
            ),
            Expanded(
              child: Container(
                height: 200,
                color: Colors.green,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(child: Container(height: 500, color: Colors.blue))
          ],
        )
      ],
    )));
  }
}
