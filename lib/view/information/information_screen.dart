import 'package:eschoolapp/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          : wAppbar(context),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          padding: ResponsiveWrapper.of(context).isSmallerThan("DESKTOP")
              ? const EdgeInsets.symmetric(horizontal: 20, vertical: 10)
              : const EdgeInsets.symmetric(horizontal: 300, vertical: 10),
          child: Column(
            children: [
              SizedBox(height: 20,), 
              _buildCategory(
                  "Dévelopement web & mobile",
                  "assets/icons/dev.jpeg",
                  "Notre centre de formation  offre une formation en dévelopement web et mobile"),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Divider(
                  height: 1.5,
                ),
              ),
              _buildCategory("Mrketing digitale", "assets/icons/marketing.jpeg",
                  "Notre centre de formation  offre une formation en marketing digitale"),
            ],
          ),
        ),
      ),
    );
  }

  Column _buildCategory(titre, path, descript) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titre,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 12,
        ),
        Container(
          width: double.infinity,
          height: 150,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(path), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(10),
            color: Colors.blue,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              descript,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  '400 DT ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
                Text(
                  '/MOIS ',
                  style: TextStyle(fontSize: 18, color: Colors.black54),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 50,
              width: 180,
              decoration: BoxDecoration(
                  color: primaryColor.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(15)),
              child: Center(
                  child: Text(
                "Participer",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              )),
            ),
          ],
        )
      ],
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
                        onTap: () {},
                        child: Text("À propos",
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.bold,
                                fontSize: 16)),
                      ),
                      InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () {
                          // zid hedhi
                          //   Get.to(InfoScreen());
                        },
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
            //  Get.to(LoginScreen());
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
            //  Get.to(RegisterScreen());
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
