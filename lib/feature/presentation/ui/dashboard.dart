import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
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
                  "Dashboard",
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
