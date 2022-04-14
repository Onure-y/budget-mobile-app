import 'package:budget_app_mobile/models/movementModel/movement_model.dart';
import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  String email;
  @HiveField(2)
  String telephoneNumber;

  @HiveField(3)
  List<MovementModel> allMovements;

  UserModel(
      {required this.name,
      required this.email,
      required this.telephoneNumber,
      required this.allMovements});
}
