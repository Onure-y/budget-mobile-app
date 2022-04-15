import 'package:auto_size_text/auto_size_text.dart';
import 'package:budget_app_mobile/helper/time_package.dart';
import 'package:budget_app_mobile/models/movementModel/movement_model.dart';
import 'package:budget_app_mobile/style/color_style.dart';
import 'package:budget_app_mobile/style/text_style.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key, required this.movement}) : super(key: key);

  final MovementModel movement;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: ColorPackage.primaryDarkColor,
          elevation: 0,
          title: AutoSizeText(
            'Details',
            style: TextStylePackage.normalTextStlye,
            minFontSize: 24,
          ),
        ),
        body: Container(
          width: size.width,
          height: size.height,
          color: ColorPackage.primaryDarkColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  CircleAvatar(
                    backgroundColor:
                        Color(int.parse(movement.category.containerColor)),
                    radius: 80,
                    child: Image.asset(movement.category.imagePath),
                  ),
                  const SizedBox(height: 20),
                  Column(
                    children: [
                      AutoSizeText(
                        movement.movementName,
                        style: TextStylePackage.normalTextStlye,
                        minFontSize: 42,
                      ),
                      const SizedBox(height: 10),
                      AutoSizeText(
                        movement.category.topCategoryName,
                        style: TextStylePackage.extraThinTextStlye,
                        minFontSize: 18,
                      ),
                      const SizedBox(height: 10),
                      Container(
                        width: 100,
                        child: const Divider(
                          color: Colors.white,
                          thickness: 1,
                        ),
                      ),
                      const SizedBox(height: 10),
                      AutoSizeText(
                        TimePackage.getMovementTime(movement.time),
                        style: TextStylePackage.extraThinTextStlye,
                        minFontSize: 18,
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  AutoSizeText(
                    '\$ ${movement.moneyValue.toStringAsFixed(2)}',
                    style: TextStylePackage.normalTextStlye,
                    minFontSize: 32,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
