import 'package:auto_size_text/auto_size_text.dart';
import 'package:budget_app_mobile/helper/time_package.dart';
import 'package:budget_app_mobile/models/categoryModel/category_model.dart';
import 'package:budget_app_mobile/style/color_style.dart';
import 'package:budget_app_mobile/style/text_style.dart';
import 'package:flutter/material.dart';

class AddMovementFinalPage extends StatelessWidget {
  const AddMovementFinalPage({Key? key, required this.category})
      : super(key: key);

  final CategoryModel category;

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
            'Add Movement',
            style: TextStylePackage.normalTextStlye,
            minFontSize: 24,
          ),
        ),
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
          width: size.width,
          height: size.height,
          color: ColorPackage.primaryDarkColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      backgroundColor:
                          Color(int.parse(category.containerColor)),
                      radius: 80,
                      child: Image.asset(category.imagePath),
                    ),
                    const SizedBox(height: 20),
                    Column(
                      children: [
                        AutoSizeText(
                          category.categoryName,
                          style: TextStylePackage.normalTextStlye,
                          minFontSize: 42,
                        ),
                        const SizedBox(height: 10),
                        AutoSizeText(
                          category.topCategoryName,
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
                          TimePackage.getCurrentTime(),
                          style: TextStylePackage.extraThinTextStlye,
                          minFontSize: 18,
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Container(
                      width: 100,
                      child: TextFormField(
                        style: TextStylePackage.normalTextStlye,
                        decoration: InputDecoration(
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          prefix: AutoSizeText(
                            '\$ ',
                            style: TextStylePackage.normalTextStlye,
                            minFontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
