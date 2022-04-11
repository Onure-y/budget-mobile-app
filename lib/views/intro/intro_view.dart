import 'package:auto_size_text/auto_size_text.dart';
import 'package:budget_app_mobile/style/color_style.dart';
import 'package:budget_app_mobile/style/text_style.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    List<String> images = [
      'assets/images/intro-1.png',
      'assets/images/intro-2.png',
      'assets/images/intro-3.png',
    ];

    List<String> strings = [
      'Aliş-veriş bilgilerinizi online olarak saklayarak hem zamandan hemde cebinizden tasarruf edebilirsiniz',
      'Tüm verilerinizi anlik olarak görebilir buna bağli olarak paranizi takip edebilirsiniz',
      'Aylik harcamalarinizi takip edebilir bunun sayesinde bütçenize yön verebilirsiniz',
    ];

    PageController controller = PageController();
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorPackage.primaryDarkColor,
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
        body: PageView.builder(
          controller: controller,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: size.width * .7,
                  height: size.width * .7,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        images[index],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: AutoSizeText(
                    strings[index],
                    style: TextStylePackage.normalTextStlye,
                    minFontSize: 24,
                    textAlign: TextAlign.center,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (var i = 0; i < 3; i++)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Container(
                          width: 15,
                          height: 15,
                          child: CustomPaint(
                            painter: DotPainter(
                                color: index == i
                                    ? ColorPackage.dotEnableColor
                                    : ColorPackage.dotDisableColor),
                          ),
                        ),
                      ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    index == 2
                        ? {}
                        : controller.nextPage(
                            duration: const Duration(milliseconds: 600),
                            curve: Curves.easeInOut);
                  },
                  child: AutoSizeText(
                    'Devam Et',
                    style: TextStylePackage.normalTextStlye,
                    minFontSize: 32,
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: ColorPackage.secondryLightColor,
                    minimumSize: const Size(225, 55),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}

class DotPainter extends CustomPainter {
  DotPainter({required this.color});
  final Color? color;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..strokeWidth = 10.0 // 1.
      ..style = PaintingStyle.fill // 2.
      ..color = color!; // 3

    double degToRad(double deg) => deg * (3.14 / 180.0);
    final path = Path()
      ..arcTo(
          // 4.
          Rect.fromCenter(
            center: Offset(size.height / 2, size.width / 2),
            height: size.height,
            width: size.width,
          ), // 5.
          degToRad(120), // 6.
          degToRad(360), // 7.
          true);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
