import 'package:auto_size_text/auto_size_text.dart';
import 'package:budget_app_mobile/style/color_style.dart';
import 'package:budget_app_mobile/style/text_style.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorPackage.primaryDarkColor,
        body: Container(
          child: Stack(
            children: [
              Container(
                height: size.height,
                width: size.width,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/register-bg.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                height: size.height * .7,
                width: size.width,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/photos-bg.png'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: AutoSizeText(
                  'Budget App',
                  style: TextStylePackage.appBarTextStyle,
                  minFontSize: 32,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: EdgeInsets.all(20.0),
                  width: size.width,
                  height: size.height * .4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      AutoSizeText(
                        'Let\'s Get Started',
                        style: TextStylePackage.mediumTextStlye,
                        minFontSize: 64,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: AutoSizeText(
                          'Continue',
                          style: TextStylePackage.normalTextStlye,
                          minFontSize: 28,
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: ColorPackage.secondryLightColor,
                          minimumSize: const Size(250, 55),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
