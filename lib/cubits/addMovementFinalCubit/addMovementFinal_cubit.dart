import 'package:bloc/bloc.dart';
import 'package:budget_app_mobile/cubits/addMovementFinalCubit/addMovementFinal_state.dart';
import 'package:budget_app_mobile/helper/time_package.dart';
import 'package:budget_app_mobile/models/categoryModel/category_model.dart';
import 'package:budget_app_mobile/repositories/user_repositories.dart';
import 'package:flutter/cupertino.dart';

class AddMovementFinalCubit extends Cubit<AddMovementFinalState> {
  AddMovementFinalCubit({required this.userRepository})
      : super(AddMovementFinalInitialState()) {
    emit(AddMovementFinalLoadingState());
    emit(AddMovementFinalLoadedState(
        moneyValueController: moneyValueController));
  }

  final UserRepository userRepository;
  TextEditingController moneyValueController = TextEditingController();

  Future createNewMovement(CategoryModel category) async {
    await userRepository.createNewMovement(
      movementName: category.categoryName,
      time: TimePackage.getCurrentTimestamp(),
      moneyValue: double.parse(moneyValueController.text),
      category: category,
    );
  }
}
