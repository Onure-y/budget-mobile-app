import 'package:budget_app_mobile/cubits/addMovement/addMovementCategories_state.dart';
import 'package:bloc/bloc.dart';
import 'package:budget_app_mobile/models/categoryModel/category_model.dart';
import 'package:budget_app_mobile/models/topCategoryModel/topCategory_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class AddMovementCategoriesCubit extends Cubit<AddMovementCategoriesState> {
  AddMovementCategoriesCubit() : super(AddMovementCategoriesInitalState()) {
    emit(AddMovementCategoriesLoadingState());
    initState();
  }

  List<TopCategoryModel> topCategories = [];
  int pageIndex = 0;

  Future initState() async {
    await readJsonData();
    emit(
      AddMovementCategoriesLoadedState(
        topCategories: topCategories,
        pageIndex: pageIndex,
      ),
    );
  }

  Future emitPage() async {
    emit(
      AddMovementCategoriesLoadedState(
        topCategories: topCategories,
        pageIndex: pageIndex,
      ),
    );
  }

  Future readJsonData() async {
    final response = await rootBundle.loadString('assets/categories_data.json');
    final data = json.decode(response);
    List list = data['categories'];
    for (var i in list) {
      List<CategoryModel> subList = [];
      for (var j in i['subCategoryList']) {
        CategoryModel categoryModel = CategoryModel(
          categoryName: j['subCategoryName'],
          containerColor: j['boxColor'],
          imagePath: j['imagePath'],
          topCategoryName: i['categoryName'],
        );
        subList.add(categoryModel);
      }
      topCategories.add(TopCategoryModel(
          categoryName: i['categoryName'], categories: subList));
    }
  }

  Future changeCategoryPage(int index) async {
    pageIndex = index;
    await emitPage();
  }
}
