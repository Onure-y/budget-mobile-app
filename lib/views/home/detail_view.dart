import 'package:auto_size_text/auto_size_text.dart';
import 'package:budget_app_mobile/style/color_style.dart';
import 'package:budget_app_mobile/style/text_style.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

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
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Spacer(),
                Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: const Color(0xff000000),
                      radius: 80,
                      child:
                          Image.asset('assets/images/netflix-logo-detail.png'),
                    ),
                    const SizedBox(height: 20),
                    Column(
                      children: [
                        AutoSizeText(
                          'Netflix',
                          style: TextStylePackage.normalTextStlye,
                          minFontSize: 42,
                        ),
                        const SizedBox(height: 10),
                        AutoSizeText(
                          'Subscription',
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
                          '11/12/2021 - 14:35',
                          style: TextStylePackage.extraThinTextStlye,
                          minFontSize: 18,
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    AutoSizeText(
                      '\$12',
                      style: TextStylePackage.normalTextStlye,
                      minFontSize: 32,
                    ),
                  ],
                ),
                Spacer(),
                Container(
                  height: 100,
                  width: 100,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/go-down-icon.png'),
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
