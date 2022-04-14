import 'package:budget_app_mobile/style/color_style.dart';
import 'package:flutter/material.dart';

class AppLoadingComp extends StatelessWidget {
  const AppLoadingComp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: CircularProgressIndicator(
          color: ColorPackage.primaryLightColor,
          strokeWidth: 4,
        ),
      ),
    );
  }
}
