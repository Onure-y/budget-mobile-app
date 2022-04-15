import 'package:budget_app_mobile/models/movementModel/movement_model.dart';
import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {}

class HomeInitalState extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeLoadingState extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeLoadedState extends HomeState {
  HomeLoadedState({
    required this.incomeValue,
    required this.expenseValue,
    required this.budgetValue,
    required this.recentMovements,
    required this.recentValue,
    required this.incomeDeg,
  });
  final double incomeValue;
  final double expenseValue;
  final double budgetValue;
  final double recentValue;
  final double incomeDeg;
  final List<MovementModel> recentMovements;
  @override
  List<Object?> get props => [
        incomeValue,
        expenseValue,
        budgetValue,
        recentMovements,
        recentValue,
        incomeDeg
      ];
}
