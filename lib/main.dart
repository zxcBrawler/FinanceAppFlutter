import 'package:finance_app_firebase/di/service.dart';
import 'package:finance_app_firebase/feature/app.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await init();
  runApp(const MainApp());
}
