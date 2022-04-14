import 'package:auto_size_text/auto_size_text.dart';
import 'package:budget_app_mobile/style/color_style.dart';
import 'package:budget_app_mobile/style/text_style.dart';
import 'package:budget_app_mobile/views/addMovement/addMovementCategories_view.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class AddMovementHomePage extends StatelessWidget {
  const AddMovementHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: AutoSizeText(
            'Add Movement',
            style: TextStylePackage.appBarTextStyle,
            minFontSize: 24,
          ),
        ),
        backgroundColor: ColorPackage.primaryDarkColor,
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
              ElevatedButton(
                onPressed: () {},
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
              ),
            ],
          ),
        ),
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const AddMovementCategoriesPage(),
                      ),
                    );
                  },
                  customBorder: const CircleBorder(),
                  child: DottedBorder(
                    color: Colors.white,
                    borderType: BorderType.Circle,
                    dashPattern: [30, 30, 30, 30],
                    child: Container(
                      width: 275,
                      height: 275,
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 128,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
