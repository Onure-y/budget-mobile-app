import 'package:budget_app_mobile/models/categoryModel/category_model.dart';
import 'package:budget_app_mobile/models/movementModel/movement_model.dart';
import 'package:budget_app_mobile/models/userModel/user_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class UserRepository {
  UserRepository({required this.userBox});

  final Box<UserModel> userBox;
  final String userDataKey = 'userData';

  UserModel emptyUserData = UserModel(
    name: '',
    email: '',
    telephoneNumber: '',
    allMovements: [],
  );

  Future<UserModel> getUserData() async {
    UserModel userData = userBox.get(userDataKey) ?? emptyUserData;
    return userData;
  }

  Future<List<MovementModel>> getAllMovements() async {
    UserModel userModel = await getUserData();
    List<MovementModel> allMovements = userModel.allMovements;
    return allMovements;
  }

  Future createNewMovement({
    required String movementName,
    required int time,
    required double moneyValue,
    required CategoryModel category,
  }) async {
    UserModel userModel = await getUserData();
    MovementModel newMovementTemplate = MovementModel(
      movementName: movementName,
      time: time,
      moneyValue: moneyValue,
      category: category,
    );
    userModel.allMovements.add(newMovementTemplate);
    userBox.put(userDataKey, userModel);
  }
}
