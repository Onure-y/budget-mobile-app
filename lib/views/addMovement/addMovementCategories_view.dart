import 'package:auto_size_text/auto_size_text.dart';
import 'package:budget_app_mobile/cubits/addMovementCategory/addMovementCategories_cubit.dart';
import 'package:budget_app_mobile/cubits/addMovementCategory/addMovementCategories_state.dart';
import 'package:budget_app_mobile/models/topCategoryModel/topCategory_model.dart';
import 'package:budget_app_mobile/style/color_style.dart';
import 'package:budget_app_mobile/style/text_style.dart';
import 'package:budget_app_mobile/views/addMovement/addMovementFinal_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddMovementCategoriesPage extends StatelessWidget {
  const AddMovementCategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorPackage.primaryDarkColor,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: ColorPackage.secondryDarkColor,
          elevation: 0,
          title: AutoSizeText(
            'Choose Movement Type',
            style: TextStylePackage.normalTextStlye,
            minFontSize: 24,
          ),
        ),
        body: BlocProvider(
          create: (context) => AddMovementCategoriesCubit(),
          child: BlocBuilder<AddMovementCategoriesCubit,
              AddMovementCategoriesState>(
            builder: (context, state) {
              if (state is AddMovementCategoriesLoadingState) {
                return const CircularProgressIndicator();
              }
              if (state is AddMovementCategoriesLoadedState) {
                return Container(
                  child: Column(
                    children: [
                      Container(
                        height: 60,
                        width: size.width,
                        color: ColorPackage.secondryDarkColor,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            for (var i = 0; i < state.topCategories.length; i++)
                              Builder(builder: (newContext) {
                                return ElevatedButton(
                                  onPressed: () {
                                    newContext
                                        .read<AddMovementCategoriesCubit>()
                                        .changeCategoryPage(i);
                                  },
                                  child: AutoSizeText(
                                    state.topCategories[i].categoryName,
                                    style: state.pageIndex == i
                                        ? TextStylePackage.mediumTextStlye
                                        : TextStylePackage.extraThinTextStlye,
                                    minFontSize: 18,
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    primary: state.pageIndex == i
                                        ? ColorPackage.secondryLightColor
                                        : ColorPackage.secondryDarkColor,
                                    elevation: 0,
                                    minimumSize: const Size(150, 50),
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10.0),
                                        topRight: Radius.circular(10.0),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Builder(builder: (newContext) {
                            return PageView.builder(
                              onPageChanged: (int index) => newContext
                                  .read<AddMovementCategoriesCubit>()
                                  .changeCategoryPage(index),
                              itemBuilder: (BuildContext context, int index) =>
                                  GridView.builder(
                                      padding: const EdgeInsets.all(30.0),
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        crossAxisSpacing: 10,
                                        mainAxisSpacing: 10,
                                      ),
                                      itemCount: state
                                          .topCategories[state.pageIndex]
                                          .categories
                                          .length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return InkWell(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (BuildContext
                                                        context) =>
                                                    AddMovementFinalPage(
                                                        category: state
                                                            .topCategories[
                                                                state.pageIndex]
                                                            .categories[index]),
                                              ),
                                            );
                                          },
                                          child: CategoryComp(
                                            categoryName: state
                                                .topCategories[state.pageIndex]
                                                .categories[index]
                                                .categoryName,
                                            boxColor: Color(
                                              int.parse(
                                                state
                                                    .topCategories[
                                                        state.pageIndex]
                                                    .categories[index]
                                                    .containerColor,
                                              ),
                                            ),
                                            imagePath: state
                                                .topCategories[state.pageIndex]
                                                .categories[index]
                                                .imagePath,
                                          ),
                                        );
                                      }),
                            );
                          }),
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }
}

class CategoryComp extends StatelessWidget {
  const CategoryComp({
    Key? key,
    required this.categoryName,
    required this.boxColor,
    required this.imagePath,
  }) : super(key: key);

  final Color boxColor;
  final String categoryName;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: 75,
            width: 75,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: boxColor,
              image: DecorationImage(
                image: AssetImage(imagePath),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          AutoSizeText(
            categoryName,
            style: TextStylePackage.normalTextStlye,
            minFontSize: 16,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
