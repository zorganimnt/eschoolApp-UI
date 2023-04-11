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
        appBar: wAppbar(context),
        drawer: _buildDrawerWelcome(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 50,), 
              Row(
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
                            Container(
                              height: 50,
                              width: 120,
                              decoration: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Center(
                                  child: Text(
                                "Commencer",
                                style: TextStyle(color: Colors.white),
                              )),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 50,
                              width: 120,
                              decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Center(
                                  child: Text(
                                "Plus détails",
                                style: TextStyle(color: primaryColor),
                              )),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: 100,), 
                  Image.asset(
                    'assets/icons/educ.png',
                    width: 460,
                  ),
                ],
              ),
              SizedBox(height: 50,), 
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Container(
                  
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Container(
                            child: Icon(LineIcons.book, size: 40, color: Colors.blue,),
                            decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(5) ),
                            height: 80,
                            width: 80,
                          ),
                          SizedBox(width: 10,), 
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("10K+", 
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35, color: primaryColor)), 
                              Text("Total Courses", 
                              style: TextStyle(color: Colors.grey, fontSize: 20, ),), 
                            ],
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            child: Icon(LineIcons.university, size: 40, color: Colors.deepOrange,),
                            decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(5) ),
                            height: 80,
                            width: 80,
                          ),
                          SizedBox(width: 10,), 
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("500+", 
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35, color: primaryColor)), 
                              Text("Expert Formateurs", 
                              style: TextStyle(color: Colors.grey, fontSize: 20),), 
                            ],
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            child: Icon(LineIcons.users, size: 40,color: Colors.deepPurple,),
                            decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(5) ),
                            height: 80,
                            width: 80,
                          ),
                          SizedBox(width: 10,), 
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("800+", 
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35, color: primaryColor)), 
                              Text("Total Étudiants", 
                              style: TextStyle(color: Colors.grey, fontSize: 20,),), 
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(color: primaryColor.withOpacity(0.1), 
                  borderRadius: BorderRadius.circular(10)),
                ),
              ), 
              SizedBox(height: 40,)
            ],
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

  PreferredSizeWidget wAppbar(context) {
    return AppBar(
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
                        onTap: () {},
                        child: Text("À propos",
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.bold,
                                fontSize: 16)),
                      ),
                      InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () {},
                        child: Text("Formation",
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.bold,
                                fontSize: 16)),
                      ),
                      InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () {},
                        child: Text("Actualités",
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.bold,
                                fontSize: 16)),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {},
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
                      onTap: () {},
                      borderRadius: BorderRadius.circular(15),
                      child: Container(
                        height: 40,
                        width: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: primaryColor),
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
                ),
              ],
            ),
          )),
    );
  }
}
