import 'package:auto_size_text/auto_size_text.dart';
import 'package:budget_app_mobile/style/text_style.dart';
import 'package:flutter/material.dart';

class DrawerListTileComp extends StatelessWidget {
  const DrawerListTileComp({
    Key? key,
    required this.listTileName,
    required this.icon,
  }) : super(key: key);

  final listTileName;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        leading: icon,
        title: AutoSizeText(
          listTileName,
          style: TextStylePackage.normalTextStlye,
          minFontSize: 18,
        ),
      ),
    );
  }
}
