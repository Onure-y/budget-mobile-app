import 'package:budget_app_mobile/models/categoryModel/category_model.dart';
import 'package:hive/hive.dart';

part 'movement_model.g.dart';

@HiveType(typeId: 1)
class MovementModel extends HiveObject {
  @HiveField(0)
  String movementName;
  @HiveField(1)
  int time;
  @HiveField(2)
  double moneyValue;

  @HiveField(3)
  CategoryModel category;

  MovementModel({
    required this.movementName,
    required this.time,
    required this.moneyValue,
    required this.category,
  });
}
