import 'package:auto_size_text/auto_size_text.dart';
import 'package:budget_app_mobile/cubits/addMovementFinalCubit/addMovementFinal_cubit.dart';
import 'package:budget_app_mobile/cubits/addMovementFinalCubit/addMovementFinal_state.dart';
import 'package:budget_app_mobile/helper/time_package.dart';
import 'package:budget_app_mobile/models/categoryModel/category_model.dart';
import 'package:budget_app_mobile/repositories/user_repositories.dart';
import 'package:budget_app_mobile/style/color_style.dart';
import 'package:budget_app_mobile/style/text_style.dart';
import 'package:budget_app_mobile/widgets/appLoading_comp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddMovementFinalPage extends StatelessWidget {
  const AddMovementFinalPage({Key? key, required this.category})
      : super(key: key);

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    UserRepository userRepository = context.read<UserRepository>();
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) =>
          AddMovementFinalCubit(userRepository: userRepository),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: ColorPackage.primaryDarkColor,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: AutoSizeText(
              'Add Movement',
              style: TextStylePackage.normalTextStlye,
              minFontSize: 24,
            ),
          ),
          bottomNavigationBar: Container(
            height: 75,
            width: size.width,
            decoration: BoxDecoration(
              color: ColorPackage.secondryDarkColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: AutoSizeText(
                    'Cancel',
                    style: TextStylePackage.normalTextStlye,
                    minFontSize: 20,
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: ColorPackage.cancelButtonColor,
                    minimumSize: const Size(140, 45),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        15.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 75),
                Builder(builder: (newContext) {
                  return ElevatedButton(
                    onPressed: () {
                      newContext
                          .read<AddMovementFinalCubit>()
                          .createNewMovement(category);
                    },
                    child: AutoSizeText(
                      'Add',
                      style: TextStylePackage.normalTextStlye,
                      minFontSize: 20,
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: ColorPackage.addButtonColor,
                      minimumSize: const Size(140, 45),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          15.0,
                        ),
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
          body: BlocBuilder<AddMovementFinalCubit, AddMovementFinalState>(
            builder: (context, state) {
              if (state is AddMovementFinalLoadingState) {
                return const AppLoadingComp();
              }
              if (state is AddMovementFinalLoadedState) {
                return Container(
                  width: size.width,
                  height: size.height,
                  color: ColorPackage.primaryDarkColor,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            CircleAvatar(
                              backgroundColor:
                                  Color(int.parse(category.containerColor)),
                              radius: 80,
                              child: Image.asset(category.imagePath),
                            ),
                            const SizedBox(height: 20),
                            Column(
                              children: [
                                AutoSizeText(
                                  category.categoryName,
                                  style: TextStylePackage.normalTextStlye,
                                  minFontSize: 42,
                                ),
                                const SizedBox(height: 10),
                                AutoSizeText(
                                  category.topCategoryName,
                                  style: TextStylePackage.extraThinTextStlye,
                                  minFontSize: 18,
                                ),
                                const SizedBox(height: 10),
                                AutoSizeText(
                                  TimePackage.getCurrentTime(),
                                  style: TextStylePackage.extraThinTextStlye,
                                  minFontSize: 18,
                                ),
                              ],
                            ),
                            const SizedBox(height: 30),
                            Container(
                              width: 100,
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                controller: state.moneyValueController,
                                style: TextStylePackage.normalTextStlye,
                                decoration: InputDecoration(
                                  enabledBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  prefix: AutoSizeText(
                                    '\$ ',
                                    style: TextStylePackage.normalTextStlye,
                                    minFontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
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
