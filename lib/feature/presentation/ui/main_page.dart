import 'package:finance_app_firebase/core/router/app_router.dart';
import 'package:finance_app_firebase/core/router/router_utils.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  final String? location;
  final Widget? child;
  const MainPage({super.key, this.location, this.child});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: widget.child ?? const Placeholder(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          switch (value) {
            case 0:
              router.push(Pages.dashboard.screenPath);
              break;

            case 1:
              router.push(Pages.transactions.screenPath);
              break;
            case 2:
              router.push(Pages.profile.screenPath);
              break;
          }
          setState(() {
            currentIndex = value;
          });
        },
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: "Dashboard",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: "Transactions",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
