import 'package:auto_size_text/auto_size_text.dart';
import 'package:budget_app_mobile/style/color_style.dart';
import 'package:budget_app_mobile/style/text_style.dart';
import 'package:budget_app_mobile/widgets/circle_painter.dart';
import 'package:budget_app_mobile/widgets/recent_movement.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: ColorPackage.secondryDarkColor,
          elevation: 0,
          title: AutoSizeText(
            'Budget App',
            style: TextStylePackage.appBarTextStyle,
            minFontSize: 32,
          ),
        ),
        backgroundColor: ColorPackage.primaryDarkColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: size.width,
                height: size.height * 0.5,
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.3),
                      spreadRadius: 8,
                      blurRadius: 10,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  color: ColorPackage.secondryDarkColor,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(
                      100.0,
                    ),
                    bottomRight: Radius.circular(
                      100.0,
                    ),
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Flexible(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 50,
                            width: size.width * 0.3,
                            decoration: BoxDecoration(
                              color: ColorPackage.primaryDarkColor,
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(30.0),
                                topLeft: Radius.circular(30.0),
                              ),
                            ),
                            child: Center(
                              child: AutoSizeText('Balance',
                                  style: TextStylePackage.thinTextStlye,
                                  minFontSize: 16),
                            ),
                          ),
                          Container(
                            height: 50,
                            width: size.width * 0.3,
                            decoration: BoxDecoration(
                              color: ColorPackage.primaryDarkColor,
                            ),
                            child: Center(
                              child: AutoSizeText('Income',
                                  style: TextStylePackage.thinTextStlye,
                                  minFontSize: 16),
                            ),
                          ),
                          Container(
                            height: 50,
                            width: size.width * 0.3,
                            decoration: BoxDecoration(
                              color: ColorPackage.primaryDarkColor,
                              borderRadius: const BorderRadius.only(
                                bottomRight: Radius.circular(30.0),
                                topRight: Radius.circular(30.0),
                              ),
                            ),
                            child: Center(
                              child: AutoSizeText(
                                'Expenses',
                                style: TextStylePackage.thinTextStlye,
                                minFontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Flexible(
                      flex: 6,
                      child: Container(
                        width: size.width * .7,
                        height: size.width * .7,
                        decoration: BoxDecoration(boxShadow: const []),
                        child: CustomPaint(
                          painter: MySecondaryPainter(
                            360,
                            ColorPackage.primaryLightColor,
                            0,
                            30,
                          ),
                          foregroundPainter: MyPainter(
                            240,
                            ColorPackage.secondryLightColor,
                            30,
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AutoSizeText(
                                  'Balance',
                                  style: TextStylePackage.thinTextStlye,
                                  minFontSize: 18,
                                ),
                                AutoSizeText(
                                  '\$2,500',
                                  style: TextStylePackage.mediumTextStlye,
                                  minFontSize: 32,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 10.0),
              Container(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AutoSizeText(
                          'Recent Movements',
                          style: TextStylePackage.normalTextStlye,
                          minFontSize: 18,
                        ),
                        AutoSizeText(
                          '\$152.52',
                          style: TextStylePackage.normalTextStlye,
                          minFontSize: 18,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      child: Column(
                        children: [
                          for (var i = 0; i < 3; i++)
                            Column(
                              children: const [
                                RecentMovementComp(
                                  movementName: 'Netflix',
                                  categoryName: 'Subsscription',
                                  moneyValue: '12',
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                              ],
                            )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
