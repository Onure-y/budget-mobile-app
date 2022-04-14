import 'package:auto_size_text/auto_size_text.dart';
import 'package:budget_app_mobile/style/text_style.dart';
import 'package:flutter/material.dart';

class RecentMovementComp extends StatelessWidget {
  final String movementName;
  final String categoryName;
  final String moneyValue;

  const RecentMovementComp({
    Key? key,
    required this.movementName,
    required this.categoryName,
    required this.moneyValue,
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
              const CircleAvatar(radius: 30),
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
                    style: TextStylePackage.thinTextStlye,
                    minFontSize: 16,
                  ),
                ],
              ),
            ],
          ),
          AutoSizeText('\$$moneyValue',
              style: TextStylePackage.thinTextStlye, minFontSize: 18),
        ],
      ),
    );
  }
}
