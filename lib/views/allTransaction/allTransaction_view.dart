import 'package:auto_size_text/auto_size_text.dart';
import 'package:budget_app_mobile/cubits/allTransaction/allTransaction_cubit.dart';
import 'package:budget_app_mobile/cubits/allTransaction/allTransaction_state.dart';
import 'package:budget_app_mobile/helper/time_package.dart';
import 'package:budget_app_mobile/models/movementModel/movement_model.dart';
import 'package:budget_app_mobile/repositories/user_repositories.dart';
import 'package:budget_app_mobile/style/color_style.dart';
import 'package:budget_app_mobile/style/text_style.dart';
import 'package:budget_app_mobile/widgets/appLoading_comp.dart';
import 'package:budget_app_mobile/widgets/recent_movement.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllTransactionPage extends StatelessWidget {
  const AllTransactionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    UserRepository userRepository = context.read<UserRepository>();
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorPackage.primaryDarkColor,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: AutoSizeText(
            'All Transactions',
            style: TextStylePackage.appBarTextStyle,
            minFontSize: 24,
          ),
        ),
        body: BlocProvider(
          create: (context) =>
              AllTransactionCubit(userRepository: userRepository),
          child: BlocBuilder<AllTransactionCubit, AllTransactionState>(
            builder: (context, state) {
              if (state is AllTransactionLoadingState) {
                return const AppLoadingComp();
              }
              if (state is AllTransactionLoadedState) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        width: size.width,
                        height: 100,
                        child: Row(
                          children: [
                            Expanded(
                              child: ElevatedButton.icon(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.sort_outlined,
                                  size: 32,
                                ),
                                label: AutoSizeText(
                                  ' Sort',
                                  style: TextStylePackage.normalTextStlye,
                                  minFontSize: 24,
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.transparent,
                                  minimumSize: const Size(200, 100),
                                  elevation: 0,
                                ),
                              ),
                            ),
                            Expanded(
                              child: ElevatedButton.icon(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.filter_list,
                                  size: 32,
                                ),
                                label: AutoSizeText(
                                  ' Filter',
                                  style: TextStylePackage.normalTextStlye,
                                  minFontSize: 24,
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.transparent,
                                  minimumSize: const Size(200, 100),
                                  elevation: 0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: size.width * .6,
                        child: const Divider(
                          color: Colors.white,
                          height: 10,
                          thickness: 3,
                        ),
                      ),
                      const SizedBox(height: 20),
                      state.movements.isNotEmpty
                          ? Container(
                              child: Column(
                                children: [
                                  for (MovementModel movement
                                      in state.movements)
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 25,
                                        right: 25,
                                        top: 5,
                                        bottom: 5,
                                      ),
                                      child: RecentMovementComp(
                                        categoryName:
                                            movement.category.topCategoryName,
                                        movementName:
                                            movement.category.categoryName,
                                        moneyValue: movement.moneyValue
                                            .toStringAsFixed(2),
                                        imagePath: movement.category.imagePath,
                                        containerColor:
                                            movement.category.containerColor,
                                        time: movement.time,
                                      ),
                                    )
                                ],
                              ),
                            )
                          : Container(
                              height: size.height * .5,
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: AutoSizeText(
                                    'We Couldn\'t find any movement data',
                                    style: TextStylePackage.mediumTextStlye,
                                    minFontSize: 32,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
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
