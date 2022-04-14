import 'package:auto_size_text/auto_size_text.dart';
import 'package:budget_app_mobile/style/color_style.dart';
import 'package:budget_app_mobile/style/text_style.dart';
import 'package:budget_app_mobile/widgets/recent_movement.dart';
import 'package:flutter/material.dart';

class AllTransactionPage extends StatelessWidget {
  const AllTransactionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
        body: SingleChildScrollView(
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
              Container(
                child: Column(
                  children: [
                    for (var i = 0; i < 10; i++)
                      const Padding(
                        padding: EdgeInsets.only(
                          left: 25,
                          right: 25,
                          top: 5,
                          bottom: 5,
                        ),
                        child: RecentMovementComp(
                          categoryName: 'Subscription',
                          movementName: 'Netflix',
                          moneyValue: '1100',
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
