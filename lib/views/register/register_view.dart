import 'package:auto_size_text/auto_size_text.dart';
import 'package:budget_app_mobile/style/color_style.dart';
import 'package:budget_app_mobile/style/text_style.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

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
            'Budget App',
            style: TextStylePackage.appBarTextStyle,
            minFontSize: 32,
          ),
        ),
        backgroundColor: ColorPackage.primaryDarkColor,
        body: Container(
          height: size.height,
          width: size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/register-phone-bg.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: AutoSizeText(
                  'Create Your Account',
                  style: TextStylePackage.mediumTextStlye,
                  minFontSize: 36,
                  textAlign: TextAlign.center,
                ),
              ),
              Column(
                children: [
                  Container(
                    width: size.width * .8,
                    child: TextFormField(
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        label: AutoSizeText('Name',
                            style: TextStylePackage.normalTextStlye,
                            minFontSize: 18),
                        filled: true,
                        fillColor: ColorPackage.secondryLightColor,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  Container(
                    width: size.width * .8,
                    child: TextFormField(
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        label: AutoSizeText('Email',
                            style: TextStylePackage.normalTextStlye,
                            minFontSize: 18),
                        filled: true,
                        fillColor: ColorPackage.secondryLightColor,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  Container(
                    width: size.width * .8,
                    child: TextFormField(
                      obscureText: true,
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        label: AutoSizeText('Password',
                            style: TextStylePackage.normalTextStlye,
                            minFontSize: 18),
                        filled: true,
                        fillColor: ColorPackage.secondryLightColor,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {},
                child: AutoSizeText(
                  'Register',
                  style: TextStylePackage.mediumTextStlye,
                  minFontSize: 18,
                ),
                style: ElevatedButton.styleFrom(
                  primary: ColorPackage.secondryLightColor,
                  minimumSize: const Size(250, 50),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
