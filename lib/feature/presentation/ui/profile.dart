import 'package:finance_app_firebase/config/app_colors.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
            child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              height: 60,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                child: Text(
                  "Profile",
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.notifications,
                    color: AppColors.white,
                  )),
            )
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                color: Colors.amber,
                height: 150,
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.purple,
                height: 150,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(child: Container(height: 150, color: Colors.blue))
          ],
        ),
        Row(
          children: [
            Expanded(child: Container(height: 150, color: Colors.green))
          ],
        ),
        Row(
          children: [
            Expanded(child: Container(height: 150, color: Colors.red))
          ],
        ),
        Row(
          children: [
            Expanded(child: Container(height: 150, color: Colors.yellow))
          ],
        )
      ],
    )));
  }
}
