import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finance_app_firebase/feature/data/data_source/database.dart';
import 'package:finance_app_firebase/feature/presentation/widget/weekly_expances.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int balance = 0;

  @override
  void initState() {
    super.initState();
    _getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
            child: Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          const Row(
            children: [
              SizedBox(
                height: 60,
                child: Text(
                  "Dashboard",
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ],
          ),
          const Row(
            children: [
              Expanded(
                child: Text("Total balance:"),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  "₽ $balance",
                  style: const TextStyle(fontSize: 50),
                ),
              ),
            ],
          ),
          const Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 30),
                        child: SizedBox(height: 300, child: WeeklyExpances()),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    )));
  }

  Future<void> _getUserData() async {
    DocumentSnapshot snapshot =
        await Database.users.doc(FirebaseAuth.instance.currentUser!.uid).get();
    Map<String, dynamic> userData = snapshot.data() as Map<String, dynamic>;
    setState(() {
      balance = userData['remainingAmount'] as int;
    });
  }
}
