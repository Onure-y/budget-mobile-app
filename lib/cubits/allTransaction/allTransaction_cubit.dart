import 'package:bloc/bloc.dart';
import 'package:budget_app_mobile/cubits/allTransaction/allTransaction_state.dart';
import 'package:budget_app_mobile/models/movementModel/movement_model.dart';
import 'package:budget_app_mobile/repositories/user_repositories.dart';
import 'package:flutter/material.dart';

class AllTransactionCubit extends Cubit<AllTransactionState> {
  AllTransactionCubit({required this.userRepository})
      : super(AllTransactionInitalState()) {
    emit(AllTransactionLoadingState());
    initState();
  }

  final UserRepository userRepository;
  List<MovementModel> allMovements = [];

  Future initState() async {
    await getAllMovements();
    await emitPage();
  }

  Future getAllMovements() async {
    allMovements = await userRepository.getAllMovements();
    allMovements = allMovements.reversed.toList();
    debugPrint(allMovements.length.toString());
    await emitPage();
  }

  Future emitPage() async {
    emit(AllTransactionLoadedState(movements: allMovements));
  }
}
