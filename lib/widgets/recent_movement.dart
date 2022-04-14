import 'package:auto_size_text/auto_size_text.dart';
import 'package:budget_app_mobile/helper/time_package.dart';
import 'package:budget_app_mobile/style/text_style.dart';
import 'package:flutter/material.dart';

class RecentMovementComp extends StatelessWidget {
  final String movementName;
  final String categoryName;
  final String moneyValue;
  final String imagePath;
  final String containerColor;
  final int time;

  const RecentMovementComp({
    Key? key,
    required this.movementName,
    required this.categoryName,
    required this.moneyValue,
    required this.imagePath,
    required this.containerColor,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(int.parse(containerColor)),
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
              // CircleAvatar(
              //   radius: 30,
              //   child: Image.asset(imagePath),
              //   backgroundColor: Color(int.parse(containerColor)),
              // ),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    movementName,
                    style: TextStylePackage.normalTextStlye,
                    minFontSize: 16,
                  ),
                  AutoSizeText(
                    categoryName,
                    style: TextStylePackage.extraThinTextStlye,
                    minFontSize: 8,
                  ),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              AutoSizeText(
                '\$$moneyValue',
                style: TextStylePackage.thinTextStlye,
                minFontSize: 18,
              ),
              AutoSizeText(
                TimePackage.getMovementTime(time),
                style: TextStylePackage.extraThinTextStlye,
                minFontSize: 8,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
