import 'package:eschoolapp/controller/welcome_controller.dart';
import 'package:eschoolapp/routes/app_pages.dart';
import 'package:eschoolapp/routes/app_routes.dart';
import 'package:eschoolapp/utils/color.dart';
import 'package:eschoolapp/view/auth/login_screen.dart';
import 'package:eschoolapp/view/auth/reigster_screen.dart';
import 'package:eschoolapp/view/information/information_screen.dart';
import 'package:eschoolapp/view/welcome/components/formation_widget.dart';
import 'package:eschoolapp/view/welcome/components/guide_widget.dart';
import 'package:eschoolapp/view/welcome/widget_page.dart';
import 'package:eschoolapp/widgets/deffault_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WelcomePage extends StatelessWidget {
  WelcomePage({Key? key}) : super(key: key);
  final WelcomeController controller = Get.put(WelcomeController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<WelcomeController>(
        builder: (_) => Scaffold(
            appBar: ResponsiveWrapper.of(context).isSmallerThan("TABLET")
                ? AppBar(
                    backgroundColor: Colors.transparent,
                    iconTheme: IconThemeData(color: Colors.black87),
                    elevation: 0,
                    actions: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: _buildLoginRegister(),
                      )
                    ],
                  )
                : DeffaultAppBar(),
            drawer: _buildDrawerWelcome(),
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      ResponsiveWrapper.of(context).isSmallerThan("TABLET")
                          ? _mobileLandingSection1()
                          : _webLandingSection1(context),
                      SizedBox(
                        height: 50,
                      ),
                      ResponsiveWrapper.of(context).isSmallerThan("TABLET")
                          ? Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25.0),
                              child: Column(
                                children: [
                                  Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            CircleAvatar(
                                              backgroundColor:
                                                  Colors.white.withOpacity(0.5),
                                              radius: 30,
                                              child: Icon(
                                                LineIcons.book,
                                                size: 30,
                                                color: Colors.blue,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text("10K+",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 30,
                                                    color: primaryColor)),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "Total Courses",
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ],
                                    ),
                                    height: 120,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                        color:
                                            Colors.deepPurple.withOpacity(0.1),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                  ),
                                  SizedBox(
                                    height: 22,
                                  ),
                                  Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            CircleAvatar(
                                              backgroundColor:
                                                  Colors.white.withOpacity(0.5),
                                              radius: 30,
                                              child: Icon(
                                                LineIcons.book,
                                                size: 30,
                                                color: Colors.deepOrange,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text("500+",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 30,
                                                    color: primaryColor)),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "Expert Formateur",
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ],
                                    ),
                                    height: 120,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                        color:
                                            Colors.deepPurple.withOpacity(0.1),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                  ),
                                  SizedBox(
                                    height: 22,
                                  ),
                                  Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            CircleAvatar(
                                              backgroundColor:
                                                  Colors.white.withOpacity(0.5),
                                              radius: 30,
                                              child: Icon(
                                                LineIcons.university,
                                                size: 30,
                                                color: Colors.deepPurple,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text("800+",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 30,
                                                    color: primaryColor)),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "Total Etudiants",
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ],
                                    ),
                                    height: 120,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                        color:
                                            Colors.deepPurple.withOpacity(0.1),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                  )
                                ],
                              ),
                            )
                          : _webLandingSection2(context),
                      SizedBox(
                        height: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: primaryColor.withOpacity(0.1),
                          ),
                         
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Les Formation Disponible",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25),
                                ),
                                Text(
                                  "Notre centre de formation fournit plusieurs formations..",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Get.toNamed(AppRoutes.formation);
                                      },
                                      child: Container(
                                        height: 40,
                                        width: 180,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: Colors.white),
                                        child: Center(
                                            child: Text(
                                          "Voir tout les formations",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: primaryColor),
                                        )),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                buildFormationCatalogue(context),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  _buildFooterSection()
                ],
              ),
            )));
  }

  

  Column buildFormationCatalogue(BuildContext context) {
    return Column(
      children: [
        Obx(
          () => controller.isLoading.value
              ? CircularProgressIndicator()
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    for (int i = 0; i < 3; i++)
                      FormationWidget(
                        onPressed: () {
                          Get.to(LoginScreen());
                        },
                        image: controller.image[i],
                        title: controller.title[i],
                        categorie: controller.categorie[i],
                        bgCategorie: Colors.deepOrange,
                        formateur: controller.formateur[i].toString(),
                        prix: ' ${controller.prix[i]} DT',
                        dure: controller.duree[i],
                      ),
                  ],
                ),
        ),
       
       
     
      ],
    );
  }

  Container _buildFooterSection() {
    return Container(
      height: 240,
      color: Colors.blueAccent.withOpacity(0.2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            height: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  'assets/icons/logo-app.png',
                  width: 100,
                ),
                Text("ESCHOOL est un centre de formation qualifié qui  propose des formations \n en plusieures domaines pour le milieu professionnel est partculier"),
               
              ],
            ),
          ),
          SizedBox(
            height: 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "nos qualité",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text("Innovation"),
                Text("savoir faire"),
                Text("Expérience"),
                
              ],
            ),
          ),
          SizedBox(
            height: 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Contact",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(" +330781283191"),
                Text("8 bis rue du bois en val 60570 Mortefontaine En Thelle France"),
                
                Text("contact@ESCHOOL.com"),
              ],
            ),
          ),
         
        ],
      ),
    );
  }

  Padding _mobileLandingSection1() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Image.asset(
            'assets/icons/educ.png',
            width: 250,
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Obtenir une éducation de qualité est maintenant plus facile",
                style: TextStyle(
                    fontSize: 42,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Fournit le dernier système d'apprentissage en ligne et des matériels qui aident à développer vos connaissances",
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Get.to(GuideWidget());
                },
                child: Container(
                  height: 50,
                  width: 180,
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                      child: Text(
                    "Plus détails",
                    style: TextStyle(color: Colors.white),
                  )),
                ),
              ),
              SizedBox(
                width: 10,
              ),
             
            ],
          )
        ],
      ),
    );
  }

  Padding _webLandingSection2(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: Container(
        height: 150,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: primaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                Container(
                  child: Icon(
                    LineIcons.book,
                    size: 40,
                    color: Colors.blue,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  height: 80,
                  width: 80,
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("10K+",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 35,
                            color: primaryColor)),
                    Text(
                      "Total Courses",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20,
                      ),
                    ),
                  ],
                )
              ],
            ),
            Row(
              children: [
                Container(
                  child: Icon(
                    LineIcons.university,
                    size: 40,
                    color: Colors.deepOrange,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  height: 80,
                  width: 80,
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("500+",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 35,
                            color: primaryColor)),
                    Text(
                      "Expert Formateurs",
                      style: TextStyle(color: Colors.grey, fontSize: 20),
                    ),
                  ],
                )
              ],
            ),
            Row(
              children: [
                Container(
                  child: Icon(
                    LineIcons.users,
                    size: 40,
                    color: Colors.deepPurple,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  height: 80,
                  width: 80,
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("800+",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 35,
                            color: primaryColor)),
                    Text(
                      "Total Étudiants",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20,
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Row _webLandingSection1(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width / 2.7,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Obtenir une éducation de qualité est maintenant plus facile",
                style: TextStyle(
                    fontSize: 45,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Fournit le dernier système d'apprentissage en ligne et des matériels qui aident à développer vos connaissances",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              SizedBox(
                height: 20,
              ),
            
              Row(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Get.to(GuideWidget());
                    },
                    child: Container(
                      height: 50,
                      width: 180,
                      decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(15)),
                      child: Center(
                          child: Text(
                        "Plus détails",
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                 
                ],
              )
            ],
          ),
        ),
        SizedBox(
          width: 100,
        ),
        Image.asset(
          'assets/icons/educ.png',
          width: 460,
        ),
      ],
    );
  }

  Drawer _buildDrawerWelcome() {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 40, 20, 0),
        child: ListView(
          children: [
            Image.asset(
              'assets/icons/logo-app.png',
              width: 50,
            ),
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
                        LineIcons.home,
                        size: 25,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Acceuil",
                        style: TextStyle(fontSize: 20),
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
              height: 10,
            ),
            Divider(
              height: 1.5,
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () { Get.to(InfoScreen());},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        LineIcons.info,
                        size: 25,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "A propos",
                        style: TextStyle(fontSize: 20),
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
              height: 10,
            ),
            Divider(
              height: 1.5,
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        LineIcons.dumbbell,
                        size: 25,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Formations",
                        style: TextStyle(fontSize: 20),
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
              height: 10,
            ),
            Divider(
              height: 1.5,
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        LineIcons.newspaper,
                        size: 25,
                      ),
                      SizedBox(
                        width: 8,
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

  PreferredSizeWidget wAppbar(context) {
    return AppBar(
      iconTheme: IconThemeData(color: Colors.black87),
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      elevation: 0,
      title: Padding(
          padding: EdgeInsets.only(top: 10),
          child: Align(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  "assets/icons/logo-app.png",
                  width: 100,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2.2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () {},
                        child: Text(
                          "Acceuil",
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                      InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () { Get.to(InfoScreen());},
                        child: Text("À propos",
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.bold,
                                fontSize: 16)),
                      ),
                      InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () {
                          Get.to(InfoScreen());
                        },
                        child: Text("Formation",
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.bold,
                                fontSize: 16)),
                      ),
                     
                    ],
                  ),
                ),
                _buildLoginRegister(),
              ],
            ),
          )),
    );
  }

  Row _buildLoginRegister() {
    return Row(
      children: [
        InkWell(
          onTap: () {
            Get.toNamed(AppRoutes.login);
          },
          borderRadius: BorderRadius.circular(15),
          child: Container(
            decoration: BoxDecoration(color: Colors.transparent),
            child: Text(
              "Connexion",
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: primaryColor),
            ),
          ),
        ),
        SizedBox(
          width: 15,
        ),
        InkWell(
          onTap: () {
            Get.to(RegisterScreen());
          },
          borderRadius: BorderRadius.circular(15),
          child: Container(
            height: 40,
            width: 80,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: primaryColor),
            child: Center(
              child: Text(
                "Inscription",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}