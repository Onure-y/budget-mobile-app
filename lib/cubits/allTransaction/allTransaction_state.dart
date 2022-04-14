import 'package:budget_app_mobile/models/movementModel/movement_model.dart';
import 'package:equatable/equatable.dart';

abstract class AllTransactionState extends Equatable {}

class AllTransactionInitalState extends AllTransactionState {
  @override
  List<Object?> get props => [];
}

class AllTransactionLoadingState extends AllTransactionState {
  @override
  List<Object?> get props => [];
}

class AllTransactionLoadedState extends AllTransactionState {
  AllTransactionLoadedState({required this.movements});
  final List<MovementModel> movements;
  @override
  List<Object?> get props => [movements];
}
