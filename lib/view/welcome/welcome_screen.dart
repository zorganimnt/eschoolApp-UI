import 'package:eschoolapp/routes/app_pages.dart';
import 'package:eschoolapp/routes/app_routes.dart';
import 'package:eschoolapp/utils/color.dart';
import 'package:eschoolapp/view/welcome/widget_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WelcomePage extends StatelessWidget {
  WelcomePage({Key? key}) : super(key: key);
  final _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: primaryColor, 
          size: 28),
        ),
        drawer: _buildDrawerWelcome(),
        bottomSheet: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Get.toNamed(AppRoutes.login);
                },
                child: CircleAvatar(
                  radius: 33,
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                  backgroundColor: primaryColor,
                ),
              )
            ],
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 2,
                  child: PageView(
                    controller: _controller,
                    children: [
                      _page1(),
                      _page2(),
                      _page3(),
                    ],
                  ),
                ),
                SizedBox(
                  height: 100,
                  child: SmoothPageIndicator(
                    controller: _controller,
                    count: 3,
                    onDotClicked: (index) => _controller.animateToPage(index,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn),
                    effect: WormEffect(
                      spacing: 16,
                      dotColor: Colors.black26,
                      activeDotColor: primaryColor,
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  Drawer _buildDrawerWelcome() {
    return Drawer(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              InkWell(
                onTap: () {
                  Get.toNamed(AppRoutes.info);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          LineIcons.infoCircle,
                          size: 20,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "Infomations",
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.grey,
                      size: 15,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          LineIcons.fileContract,
                          size: 20,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "Condition",
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.grey,
                      size: 15,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          LineIcons.envelope,
                          size: 20,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "Contacter nous",
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.grey,
                      size: 15,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
  }

  BuildPageIntro _page1() {
    return BuildPageIntro(
        imageDirec: "assets/icons/boost.png",
        title: "Boostez votre carrière",
        discription:
            "en choisissant notre centre de formation de qualité supérieure.");
  }

  BuildPageIntro _page2() {
    return BuildPageIntro(
        imageDirec: "assets/icons/skills.png",
        title: "Obtenez les compétences",
        discription:
            "dont vous avez besoin pour réussir dans votre domaine professionnel avec notre programme de formation.");
  }

  BuildPageIntro _page3() {
    return BuildPageIntro(
        imageDirec: "assets/icons/max.png",
        title: "Maximisez votre potentiel",
        discription:
            "et atteignez vos objectifs professionnels avec notre formation personnalisée et notre soutien dédié.");
  }
}
