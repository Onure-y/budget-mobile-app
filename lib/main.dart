import 'package:budget_app_mobile/models/categoryModel/category_model.dart';
import 'package:budget_app_mobile/models/movementModel/movement_model.dart';
import 'package:budget_app_mobile/models/userModel/user_model.dart';
import 'package:budget_app_mobile/repositories/user_repositories.dart';
import 'package:budget_app_mobile/views/home/detail_view.dart';
import 'package:budget_app_mobile/views/home/home_view.dart';
import 'package:budget_app_mobile/views/intro/intro_view.dart';
import 'package:budget_app_mobile/views/intro/welcome_view.dart';
import 'package:budget_app_mobile/views/register/login_view.dart';
import 'package:budget_app_mobile/views/register/register_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter<UserModel>(UserModelAdapter());
  Hive.registerAdapter<CategoryModel>(CategoryModelAdapter());
  Hive.registerAdapter<MovementModel>(MovementModelAdapter());

  final userBox = await Hive.openBox<UserModel>('User');

  runApp(MyApp(userBox: userBox));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.userBox}) : super(key: key);

  final Box<UserModel> userBox;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => UserRepository(userBox: userBox),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      ),
    );
  }
}
