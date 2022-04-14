import 'package:auto_size_text/auto_size_text.dart';
import 'package:budget_app_mobile/style/color_style.dart';
import 'package:budget_app_mobile/style/text_style.dart';
import 'package:budget_app_mobile/views/addMovement/addMovementHome_view.dart';
import 'package:budget_app_mobile/views/allTransaction/allTransaction_view.dart';
import 'package:budget_app_mobile/views/home/detail_view.dart';
import 'package:budget_app_mobile/widgets/circle_painter.dart';
import 'package:budget_app_mobile/widgets/drawer_comp.dart';
import 'package:budget_app_mobile/widgets/recent_movement.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<IconData> icons = [
      Icons.add,
      Icons.pie_chart,
      Icons.bar_chart,
      Icons.list_alt,
      Icons.info_outline
    ];

    List<String> listTileNames = [
      'Add Movement',
      'Overview',
      'Monthly Overview',
      'All Transactions',
      'App Info',
    ];
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          backgroundColor: ColorPackage.secondryLightColor,
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: ColorPackage.primaryDarkColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 25,
                    ),
                    AutoSizeText(
                      'Onur Emre YILDIRIM',
                      style: TextStylePackage.normalTextStlye,
                      minFontSize: 18,
                    ),
                    AutoSizeText(
                      'onuremre555@gmail.com',
                      style: TextStylePackage.extraThinTextStlye,
                      minFontSize: 12,
                    ),
                  ],
                ),
              ),
              for (var i = 0; i < 5; i++)
                InkWell(
                  onTap: () {
                    if (i == 0) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const AddMovementHomePage(),
                        ),
                      );
                    }

                    if (i == 3) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const AllTransactionPage(),
                        ),
                      );
                    }
                  },
                  child: DrawerListTileComp(
                    listTileName: listTileNames[i],
                    icon: Icon(
                      icons[i],
                      color: Colors.white,
                      size: 26,
                    ),
                  ),
                )
            ],
          ),
        ),
        appBar: AppBar(
          leading: Builder(builder: (drawerContext) {
            return IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(drawerContext).openDrawer();
              },
            );
          }),
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
                          ElevatedButton(
                            onPressed: () {},
                            child: AutoSizeText(
                              'Balance',
                              style: TextStylePackage.normalTextStlye,
                              minFontSize: 18,
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: ColorPackage.primaryDarkColor,
                              minimumSize: const Size(120, 45),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20.0),
                                  topLeft: Radius.circular(20.0),
                                ),
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: AutoSizeText(
                              'Income',
                              style: TextStylePackage.normalTextStlye,
                              minFontSize: 18,
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: ColorPackage.secondryLightColor,
                              minimumSize: const Size(120, 45),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: AutoSizeText(
                              'Expenses',
                              style: TextStylePackage.normalTextStlye,
                              minFontSize: 18,
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: ColorPackage.secondryLightColor,
                              minimumSize: const Size(120, 45),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(20.0),
                                  topRight: Radius.circular(20.0),
                                ),
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
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const DetailPage(),
                                      ),
                                    );
                                  },
                                  child: const RecentMovementComp(
                                    movementName: 'Netflix',
                                    categoryName: 'Subsscription',
                                    moneyValue: '12',
                                    containerColor: '0xff4F75FE',
                                    imagePath: 'assets/images/homeExp-logo.png',
                                    time: 125234623,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            )
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: AutoSizeText(
                        'Show All Expenses',
                        style: TextStylePackage.normalTextStlye,
                        minFontSize: 18,
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: ColorPackage.secondryDarkColor,
                        minimumSize: const Size(225, 55),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
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
