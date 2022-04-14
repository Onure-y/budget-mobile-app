import 'package:budget_app_mobile/views/home/detail_view.dart';
import 'package:budget_app_mobile/views/home/home_view.dart';
import 'package:budget_app_mobile/views/intro/intro_view.dart';
import 'package:budget_app_mobile/views/intro/welcome_view.dart';
import 'package:budget_app_mobile/views/register/login_view.dart';
import 'package:budget_app_mobile/views/register/register_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
