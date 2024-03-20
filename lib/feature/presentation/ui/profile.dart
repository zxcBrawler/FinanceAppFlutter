import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finance_app_firebase/config/app_colors.dart';
import 'package:finance_app_firebase/core/router/app_router.dart';
import 'package:finance_app_firebase/core/router/router_utils.dart';
import 'package:finance_app_firebase/feature/data/data_source/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String name = "";
  String email = "";
  @override
  void initState() {
    // TODO: implement initState
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Profile",
                style: TextStyle(fontSize: 30),
              ),
              IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                    router.go(Pages.auth.screenPath);
                  },
                  icon: const Icon(
                    Icons.exit_to_app,
                    size: 25,
                    color: AppColors.white,
                  )),
            ],
          ),
          Row(
            children: [
              const Icon(
                Icons.person,
                color: AppColors.white,
                size: 150,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(fontSize: 30),
                    ),
                    Text(
                      email,
                      style: const TextStyle(fontSize: 20),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    )));
  }

  Future<void> _getUserData() async {
    DocumentSnapshot snapshot =
        await Database.users.doc(FirebaseAuth.instance.currentUser!.uid).get();
    Map<String, dynamic> userData = snapshot.data() as Map<String, dynamic>;
    setState(() {
      name = userData['full name'] as String;
      email = userData['email'] as String;
    });
  }
}
