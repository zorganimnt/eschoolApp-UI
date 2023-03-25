
import 'package:eschoolapp/view/welcome/widget_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WelcomePage extends StatelessWidget {
  WelcomePage({Key? key}) : super(key: key);
  final _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomSheet: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                 // Get.to(LoginScreen());
                },
                child: CircleAvatar(
                  radius: 33,
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                  backgroundColor: Colors.red,
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
                  height: 120,
                  child: Padding(
                      padding: const EdgeInsets.only(top: 60.0),
                      child: Text(
                        'E-Schoolapp Training',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 19),
                      )),
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
                      activeDotColor: Colors.red,
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  BuildPageIntro _page1() {
    return BuildPageIntro(
        imageDirec: "assets/icons/boost.png",
        title: "Boostez votre carrière",
        discription: "en choisissant notre centre de formation de qualité supérieure.");
  }

  BuildPageIntro _page2() {
    return BuildPageIntro(
        imageDirec: "assets/icons/skills.png",
        title: "Obtenez les compétences",
        discription: "dont vous avez besoin pour réussir dans votre domaine professionnel avec notre programme de formation.");
  }

  BuildPageIntro _page3() {
    return BuildPageIntro(
        imageDirec: "assets/icons/max.png",
        title: "Maximisez votre potentiel",
        discription: "et atteignez vos objectifs professionnels avec notre formation personnalisée et notre soutien dédié.");
  }
}
