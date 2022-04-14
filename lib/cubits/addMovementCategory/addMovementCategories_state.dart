import 'package:budget_app_mobile/models/topCategoryModel/topCategory_model.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';

abstract class AddMovementCategoriesState extends Equatable {}

class AddMovementCategoriesInitalState extends AddMovementCategoriesState {
  @override
  List<Object?> get props => [];
}

class AddMovementCategoriesLoadingState extends AddMovementCategoriesState {
  @override
  List<Object?> get props => [];
}

class AddMovementCategoriesLoadedState extends AddMovementCategoriesState {
  AddMovementCategoriesLoadedState({
    required this.topCategories,
    required this.pageIndex,
  });

  final List<TopCategoryModel> topCategories;
  final int pageIndex;

  @override
  List<Object?> get props => [topCategories, pageIndex];
}
